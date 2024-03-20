import gleam/io
import mailer/template
import mailer/content
import simplifile

pub fn main() {
  template.page(content.issues)
  |> simplifile.write("example.html", _)
}
