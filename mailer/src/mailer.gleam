import gleam/int
import gleam/list
import gleam/string
import mailer/template/archive
import mailer/content
import simplifile

pub fn main() {
  list.reverse(content.issues)
  |> list.index_map(archive_issue)
}

fn archive_issue(issue, index) {
  let number = index + 1
  let file =
    string.concat(["../website/issues/", int.to_string(number), "/index.html"])

  let assert Ok(_) =
    archive.render(issue, number)
    |> simplifile.write(file, _)
}
