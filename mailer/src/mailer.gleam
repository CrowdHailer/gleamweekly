import feed
import gleam/bit_array
import gleam/int
import gleam/list
import gleam/option.{None, Some}
import gleam/result.{try}
import gleam/string
import mailer/content
import mailer/template
import mailer/template/archive
import mailer/template/email
import simplifile

pub fn current_issue_number() {
  list.length(content.issues)
}

pub fn email(root) {
  let assert [latest, ..] = content.issues
  email.render(root, latest, current_issue_number())
}

pub type Share {
  Share(comment: String, title: String, issue_url: String)
}

pub fn share() {
  let assert [latest, ..] = content.issues
  let number = current_issue_number()
  case latest.1 {
    Some(comment) ->
      Ok(Share(
        comment: comment,
        title: "This week in Gleam. Issue " <> int.to_string(number),
        issue_url: template.issue_url(number),
      ))
    None -> Error("no comment data for this issue")
  }
}

pub fn render_issues() {
  list.reverse(content.issues)
  |> list.index_map(archive_issue)
}

const static = [
  "index.html", "lucymail.png", "lucymail.svg", "tribe.f61a533e.css",
]

pub fn content(root) {
  use static <- try(
    list.try_map(static, fn(file) {
      let path = string.replace(root, "/mailer", "/website/" <> file)
      use content <- try(simplifile.read_bits(path))
      Ok(#("/" <> file, content))
    }),
  )

  let files = list.append(static, render_issues())
  let index = archive.render_index(content.issues)
  let assert Ok(feed) = feed.content()

  let files =
    list.append(files, [#("/issues/index.html", <<index:utf8>>), feed])
  Ok(files)
}

pub fn issue_path(number) {
  string.concat(["/issues/", int.to_string(number), "/index.html"])
}

fn archive_issue(issue, index) {
  let number = index + 1
  #(issue_path(number), bit_array.from_string(archive.render(issue, number)))
}
