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
        "Supervisors (3/3)",
        "https://code-change.nl/gleam-blog/20240326-monitoring-processes.html",
        "Kero takes a look at three approaches to work with a single crashing process.",
      ),
      News(
        "Louis on Software Unscripted",
        "https://pod.link/1602572955/episode/3e3cd8a252ed08b948af0b43bf682c6a",
        "Richard talks with Louis Pilfold, about the language's 1.0 release, as well as several other topics.",
      ),
      News(
        "Ivy language",
        "https://github.com/RyanBrewer317/ivy",
        "A scripting language written in Gleam.",
      ),
      News(
        "A little webring in Gleam",
        "https://erikarow.land/notes/gleam-webring",
        "I decided to create a web ring for me and my friends.",
      ),
    ],
    [
      Also(
        "Gleam bindings to Erlang's code module",
        "https://github.com/grodaus/glcode",
        ProjectUpdate,
      ),
      Also(
        "Carpenter, ETS bindings in Gleam",
        "https://github.com/grottohub/carpenter",
        ProjectUpdate,
      ),
      Also(
        "Gleam: for building typesafe systems",
        "https://daily.dev/blog/gleam-the-new-programming-language-for-building-typesafe-systems",
        BlogPost,
      ),
      Also(
        "Remote data for Gleam, Elm inspired",
        "https://hexdocs.pm/remote_data/index.html",
        ProjectUpdate,
      ),
      Also(
        "Comparing 10 modern programming languages",
        "https://www.youtube.com/watch?v=-MbTj8DGOP0",
        Video,
      ),
      Also(
        "Gleam: A basic introduction",
        "https://peq42.com/blog/gleam-a-basic-introduction/",
        BlogPost,
      ),
    ],
  ),
  #(
    [
      News(
        "Monitoring Processes",
        "https://code-change.nl/gleam-blog/20240322-monitoring-processes.html",
        "Discussing how to trap exits and monitor processes from Gleam.",
      ),
      News(
        "Getting to know Actors in Gleam. Code BEAM SF 2024",
        "https://www.youtube.com/watch?v=WaHx6n2UZJg",
        "In this talk Raúl disassembles what makes an Actor and how to make them work with the Gleam type system",
      ),
      News(
        "Lustre v4.0.0 released.",
        "https://github.com/lustre-labs/lustre",
        "Lustre is a web framework for all kinds of applications.
        This latest release introduces server components, better dev tooling and more docs.",
      ),
      News(
        "Exploring Gleam with Genetic Algorithms",
        "https://silasmarvin.dev/exploring-gleam-with-genetic-algorithms",
        "Introduction to Gleam by building a simple word-solving genetic algorithm.",
      ),
      News(
        "Exploring the Gleam FFI",
        "https://www.jonashietala.se/blog/2024/01/11/exploring_the_gleam_ffi/",
        "Josh wrote a blog post with simple examples on how to get started interacting with Erlang/Elixir/Rust/JavaScript from Gleam.",
      ),
    ],
    [
      Also(
        "Gleam's Core Team in the House. Beam Radio",
        "https://www.beamrad.io/72",
        Podcast,
      ),
      Also(
        "Why the number of Gleam programmers is growing so fast",
        "https://tahazsh.com/blog/why-gleam-is-good",
        BlogPost,
      ),
      Also(
        "PostgreSQL protocol decoder/encoder",
        "https://github.com/grodaus/postgresql_protocol",
        ProjectUpdate,
      ),
      Also(
        "Act, compose stateful actions to simulate mutable state",
        "https://github.com/MystPi/act",
        ProjectUpdate,
      ),
      Also(
        "Monitoring processes (2/3)",
        "https://code-change.nl/gleam-blog/20240324-monitoring-processes.html",
        BlogPost,
      ),
    ],
  ),
  #(
    [
      News(
        "Gleam version 1",
        "https://gleam.run/news/gleam-version-1/",
        "Today Gleam v1.0.0 has been released! This is the first “stable” release of the language and a big milestone for the ecosystem.",
      ),
      News(
        "n-sided-lucy",
        "https://0xca551e.github.io/n-sided-lucy/",
        "Create lucys of all sorts.",
      ),
      News(
        "pprint 1.0",
        "https://github.com/MystPi/pprint",
        "A simple pretty printer for debugging and testing.",
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
      Also(
        "Simple Programming Languages",
        "https://ryanbrewer.dev/posts/simple-programming-languages.html",
        BlogPost,
      ),
    ],
  ),
]
