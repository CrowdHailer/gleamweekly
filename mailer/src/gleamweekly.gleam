import gleam/io
import gleam/javascript/array
import gleam/javascript/promise
import gleam/list
import gleam/option.{Some}
import gleam/result
import gleam/string
import mailer
import midas/js/run as r
import midas/node
import midas/node/browser
import midas/node/file_system as fs
import midas/sdk/bluesky
import midas/sdk/linkedin
import midas/sdk/netlify
import midas/sdk/twitter
import midas/task as t
import plinth/javascript/date
import plinth/node/process
import simplifile
import snag
import spotless

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
  use _ <- t.do(netlify.deploy_site(token, site_id, content))
  use _ <- t.do(t.log("Deployed"))
  t.done(Nil)
}

const bluesky_name = "crowdhailer.bsky.social"

pub fn run(args) {
  let assert Ok(project) = fs.current_directory()
  let root = string.replace(project, "/gleamweekly/mailer", "/gleamweekly")
  case args {
    ["preview"] -> {
      use _ <- r.try(
        mailer.build(mailer_dir())
        |> result.map_error(fn(err) { snag.new(string.inspect(err)) }),
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

      use response <- r.await(node.run(do_deploy(content), root))

      io.debug(response)
      r.done(Nil)
    }
    _ -> {
      let task = case args {
        ["share", "twitter"] -> share_on_twitter()
        ["share", "linkedin"] -> share_on_linkedin()
        ["share", "bluesky", password] ->
          share_on_bluesky(#(bluesky_name, password))

        _ -> t.abort(snag.new("no task for gleam weekly"))
      }
      node.run(task, root)
    }
  }
}

fn share_on_bluesky(cred) {
  let #(handle, password) = cred

  use access_token <- t.do(bluesky.create_session(handle, password))

  let now = date.now()
  let now = date.to_iso_string(now)

  use share <- t.try(mailer.share() |> result.map_error(snag.new))
  let mailer.Share(comment, title, issue_url) = share

  let text = title <> " now available. " <> issue_url <> "\n\n" <> comment

  use url <- t.do(bluesky.create_post(access_token, handle, text, now))
  use Nil <- t.do(t.log(url))
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
