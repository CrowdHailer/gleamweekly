import gleam/int
import gleam/list
import gleam/option
import lustre/attribute as a
import lustre/element/html as h

pub fn render(issues) {
  h.html([], [
    h.head([], [
      h.meta([
        a.attribute("content", "text/html; charset=UTF-8"),
        a.attribute("http-equiv", "content-type"),
      ]),
      h.meta([a.attribute("charset", "utf-8")]),
      h.meta([
        a.attribute(
          "content",
          "width=device-width, initial-scale=1, shrink-to-fit=no",
        ),
        a.name("viewport"),
      ]),
      h.title([], "Gleam Weekly"),
      h.meta([
        a.attribute(
          "content",
          "GleamWeekly is handpicked articles and community news delivered to your inbox in one weekly email.",
        ),
        a.name("description"),
      ]),
      h.link([a.href("/lucymail.svg"), a.rel("shortcut icon")]),
      h.meta([
        a.attribute("content", "/lucymail.svg"),
        a.attribute("property", "og:image"),
      ]),
      h.style(
        [],
        "
      :root {
        --background-background-image-opacity: 0.3;
        --base-font-size: 16px;
        --background-background-color: #584355;
        --heading-colour: #071c35;
        --text-colour: #071c35;
        --container-width: 500px;
        --font-family: \"Helvetica Neue\", Helvetica, Arial, Verdana, sans-serif;
      }

      .emailoctopus-form {
        --label-colour: #071c35;
        --label-size: 16px;
        --field-colour: #ffffff;
        --field-border-colour: #ced4da;
        --button-colour: #ffaff3;
        --button-text-colour: #2f2f2f;
      }
    ",
      ),
      h.meta([
        a.attribute("content", "Lucy welcomes you!"),
        a.name("messages.success"),
      ]),
      h.meta([a.attribute("content", ""), a.name("redirectOnSubmit.url")]),
      h.meta([
        a.attribute("content", "false"),
        a.name("redirectOnSubmit.enabled"),
      ]),
      h.link([a.href("/tribe.f61a533e.css"), a.rel("stylesheet")]),
      h.script(
        [
          a.src("https://plausible.io/js/script.js"),
          a.attribute("data-domain", "gleamweekly.com"),
          a.attribute("defer", ""),
        ],
        "",
      ),
    ]),
    h.body([a.class("eo-recaptcha-bound")], [
      h.div([a.class("d-flex w-100 h-100 mx-auto flex-column")], [
        h.main([a.class("inner tribe"), a.role("main")], [
          h.div(
            [
              a.attribute("style", "background: rgb(255, 251, 232)"),
              a.class("background p-5"),
            ],
            [
              h.div([a.attribute("eo-row", ""), a.class("row full-opacity")], [
                h.div([a.attribute("eo-block-container", ""), a.class("col")], [
                  h.div(
                    [
                      a.attribute(
                        "style",
                        "margin-top: 0px; margin-bottom: 0px; padding: 0px",
                      ),
                      a.attribute("align", "center"),
                      a.attribute("eo-block", "image"),
                    ],
                    [
                      h.img([
                        a.width(250),
                        a.attribute(
                          "style",
                          "
                    width: 45%;
                    max-width: 400px;
                    object-fit: cover;
                    padding: 0px;
                    outline: none;
                    border: medium;
                    display: block;
                    margin-bottom: 18px;
                  ",
                        ),
                        a.alt("Example logo"),
                        a.src("/lucymail.svg"),
                      ]),
                    ],
                  ),
                ]),
              ]),
            ],
          ),
          h.div([a.attribute("eo-row", ""), a.class("row mx-3 my-3")], [
            h.div([a.class("col tribe-container p-3")], [
              h.div([a.attribute("eo-block-container", "")], [
                h.div(
                  [
                    a.attribute(
                      "style",
                      "margin-top: 0px; margin-bottom: 0px; padding: 0px",
                    ),
                    a.attribute("eo-block", "title"),
                    a.class("text-block fr-inner"),
                  ],
                  [
                    h.h1([a.attribute("style", "text-align: center")], [
                      h.text("GleamWeekly"),
                    ]),
                  ],
                ),
                h.div(
                  [
                    a.attribute(
                      "style",
                      "margin-top: 0px; margin-bottom: 0px; padding: 0px",
                    ),
                    a.attribute("eo-block", "text"),
                    a.class("text-block fr-inner"),
                  ],
                  {
                    let length = list.length(issues)
                    list.index_map(issues, fn(issue, index) {
                      let #(date, summary, news, also) = issue
                      let edition = length - index
                      let count = list.length(news) + list.length(also)
                      let text =
                        option.unwrap(
                          summary,
                          int.to_string(count) <> " stories.",
                        )

                      h.a(
                        [
                          a.styles([
                            #("margin", "10px 0"),
                            #("padding", "0 10px"),
                            #("border-left", "2px solid #ffaff3"),
                            #("display", "block"),
                          ]),
                          a.href("/issues/" <> int.to_string(edition)),
                        ],
                        [
                          h.div([], [
                            h.span(
                              [
                                a.class("font-weight-bold"),
                                a.style("margin-right", "8px"),
                              ],
                              [
                                h.text("Issue #"),
                                h.text(int.to_string(edition)),
                              ],
                            ),
                            h.span([a.class("text-muted")], [
                              h.text(" "),
                              h.text(date),
                            ]),
                          ]),
                          h.div([], [h.text(text)]),
                        ],
                      )
                    })
                  },
                ),
              ]),
              h.div([a.class("form-container")], [
                h.div(
                  [
                    a.attribute(
                      "style",
                      "margin-top: 16px; margin-bottom: 0px; padding: 0px",
                    ),
                    a.attribute("eo-block", "form"),
                    a.class(
                      "emailoctopus-form-wrapper emailoctopus-form-default",
                    ),
                  ],
                  [
                    h.p([a.class("emailoctopus-success-message")], []),
                    h.p([a.class("emailoctopus-error-message")], []),
                    h.script(
                      [
                        a.attribute(
                          "data-form",
                          "d0ceff7e-e16a-11ee-a64c-651e995d745e",
                        ),
                        a.src(
                          "https://eocampaign1.com/form/d0ceff7e-e16a-11ee-a64c-651e995d745e.js",
                        ),
                        a.attribute("async", ""),
                      ],
                      "",
                    ),
                  ],
                ),
              ]),
              h.div([a.attribute("eo-block-container", "")], []),
            ]),
          ]),
        ]),
      ]),
    ]),
  ])
}
