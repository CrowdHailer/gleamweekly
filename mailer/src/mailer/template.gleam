import gleam/list
import lustre/element.{text}
import lustre/element/html as h
import lustre/attribute as a

const faff_pink = "#ffaff3"

const white = "#fefefc"

const unnamed_blue = "#a6f0fc"

const aged_plastic_yellow = "#fffbe8"

const unexpected_aubergine = "#584355"

const underwater_blue = "#292d3e"

const charcoal = "#2f2f2f"

const black = "#1e1e1e"

const blacker = "#151515"

fn content(items) {
  h.div([], [header(), news(items)])
}

fn email() {
  todo
}

pub fn page(items) {
  let page =
    h.div(
      [
        a.style([
          #("margin", "0 auto"),
          #("max-width", "660px"),
          #("font-family", "Helvetica, Arial, sans-serif"),
          #("line-height", "1.5"),
        ]),
      ],
      [content(items)],
    )
  element.to_string(page)
}

pub fn header() {
  h.div([a.style([#("padding", "1.5rem"), #("background", underwater_blue)])], [
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
            h.td([], [
              h.img([
                a.src("https://gleamweekly.com/lucymail.svg"),
                a.width(32),
                a.height(32),
                a.style([
                  #("width", "32px"),
                  #("height", "32px"),
                  #("vertical-align", "text-bottom"),
                ]),
              ]),
              h.span([a.style([#("font-size", "1.5rem"), #("color", white)])], [
                h.a([], [text("Gleam Weekly")]),
              ]),
            ]),
            h.td(
              [
                a.style([#("text-align", "right")]),
                a.attribute("align", "right"),
              ],
              [
                h.span(
                  [a.style([#("font-size", "1.5rem"), #("color", faff_pink)])],
                  [text("Issue #1")],
                ),
              ],
            ),
          ]),
        ]),
      ],
    ),
  ])
  // <table width="100%" border="0" cellpadding="0" cellspacing="0">
  // <tbody><tr>
  //   <td>
  //   <img src="https://elixirweekly.net/o/editor/396.png" width="32" height="32" style="width: 32px; height: 32px; vertical-align: text-bottom;" alt="Logo">
  //   <span style="font-size: 1.5rem; color: #d5dae6;">
  //   <a href="http://elixirweekly.net" style="font-size: 1.5rem; color: #d5dae6; text-decoration: none;">ElixirWeekly</a>
  //   </span> <span style="font-size: 0.875rem; color: #8692af; white-space: nowrap;">by <a href="http://elixirstatus.com" style="font-size: 0.875rem; color: #8692af; white-space: nowrap; text-decoration: none;">@elixirstatus</a></span>
  // </td><td style="text-align: right" align="right"><span style="font-size: 1.5rem; color: #d5dae6;">Issue #395</span></td></tr></tbody></table>
}

const section_style = [#("padding", "1.5rem 1.5rem 0rem 1.5rem")]

pub fn news(items) {
  // color: #373f52; font-size: 1.25rem; margin: 0 0 0.5rem 0; line-height: 1.25; font-weight: bold;
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
  let #(title, link, description) = item
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
