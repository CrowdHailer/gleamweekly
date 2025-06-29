import gleam/int
import gleam/list
import gleam/string
import lustre/attribute as a
import lustre/element.{text}
import lustre/element/html as h
import mailer/content.{Also, News}

const faff_pink = "#ffaff3"

pub const white = "#fefefc"

const unnamed_blue = "#a6f0fc"

const aged_plastic_yellow = "#fffbe8"

const unexpected_aubergine = "#584355"

const underwater_blue = "#292d3e"

const charcoal = "#2f2f2f"

// const black = "#1e1e1e"

const blacker = "#151515"

pub fn issue_url(number) {
  string.concat(["https://gleamweekly.com/issues/", int.to_string(number)])
}

pub fn content(issue, number) {
  let #(_date, _comment, items, also) = issue
  let issue_url = issue_url(number)

  h.div(
    [
      a.styles([
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
      a.styles([
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
              h.td([a.styles([#("vertical-align", "text-bottom")])], [
                h.img([
                  a.src("https://gleamweekly.com/lucymail.png"),
                  a.width(80),
                  a.height(64),
                  a.styles([
                    #("width", "80px"),
                    #("height", "64px"),
                    #("vertical-align", "text-bottom"),
                    #("margin-bottom", "-30px"),
                    #("margin-top", "-10px"),
                  ]),
                ]),
                h.span(
                  [
                    a.styles([
                      #("font-size", "1.5rem"),
                      #("color", blacker),
                      #("font-weight", "bold"),
                    ]),
                  ],
                  [
                    h.a(
                      [
                        a.href("https://gleamweekly.com/"),
                        a.styles([
                          #("text-decoration", "none"),
                          #("color", blacker),
                        ]),
                      ],
                      [text("Gleam Weekly")],
                    ),
                  ],
                ),
                h.span([a.styles([#("color", unexpected_aubergine)])], [
                  text(" by "),
                  h.a(
                    [
                      a.styles([
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
                  a.styles([
                    #("text-align", "right"),
                    #("vertical-align", "text-bottom"),
                  ]),
                  a.attribute("align", "right"),
                ],
                [
                  h.a(
                    [
                      a.href(issue_url),
                      a.styles([
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
  h.div([a.styles(section_style)], [
    h.div(
      [
        a.styles([
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
        a.styles([#("font-size", "1.125rem"), #("text-decoration", "underline")]),
        a.href(link),
      ],
      [text(title)],
    ),
    h.br([]),
    h.span([a.styles([#("color", charcoal)])], [text(description)]),
  ])
}

pub fn others(others) {
  h.div([a.styles(section_style)], [
    h.div(
      [
        a.styles([
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
        a.styles([#("font-size", "1.125rem"), #("text-decoration", "underline")]),
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
    content.Educational -> #("Educational", unnamed_blue, blacker)
    content.JobOpportunity -> #("Job oportunity", unnamed_blue, white)
    content.Meetup -> #("Meetup", unexpected_aubergine, white)
  }
  h.span(
    [
      a.styles([
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
  h.div([a.styles([#("background", aged_plastic_yellow), ..section_style])], [
    h.div([a.styles([#("text-align", "center"), #("padding", "25px")])], [
      h.a(
        [
          a.href(
            "https://discord.com/channels/768594524158427167/1047101890707603547",
          ),
          a.styles([
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
    h.p([a.styles([#("margin-bottom", "0")])], [
      text("That's all for this week, have a lovely day."),
      h.br([]),
      h.a(
        [
          a.styles([#("text-decoration", "none")]),
          a.href("https://twitter.com/crowdhailer"),
        ],
        [text("@Crowdhailer")],
      ),
      text(" ("),
      h.a(
        [
          a.styles([#("text-decoration", "none")]),
          a.href("https://bsky.app/profile/crowdhailer.bsky.social"),
        ],
        [text("or on Bluesky")],
      ),
      text(")"),
      text(" from "),
      h.a(
        [
          a.href("https://gleamweekly.com/"),
          a.styles([#("text-decoration", "none")]),
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
