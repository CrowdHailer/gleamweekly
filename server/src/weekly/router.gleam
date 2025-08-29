import weekly/mcp/controller as mcp
import wisp

pub fn handle_request(request, _context) {
  use <- wisp.log_request(request)

  case wisp.path_segments(request) {
    ["mcp"] -> mcp.handle(request)

    _ -> wisp.html_response("Hello, Fly!", 200)
  }
}
