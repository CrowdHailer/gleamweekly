import aide
import aide/definitions
import aide/effect
import aide/json_rpc
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
      case aide.handle_rpc(data, server()) {
        effect.Done(result) -> result
        effect.CallTool(args, resume) -> resume(tool_call(args))
        // No resources implemented by this MCP server
        effect.ReadResource(_resource, _resume) -> None
      }
      |> result_to_response()
    }
    Error(reason) ->
      response.new(400) |> response.set_body(wisp.Text(string.inspect(reason)))
  }
}

fn tool_call(args) {
  case args {
    tools.ListIssues(cast:) -> cast(content.issues)
  }
}

fn result_to_response(result) {
  case result {
    Some(message) ->
      message
      |> message_to_response(aide.encode_response)
    None -> no_response()
  }
}

fn no_response() {
  response.new(202)
  |> response.set_header("mcp-session-id", "abc123")
  |> response.set_header("content-type", "application/json")
  |> response.set_body(wisp.Text(""))
}

fn message_to_response(message, encode) {
  let body =
    message
    |> json_rpc.encode_response(encode)
    |> json.to_string()
    |> wisp.Text()
  response.new(200)
  |> response.set_header("content-type", "application/json")
  |> response.set_body(body)
}
