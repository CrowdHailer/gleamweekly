import gleam/erlang/process
import mist
import weekly/router
import wisp
import wisp/wisp_mist

pub fn main() -> Nil {
  wisp.configure_logger()
  let secret_key_base = "TODO"

  let assert Ok(_) =
    router.handle_request(_, Nil)
    |> wisp_mist.handler(secret_key_base)
    |> mist.new
    |> mist.bind("0.0.0.0")
    |> mist.port(8080)
    |> mist.start

  // Put the main process to sleep while the web server handles traffic
  process.sleep_forever()
}
