import gleam/string
import lustre/attribute as a
import lustre/element.{text}
import lustre/element/html as h
import mailer/template
import mailer/template/archive/index

pub fn render(issue, number) {
  string.concat([
    "<!DOCTYPE html>
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <title>Gleam Weekly</title>
  <meta
    name=\"description\"
    content=\"GleamWeekly is handpicked articles and community news delivered to your inbox in one weekly email.\"
  />
  <link rel=\"shortcut icon\" href=\"/lucymail.svg\" />
  <meta property=\"og:image\" content=\"/lucymail.svg\" />
  <script defer data-domain=\"gleamweekly.com\" src=\"https://plausible.io/js/script.js\"></script>

</head>
<body style=\"margin:0;background:#2f2f2f;\">",
    element.to_string(
      h.div(
        [
          a.styles([
            #("margin", "12px auto"),
            #("max-width", "660px"),
            #("background", template.white),
            #("padding", "12px"),
            #("border-radius", "12px"),
            #("font-family", "Helvetica, Arial, sans-serif"),
          ]),
        ],
        [
          template.content(issue, number),
          h.div(
            [
              a.styles([
                #("padding", "1.5rem 1.5rem 0 1.5rem "),
                #("text-align", "center"),
              ]),
            ],
            [text("You can subscribe below.")],
          ),
          h.div([a.styles([#("margin", "0 auto"), #("max-width", "600px")])], [
            h.script(
              [
                a.src(
                  "https://eocampaign1.com/form/d0ceff7e-e16a-11ee-a64c-651e995d745e.js",
                ),
                a.attribute("async", ""),
                a.attribute("data-form", "d0ceff7e-e16a-11ee-a64c-651e995d745e"),
              ],
              "",
            ),
          ]),
        ],
      ),
    ),
    "</body>
</html>",
  ])
}

pub fn render_index(issues) {
  index.render(issues)
  |> element.to_document_string()
}
