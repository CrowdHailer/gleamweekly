// https://docs.netlify.com/api-and-cli-guides/api-guides/get-started-with-api/#file-digest-method

import gleam/bit_array
import gleam/dict
import gleam/http
import gleam/http/request
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import gleam/string
import midas/task as t
import netlify
import netlify/schema
import oas/generator/utils
import snag

pub fn run(token, site_id, content) {
  // use deploys <- t.do(netlify.list_site_deploys(
  //   token,
  //   site_id,
  //   None,
  //   None,
  //   None,
  //   None,
  //   None,
  //   None,
  //   None,
  // ))
  // echo deploys
  // panic
  use files <- t.do(
    t.sequential(
      list.map(content, fn(content) {
        let #(path, bytes) = content
        use hash <- t.do(t.hash(t.SHA1, bytes))
        let hash = string.lowercase(bit_array.base16_encode(hash))
        t.done(#(#(path, utils.String(hash)), #(hash, #(path, bytes))))
      }),
    ),
  )
  let #(files, blobs) = list.unzip(files)
  let deploy_files =
    schema.DeployFiles(
      draft: None,
      branch: None,
      functions_config: None,
      function_schedules: None,
      files: Some(dict.from_list(files)),
      framework_version: None,
      functions: None,
      async: None,
      framework: None,
    )
  use response <- t.do(netlify.create_site_deploy(
    token,
    site_id,
    deploy_files,
    None,
    None,
    None,
    None,
    None,
    None,
  ))
  case response {
    Ok(response) -> {
      let required = option.unwrap(response.required, [])
      use _ <- t.do(
        t.sequential(
          list.map(required, fn(hash) {
            let assert Ok(#(path, bytes)) = list.key_find(blobs, hash)
            let assert Some(id) = response.id
            // TODO Needs to accept application/octet stream to work better
            // TODO I think netlify updated their Spec to have more required fields
            let path = string.replace(path, "/", "%2F")
            let request =
              netlify.base_request(token)
              |> utils.append_path("/deploys/" <> id <> "/files/" <> path)
              |> request.set_method(http.Put)
              |> request.set_body(bytes)
              |> request.set_header("Content-Type", "application/octet-stream")

            use response <- t.do(t.fetch(request))
            case response.status {
              200 -> t.done(Nil)
              _ -> {
                use Nil <- t.do(t.log(
                  bit_array.to_string(response.body) |> result.unwrap(""),
                ))
                t.abort(snag.new("failed to upload " <> path))
              }
            }
          }),
        ),
      )
      t.done(Nil)
    }
    Error(reason) -> {
      t.abort(snag.new("failed to create deploy " <> reason.message))
    }
  }
}
