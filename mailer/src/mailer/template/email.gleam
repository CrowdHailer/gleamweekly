import gleam/string
import lustre/element
import mailer/template
import simplifile

const replace_string = "!CONTENT!"

pub fn render(root, issue, number) {
  let path = string.append(root, "/src/mailer/template/email.html")
  let assert Ok(container) = simplifile.read(path)
  string.replace(
    container,
    replace_string,
    element.to_string(template.content(issue, number)),
  )
}
