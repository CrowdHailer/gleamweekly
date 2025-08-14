import gleam/dict
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import oas/generator/utils
import oas/json_schema
import oas/mcp
import oas/mcp/messages
import weekly/content

pub fn all() {
  [
    #(
      messages.Tool(
        name: "list_issues",
        title: Some("List all issues of Gleam Weekly."),
        description: Some(
          "Gleam weekly is a weekly newsletter about the Gleam programming language. It contains handpicked articles and community news. This tool lists all previous published issues.",
        ),
        input_schema: mcp.args(dict.from_list([])),
        output_schema: None,
        meta: None,
        annotations: None,
      ),
      call,
    ),
  ]
}

fn call(_arguments) {
  let issues =
    content.issues
    |> list.map(fn(issue) {
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
  let issues_json =
    issues
    |> utils.any_to_json
  let content =
    json.object([#("issues", issues_json)])
    |> json.to_string
    |> utils.String

  messages.CallToolResult(
    meta: None,
    structured_content: Some(dict.from_list([#("issues", issues)])),
    content: [
      utils.Object(
        dict.from_list([
          #("type", utils.String("text")),
          #("text", content),
        ]),
      ),
    ],
    is_error: Some(False),
  )
}
