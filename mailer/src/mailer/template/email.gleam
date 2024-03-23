import gleam/string
import simplifile
import lustre/element
import mailer/template

const replace_string = "!CONTENT!"

pub fn render(issue, number) {
  let assert Ok(container) = simplifile.read("./src/mailer/template/email.html")
  string.replace(
    container,
    replace_string,
    element.to_string(template.content(issue, number)),
  )
}
