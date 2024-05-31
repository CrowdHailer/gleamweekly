import birl
import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import lustre/element
import lustre/element/html
import mailer/content
import mailer/template
import simplifile
import xmleam/xml_builder.{Opt, block_tag, end_xml, new, option_block_tag, tag}

type Issue {
  Issue(id: Int, published: birl.Time, summary: String)
}

fn render_issues() -> List(Issue) {
  list.reverse(content.issues)
  |> list.index_map(fn(issue, index) {
    let number = index + 1
    let #(date, _, _) = issue
    // assert is ok here since all issues (should) have a valid date associated with them
    let assert Ok(time) = birl.from_naive(date)
    Issue(
      id: number,
      published: time,
      summary: html.div([], [template.content(issue, number)])
        |> element.to_string,
    )
  })
}

// for reference see https://validator.w3.org/feed/docs/atom.html
fn generate_rss_feed(entries: List(Issue)) -> Result(String, Nil) {
  xml_builder.new_document()
  |> option_block_tag("feed", [Opt("xmlns", "http://www.w3.org/2005/Atom")], {
    let document =
      new()
      // these are required
      |> tag("id", "https://gleamweekly.com/")
      |> tag("title", "Gleam weekly")
      |> tag(
        "updated",
        birl.now()
          |> birl.to_http,
      )
      // these are recommended
      |> tag("link", "https://gleamweekly.com/")
      |> block_tag(
        "author",
        new()
          |> tag("name", "Peter Saxton"),
      )
      // everything below is optional
      |> tag("description", "Gleam is so hot right now")

    use doc, issue <- list.fold(entries, document)
    let link =
      "https://gleamweekly.com/issues/" <> int.to_string(issue.id) <> "/"

    // updated + published could use some polish
    doc
    |> block_tag("entry", {
      new()
      // these are required
      |> tag("id", link)
      |> tag("title", "Gleam weekly #" <> int.to_string(issue.id))
      |> tag("updated", birl.to_http(issue.published))
      // these are optional
      |> tag("link", link)
      |> tag("summary", "<![CDATA[" <> issue.summary <> "]]>")
      |> tag("published", birl.to_http(issue.published))
    })
  })
  |> end_xml
  |> result.nil_error
}

pub fn build(root) {
  let contents: List(Issue) = render_issues()

  use feed <- result.try(generate_rss_feed(contents))
  let path = string.replace(root, "/mailer", "/atom.xml")
  use _ <- result.try(
    simplifile.write(path, feed)
    |> result.nil_error,
  )

  io.println("Successfully wrote atom feed to " <> path)
  |> Ok
}

pub fn main() {
  let assert Ok(cwd) = simplifile.current_directory()
  build(cwd)
}
