import gleam/int
import gleam/list
import gleam/string
import lustre/element.{text}
import lustre/element/html as h
import lustre/attribute as a
import mailer/content.{Also, News}

const faff_pink = "#ffaff3"

pub const white = "#fefefc"

// const unnamed_blue = "#a6f0fc"

const aged_plastic_yellow = "#fffbe8"

const unexpected_aubergine = "#584355"

const underwater_blue = "#292d3e"

const charcoal = "#2f2f2f"

// const black = "#1e1e1e"

const blacker = "#151515"

pub fn content(issue, number) {
  let #(items, also) = issue
  let issue_url =
    string.concat(["https://gleamweekly.com/issues/", int.to_string(number)])
  h.div(
    [
      a.style([
        #("font-family", "Helvetica, Arial, sans-serif"),
        #("line-height", "1.5"),
      ]),
    ],
    [
      header(issue_url, number),
      news(items),
      others(also),
      submit(issue_url, number),
    ],
  )
}

pub fn header(issue_url, number) {
  h.div(
    [
      a.style([
        #("padding", ".5rem 1.5rem"),
        #("background", aged_plastic_yellow),
      ]),
    ],
    [
      h.table(
        [
          a.attribute("width", "100%"),
          a.attribute("border", "0"),
          a.attribute("cellpadding", "0"),
          a.attribute("cellspacing", "0"),
        ],
        [
          h.tbody([], [
            h.tr([], [
              h.td([a.style([#("vertical-align", "text-bottom")])], [
                h.img([
                  a.src("https://gleamweekly.com/lucymail.png"),
                  a.width(80),
                  a.height(64),
                  a.style([
                    #("width", "80px"),
                    #("height", "64px"),
                    #("vertical-align", "text-bottom"),
                    #("margin-bottom", "-30px"),
                    #("margin-top", "-10px"),
                  ]),
                ]),
                h.span(
                  [
                    a.style([
                      #("font-size", "1.5rem"),
                      #("color", blacker),
                      #("font-weight", "bold"),
                    ]),
                  ],
                  [
                    h.a(
                      [
                        a.href("https://gleamweekly.com/"),
                        a.style([
                          #("text-decoration", "none"),
                          #("color", blacker),
                        ]),
                      ],
                      [text("Gleam Weekly")],
                    ),
                  ],
                ),
                h.span([a.style([#("color", unexpected_aubergine)])], [
                  text(" by "),
                  h.a(
                    [
                      a.style([
                        #("text-decoration", "none"),
                        #("color", blacker),
                      ]),
                      a.href("https://twitter.com/crowdhailer"),
                    ],
                    [text("@Crowdhailer")],
                  ),
                ]),
              ]),
              h.td(
                [
                  a.style([
                    #("text-align", "right"),
                    #("vertical-align", "text-bottom"),
                  ]),
                  a.attribute("align", "right"),
                ],
                [
                  h.a(
                    [
                      a.href(issue_url),
                      a.style([
                        #("font-size", "1.5rem"),
                        #("text-decoration", "none"),
                        #("color", blacker),
                      ]),
                    ],
                    [text("Issue #"), text(int.to_string(number))],
                  ),
                ],
              ),
            ]),
          ]),
        ],
      ),
    ],
  )
}

const section_style = [#("padding", "1.5rem 1.5rem 0rem 1.5rem")]

pub fn news(items) {
  h.div([a.style(section_style)], [
    h.div(
      [
        a.style([
          #("color", charcoal),
          #("font-size", "1.25rem"),
          #("font-weight", "bold"),
        ]),
      ],
      [text("This week in Gleam")],
    ),
    ..list.map(items, news_item)
  ])
}

fn news_item(item) {
  let News(title, link, description) = item
  h.p([], [
    h.a(
      [
        a.style([#("font-size", "1.125rem"), #("text-decoration", "underline")]),
        a.href(link),
      ],
      [text(title)],
    ),
    h.br([]),
    h.span([a.style([#("color", charcoal)])], [text(description)]),
  ])
}

pub fn others(others) {
  h.div([a.style(section_style)], [
    h.div(
      [
        a.style([
          #("color", charcoal),
          #("font-size", "1.25rem"),
          #("font-weight", "bold"),
        ]),
      ],
      [text("Even more great Gleam stuff")],
    ),
    ..list.map(others, other_item)
  ])
}

fn other_item(item) {
  let Also(title, link, tag) = item
  h.p([], [
    h.a(
      [
        a.style([#("font-size", "1.125rem"), #("text-decoration", "underline")]),
        a.href(link),
      ],
      [text(title)],
    ),
    text(" "),
    render_tag(tag),
  ])
}

fn render_tag(tag) {
  let #(content, bg, color) = case tag {
    content.Podcast -> #("Podcast", unexpected_aubergine, white)
    content.Video -> #("Video", faff_pink, blacker)
    content.BlogPost -> #("Blog post", underwater_blue, white)
    content.ProjectUpdate -> #("Project update", aged_plastic_yellow, blacker)
  }
  h.span(
    [
      a.style([
        #("background-color", bg),
        #("color", color),
        #("border-radius", "3px"),
        #("padding", "3px"),
        #("font-size", "12px"),
      ]),
    ],
    [text(content)],
  )
}

fn submit(issue_url, number) {
  h.div([a.style([#("background", aged_plastic_yellow), ..section_style])], [
    h.div([a.style([#("text-align", "center"), #("padding", "25px")])], [
      h.a(
        [
          a.href(
            "https://discord.com/channels/768594524158427167/1047101890707603547",
          ),
          a.style([
            #("background", unexpected_aubergine),
            #("padding", "15px 20px"),
            #("border-radius", "30px"),
            #("color", white),
            #("text-decoration", "none"),
          ]),
        ],
        [text("Share your own Gleam news")],
      ),
    ]),
    h.p([a.style([#("margin-bottom", "0")])], [
      text("That's all for this week, have a lovely day."),
      h.br([]),
      h.a(
        [
          a.style([#("text-decoration", "none")]),
          a.href("https://twitter.com/crowdhailer"),
        ],
        [text("@Crowdhailer")],
      ),
      text(" from "),
      h.a(
        [
          a.href("https://gleamweekly.com/"),
          a.style([#("text-decoration", "none")]),
        ],
        [text("Gleam Weekly")],
      ),
      h.br([]),
      h.br([]),
      text("If you enjoyed this update, please tell your friends"),
      h.br([]),
      text("This issue is available, and shareable, at "),
      h.a([a.href(issue_url)], [
        text("gleamweekly.com/issues/"),
        text(int.to_string(number)),
      ]),
      h.br([]),
      h.br([]),
    ]),
  ])
}
