import aide/tool
import gleam/dict.{type Dict}
import gleam/dynamic/decode
import gleam/list
import gleam/option.{None, Some}
import oas/generator/utils
import oas/json_schema
import weekly/content

pub type Return =
  Dict(String, utils.Any)

pub type Issue =
  #(String, option.Option(String), List(content.News), List(content.Also))

pub type Call {
  ListIssues(cast: fn(List(Issue)) -> Return)
}

pub fn all() {
  [
    tool.Tool(
      spec: tool.Spec(
        name: "list_issues",
        title: "List all issues of Gleam Weekly.",
        description: "Gleam weekly is a weekly newsletter about the Gleam programming language. It contains handpicked articles and community news. This tool lists all previous published issues.",
        input: [],
        output: [
          json_schema.field(
            "issues",
            json_schema.array(json_schema.Inline(json_schema.object([]))),
          ),
        ],
      ),
      decoder: decode.success(ListIssues(cast:)),
    ),
  ]
}

fn cast(issues) {
  let issues =
    list.map(issues, fn(issue) {
      let #(date, summary, main, also) = issue
      utils.Object(
        dict.from_list([
          #("date", utils.String(date)),
          #("summary", case summary {
            Some(summary) -> utils.String(summary)
            None -> utils.String("")
          }),
          #(
            "main_stories",
            utils.Array(
              list.map(main, fn(article) {
                let content.News(title:, url:, description:) = article
                utils.Object(
                  dict.from_list([
                    #("title", utils.String(title)),
                    #("url", utils.String(url)),
                    #("description", utils.String(description)),
                  ]),
                )
              }),
            ),
          ),
          #(
            "other_stories",
            utils.Array(
              list.map(also, fn(item) {
                let content.Also(title:, url:, tag:) = item
                utils.Object(
                  dict.from_list([
                    #("title", utils.String(title)),
                    #("url", utils.String(url)),
                    #("tag", utils.String(content.tag_to_string(tag))),
                  ]),
                )
              }),
            ),
          ),
          #(
            "link",
            utils.String("https://gleamweekly.com/issues/" <> date <> ".html"),
          ),
        ]),
      )
    })
    |> utils.Array
  dict.from_list([#("issues", issues)])
}
