import feed
import gleam/bit_array
import gleam/int
import gleam/io
import gleam/list
import gleam/result.{try}
import gleam/string
import mailer/content
import mailer/template/archive
import mailer/template/email
import simplifile

pub fn build(root) {
  let issues = render_issues()
  let assert Ok(_) =
    list.try_map(issues, fn(file) {
      let #(path, content) = file
      let path =
        string.replace(root, "/mailer", "/website")
        |> string.append(path)
      simplifile.write_bits(path, content)
    })

  let path = string.replace(root, "/mailer", "/email.html")
  use _ <- result.try(
    simplifile.write(path, email(root))
    |> result.nil_error,
  )

  io.println("Successfully wrote email to " <> path)

  let _ = feed.build(root)
}

pub fn current_issue_number() {
  list.length(content.issues)
}

pub fn email(root) {
  let assert [latest, ..] = content.issues
  email.render(root, latest, current_issue_number())
}

pub fn render_issues() {
  list.reverse(content.issues)
  |> list.index_map(archive_issue)
}

const static = [
  "index.html", "lucymail.png", "lucymail.svg", "tribe.f61a533e.css", "atom.xml",
]

pub fn content(root) {
  use static <- try(
    list.try_map(static, fn(file) {
      let path = string.replace(root, "/mailer", "/website/" <> file)
      use content <- try(simplifile.read_bits(path))
      Ok(#("/" <> file, content))
    }),
  )
  Ok(list.append(static, render_issues()))
}

pub fn issue_path(number) {
  string.concat(["/issues/", int.to_string(number), "/index.html"])
}

fn archive_issue(issue, index) {
  let number = index + 1
  #(issue_path(number), bit_array.from_string(archive.render(issue, number)))
}
