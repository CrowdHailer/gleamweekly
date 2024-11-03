// The website dir contains source files, for the index and image pages,
// but output pages for the individual issues.

// social integrations are hardcoded to my user id's which are committed to source.
// This are not id that can be used without authentication as myself.

import gleam/int
import gleam/option.{Some}
import gleam/result
import mailer
import midas/sdk/linkedin
import midas/sdk/twitter
import midas/task as t
import snag

// https://developer.twitter.com/en/portal/projects-and-apps
pub fn task(args, twitter_app, linkedin_app) {
  case args {
    ["share", "twitter"] -> share_on_twitter(twitter_app)
    ["share", "linkedin"] -> share_on_linkedin(linkedin_app)

    _ -> t.abort(snag.new("no task for gleam weekly"))
  }
}

fn twitter_authenticate(client_id, redirect_uri, local, scopes) {
  let state = int.to_string(int.random(1_000_000_000))
  let state = case local {
    True -> "LOCAL" <> state
    False -> state
  }
  let challenge = int.to_string(int.random(1_000_000_000))
  twitter.do_authenticate(client_id, redirect_uri, scopes, state, challenge)
}

fn share_on_twitter(app) {
  let scopes = ["tweet.read", "tweet.write", "users.read"]
  let #(client_id, redirect_uri) = app
  use token <- t.do(twitter_authenticate(client_id, redirect_uri, True, scopes))

  use share <- t.try(mailer.share() |> result.map_error(snag.new))
  let mailer.Share(comment, title, issue_url) = share

  let content = title <> " now available. " <> issue_url <> "\n\n" <> comment

  use _response <- t.do(twitter.create_tweet(token, content))
  t.done(Nil)
}

fn share_on_linkedin(app) {
  let me = linkedin.Person("YcszgIuyEv")
  let scopes = ["w_member_social", "openid", "profile", "email"]
  use share <- t.try(mailer.share() |> result.map_error(snag.new))
  let mailer.Share(comment, title, issue_url) = share

  use token <- t.do(linkedin.authenticate(app, scopes))

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
