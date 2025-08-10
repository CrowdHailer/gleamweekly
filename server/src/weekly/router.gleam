import gleam/dynamic/decode
import gleam/http
import gleam/http/response
import gleam/json
import gleam/option.{None, Some}
import gleam/string
import oas/json_rpc
import oas/mcp
import oas/mcp/messages
import weekly/mcp/tools
import wisp

pub fn handle_request(request, _context) {
  case wisp.path_segments(request) {
    ["mcp"] ->
      case request.method {
        http.Options | http.Get ->
          response.new(405) |> response.set_body(wisp.Text(""))
        http.Post -> handle_message(request)
        http.Delete -> response.new(204) |> response.set_body(wisp.Text(""))
        _ -> response.new(405) |> response.set_body(wisp.Text(""))
      }
    _ -> wisp.html_response("Hello, Fly!", 200)
  }
}

// context is arbitrary and handles auth
fn handle_message(request) {
  use data <- wisp.require_json(request)
  case decode.run(data, mcp.request_decoder()) {
    Ok(data) -> {
      case mcp.handle_request(data, server()) {
        Some(response) ->
          json_rpc.encode_response(response)
          |> json.to_string()
          |> wisp.json_response(200)
        None -> wisp.json_response("", 202)
      }
    }
    Error(reason) ->
      response.new(400) |> response.set_body(wisp.Text(string.inspect(reason)))
  }
  // returns json data and status code
}

fn server() {
  mcp.Server(
    implementation: messages.Implementation(
      name: "gleamweekly",
      version: "0.0.1",
      title: Some("Gleam Weekly"),
    ),
    tools: tools.all(),
    resources: [],
  )
}
