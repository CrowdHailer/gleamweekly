// We want to encourage V1
pub type News {
  News(title: String, url: String, description: String)
}

pub type Also {
  Also(title: String, url: String, tag: Tag)
}

pub type Tag {
  Podcast
  Video
  BlogPost
  ProjectUpdate
}

pub const issues = [
  #(
    [
      News(
        "Gleam version 1",
        "https://gleam.run/news/gleam-version-1/",
        "Today Gleam v1.0.0 has been released! This is the first “stable” release of the language and a big milestone for the ecosystem.",
      ),
      News(
        "pprint 1.0",
        "https://github.com/MystPi/pprint",
        "A simple pretty printer for debugging and testing!",
      ),
      News(
        "p5js_gleam",
        "https://github.com/Acepie/p5js_gleam",
        "A demo showcasing how to create and use bindings to create a little animation site with p5js.",
      ),
    ],
    [
      Also(
        "A lean XML builder for Gleam",
        "https://github.com/tovedetered/xmleam",
        ProjectUpdate,
      ),
      Also(
        "Binary Data in Gleam: Implementing The RCON Protocol",
        "https://dev.to/bitcrshr/binary-data-in-gleam-implementing-the-rcon-protocol-2684",
        BlogPost,
      ),
      Also(
        "Gleam for Impatient Devs",
        "https://www.youtube.com/watch?v=NyKIvWvr9kw",
        Video,
      ),
      Also(
        "Types for HTTP headers",
        "https://github.com/LilyRose2798/typed_headers",
        ProjectUpdate,
      ),
    ],
  ),
]
