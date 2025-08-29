import aide
import aide/definitions
import aide/effect
import gleam/dynamic/decode
import gleam/http
import gleam/http/request.{Request}
import gleam/http/response
import gleam/json
import gleam/option.{None, Some}
import gleam/string
import weekly/content
import weekly/mcp/tools
import wisp

fn server() {
  aide.Server(
    implementation: definitions.Implementation(
      name: "gleamweekly",
      version: "0.0.1",
      title: Some("Gleam Weekly"),
    ),
    tools: tools.all(),
    resources: [],
  )
}

// Handle messages at the HTTP abstraction
pub fn handle(request) {
  let Request(method:, ..) = request
  case method {
    http.Options | http.Get ->
      response.new(405) |> response.set_body(wisp.Text(""))
    http.Post -> handle_rpc(request)
    http.Delete -> response.new(204) |> response.set_body(wisp.Text(""))
    _ -> response.new(405) |> response.set_body(wisp.Text(""))
  }
}

// Handle message at the JSON-RPC abstractions
fn handle_rpc(request) {
  use data <- wisp.require_json(request)
  case decode.run(data, aide.request_decoder()) {
    Ok(data) -> {
      let return = case aide.handle_rpc(data, server()) {
        effect.Done(result) -> result
        effect.CallTool(args, resume) -> resume(tool_call(args))
        // No resources implemented by this MCP server
        effect.ReadResource(_resource, _resume) -> None
      }
      case return {
        Some(result) -> {
          let json = aide.response_encode(result)
          wisp.json_response(json.to_string(json), 200)
        }
        None -> wisp.response(202)
      }
      // |> result_to_response()
    }
    Error(reason) ->
      response.new(400) |> response.set_body(wisp.Text(string.inspect(reason)))
  }
}

fn tool_call(args) {
  case args {
    tools.ListIssues(cast:) -> Ok(cast(content.issues))
  }
}
