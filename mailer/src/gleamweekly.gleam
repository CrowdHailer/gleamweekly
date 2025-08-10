import at_protocol/operations
import deploy
import email_octopus
import gleam/dict
import gleam/http/request
import gleam/io
import gleam/javascript/array
import gleam/javascript/promise
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import gleam/string
import mailer
import midas/js/run as r
import midas/node
import midas/node/browser
import midas/node/file_system as fs
import midas/sdk/linkedin
import midas/sdk/twitter
import midas/task as t
import oas/generator/utils
import plinth/javascript/date
import plinth/node/process
import simplifile
import snag
import spotless
import spotless/demonstrating_proof_of_possession as dpop

pub fn main() {
  do_main(list.drop(array.to_list(process.argv()), 2))
}

fn do_main(args) {
  use result <- promise.map(run(args))
  case result {
    Ok(Nil) -> Nil
    Error(reason) -> io.println(snag.pretty_print(reason))
  }
}

const site_id = "707096ea-de6d-4dca-a5c5-18d535da6413"

// assumes that scripts are being run from the control project
fn mailer_dir() {
  let assert Ok(cwd) = simplifile.current_directory()
  string.replace(cwd, "/gleamweekly/mailer", "/gleamweekly/mailer")
}

fn website_dir() {
  let assert Ok(cwd) = simplifile.current_directory()
  string.replace(cwd, "/gleamweekly/mailer", "/gleamweekly/website")
}

fn do_deploy(content) {
  use token <- t.do(spotless.netlify(8080, []))
  deploy.run(token, site_id, content)
}

pub fn run(args) {
  let assert Ok(project) = fs.current_directory()
  let root = string.replace(project, "/gleamweekly/mailer", "/gleamweekly")
  case args {
    ["preview"] -> {
      use content <- r.try(
        mailer.content(mailer_dir())
        |> result.map_error(fn(err) { snag.new(string.inspect(err)) }),
      )

      let email = mailer.email(mailer_dir())
      use Nil <- r.try(
        simplifile.write_bits(root <> "/email.html", <<email:utf8>>)
        |> result.map_error(fn(error) { snag.new(string.inspect(error)) }),
      )

      use Nil <- r.try(
        list.try_each(content, fn(file) {
          let #(path, content) = file
          let path = root <> "/website" <> path

          simplifile.write_bits(path, content)
          |> result.map_error(fn(error) { snag.new(string.inspect(error)) })
        }),
      )

      browser.open(string.append(
        website_dir(),
        mailer.issue_path(mailer.current_issue_number()),
      ))
      use _ <- promise.await(promise.wait(30_000))
      r.done(Nil)
    }
    ["deploy"] -> {
      use content <- r.try(
        mailer.content(mailer_dir())
        |> result.map_error(fn(err) { snag.new(string.inspect(err)) }),
      )

      use Nil <- r.await(node.run(do_deploy(content), root))

      io.println("deployed")
      r.done(Nil)
    }
    _ -> {
      let task = case args {
        ["stats"] -> stats()
        ["share", "twitter"] -> share_on_twitter()
        ["share", "linkedin"] -> share_on_linkedin()
        ["share", "bluesky"] -> share_on_bsky()
        _ -> t.abort(snag.new("no task for gleam weekly"))
      }
      node.run(task, root)
    }
  }
}

// OAuth tokens are meant for PDS access only
// Sending an OAuth token as a bearer token results in "Bad token scope"
// https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle=crowdhailer.bsky.social
// did:plc:goi6zchuico5fqsoiycwcexy
// https://plc.directory/did:plc:goi6zchuico5fqsoiycwcexy
// https://yellowfoot.us-west.host.bsky.network/xrpc/com.atproto.identity.resolveHandle?handle=crowdhailer.bsky.social
// PDS is the protected resource
// https://yellowfoot.us-west.host.bsky.network/.well-known/oauth-protected-resource

// Needs auth
// https://yellowfoot.us-west.host.bsky.network/xrpc/app.bsky.actor.getProfile

// If not auth is set the PDS doesn't return a nonce

pub type Context(key) {
  Context(host: String, keypair: t.KeyPair(key), token: String, nonce: String)
}

fn sign_request(context, request) {
  let Context(host:, token:, keypair:, nonce:) = context
  let request = request.set_host(request, host)
  use jwt <- t.do(dpop.jwt_for_request(
    request,
    keypair,
    Some(nonce),
    Some(token),
  ))

  let request =
    request
    |> request.prepend_header("authorization", "DPoP " <> token)
    |> request.prepend_header("dpop", jwt)
  t.done(request)
}

fn send_request(context, original, handle_response) {
  use signed <- t.do(sign_request(context, original))
  use response <- t.do(t.fetch(signed))
  use response <- t.do(case response.status {
    401 ->
      case list.key_find(response.headers, "dpop-nonce") {
        // retry only once with new nonce
        Ok(nonce) if nonce != context.nonce -> {
          let context = Context(..context, nonce:)
          use signed <- t.do(sign_request(context, original))
          t.fetch(signed)
        }
        _ -> t.done(response)
      }
    _ -> {
      t.done(response)
    }
  })
  case handle_response(response) {
    Ok(reply) -> t.done(#(context, reply))
    Error(r) -> t.abort(snag.new("failed to decode \n" <> string.inspect(r)))
  }
}

fn app_bsky_actor_get_profile(context, handle) {
  let base = request.set_body(request.new(), <<>>)
  let request = operations.app_bsky_actor_get_profile_request(base, handle)
  send_request(context, request, operations.app_bsky_actor_get_profile_response)
}

fn com_atproto_repo_create_record(context, data) {
  let base = request.set_body(request.new(), <<>>)
  let request = operations.com_atproto_repo_create_record_request(base, data)
  send_request(
    context,
    request,
    operations.com_atproto_repo_create_record_response,
  )
}

fn create_post(context, handle, text, now) {
  let repo = handle
  let collection = "app.bsky.feed.post"
  // let now = date.now()
  // let at = date.to_iso_string(now)
  let record =
    utils.Object(
      dict.from_list([
        #("$type", utils.String("app.bsky.feed.post")),
        #("text", utils.String(text)),
        #("createdAt", utils.String(now)),
      ]),
    )
  let payload =
    operations.ComAtprotoRepoCreateRecordRequest(
      None,
      None,
      record,
      repo,
      None,
      collection,
    )
  com_atproto_repo_create_record(context, payload)
}

fn share_on_bsky() {
  use keypair <- t.do(dpop.generate_key())
  use auth <- t.do(spotless.bsky(
    8080,
    ["atproto", "transition:generic"],
    "x",
    keypair,
  ))
  let host = "yellowfoot.us-west.host.bsky.network"
  let context = Context(host, keypair, auth.access_token, "")
  // use profile <- t.do(app_bsky_actor_get_profile(
  //   context,
  //   "crowdhailer.bsky.social",
  // ))

  let now = date.now()
  let now = date.to_iso_string(now)

  use share <- t.try(mailer.share() |> result.map_error(snag.new))
  let mailer.Share(comment, title, issue_url) = share

  let text = title <> " now available. " <> issue_url <> "\n\n" <> comment
  let handle = "crowdhailer.bsky.social"

  use response <- t.do(create_post(context, handle, text, now))
  echo response
  // use Nil <- t.do(t.log(url))
  t.done(Nil)
}

fn share_on_twitter() {
  let scopes = ["tweet.read", "tweet.write", "users.read"]

  use token <- t.do(spotless.twitter(8080, scopes))

  use share <- t.try(mailer.share() |> result.map_error(snag.new))
  let mailer.Share(comment, title, issue_url) = share

  let content = title <> " now available. " <> issue_url <> "\n\n" <> comment

  use _response <- t.do(twitter.create_tweet(token, content))
  t.done(Nil)
}

fn share_on_linkedin() {
  let me = linkedin.Person("YcszgIuyEv")
  let scopes = ["w_member_social", "openid", "profile", "email"]
  use token <- t.do(spotless.linkedin(8080, scopes))
  use share <- t.try(mailer.share() |> result.map_error(snag.new))
  let mailer.Share(comment, title, issue_url) = share

  use bits <- t.do(t.read("/website/lucymail.png"))
  use image <- t.do(linkedin.upload_image(token, me, bits))
  let content =
    linkedin.Article(
      // The desciption doesn't seem to show up in stories
      Some(
        "GleamWeekly is handpicked articles and community news delivered to your inbox in one weekly email.",
      ),
      issue_url,
      Some(image),
      Some("The Gleam mascot, Lucy, holding an envelope."),
      title,
    )
  use share <- t.do(linkedin.create_post(token, me, Some(content), comment))
  t.log("created linkedin post with identifier: " <> share)
}

fn stats() {
  let token = ""
  use response <- t.do(email_octopus.api_campaigns_get(token, None, None))
  let assert Ok(response) = response
  echo list.map(response.data |> option.unwrap([]), fn(c) {
    #(c.name, c.sent_at, c.status)
  })
  t.done(Nil)
}
