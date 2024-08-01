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
  Educational
}

pub const issues = [
  #(
    "2024-08-01",
    [
      News(
        "Kirakira forum is announced",
        "https://kirakira.keii.dev/",
        "A forum made in Gleam for the Gleam community.",
      ),
      News(
        "A new Gleam feature I love",
        "https://giacomocavalieri.me/posts/a-new-gleam-feature-i-love",
        "A little blog post about the upcoming label shorthand syntax.",
      ),
    ],
    [
      Also(
        "Slash Lustre Load Times with Server Side Rendering.",
        "https://www.youtube.com/watch?v=q9j5V8CDPQY",
        Video,
      ),
      Also(
        "A CLI tool and library to generate Gleam constants from files, env vars, and other sources.",
        "https://gitlab.com/arkandos/gleam-embeds",
        ProjectUpdate,
      ),
      Also(
        "Supercharge your tests with snapshot testing.",
        "https://twitter.com/lambdadays/status/1818216208035959272?s=61&t=ylKuyw0aqfwpsgnMudueaA",
        Video,
      ),
    ],
  ),
  #(
    "2024-07-25",
    [
      News(
        "The Gloder",
        "https://loipesmas.github.io/the_gloder/",
        "Since writing decoders can be a bit of a chore, here is a web tool to automate that.",
      ),
      News(
        "Errors as values are the future",
        "https://www.youtube.com/watch?v=T3pcb3o415c",
        "Video guide on how to handle errors as values.",
      ),
      News(
        "The Gleam Language Server reference",
        "https://gleam.run/language-server/",
        "Reference material explaining the Gleam IDE features available via the Language Server protocol.",
      ),
      News(
        "Cake: 1.0",
        "https://github.com/inoas/gleam-cake",
        "A Gleam library to compose SQL queries targeting SQL dialects PostgreSQL, SQLite, MariaDB and MySQL.",
      ),
    ],
    [
      Also(
        "A simple static site to find out Who Owes Whom How Much Money",
        "https://yoonthegoon.gitlab.io/wowhmm/",
        ProjectUpdate,
      ),
      Also(
        "Enhancing Your Elixir Codebase with Gleam",
        "https://blog.appsignal.com/2024/07/23/enhancing-your-elixir-codebase-with-gleam.html",
        BlogPost,
      ),
      Also(
        "Argus - Argon2 password hashing library.",
        "https://github.com/Pevensie/argus",
        ProjectUpdate,
      ),
      Also(
        "gleroglero - heroicons converted to lustre ",
        "https://github.com/skinkade/gleroglero?tab=readme-ov-file",
        ProjectUpdate,
      ),
      Also(
        "gpxb - A tiny GPX builder.",
        "https://github.com/lpil/gpxb",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-07-11",
    [
      News(
        "Gleam 1.3.0 released",
        "https://gleam.run/news/auto-imports-and-tolerant-expressions/",
        "With auto-imports and tolerant expressions.",
      ),
      News(
        "Using use in Gleam",
        "https://erikarow.land/notes/using-use-gleam",
        "A helpful walkthrough of one of Gleam's potentially confusing features",
      ),
    ],
    [
      Also(
        "Introducing Cactus - A tool for managing git lifecycle hooks.",
        "https://github.com/bwireman/cactus",
        ProjectUpdate,
      ),
      Also(
        "mat - simple string formatting for Gleam.",
        "https://github.com/loipesmas/mat",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-07-05",
    [
      News(
        "Decode library",
        "https://github.com/lpil/decode",
        "Dynamic decoders without the decodeN problem, a potential addition to the standard library so check it out.",
      ),
      News(
        "Simple canvas demo",
        "https://github.com/ChillyBwoy/canvax",
        "A simple example of working with the canvas API in Gleam.",
      ),
      News(
        "Gleam ffi essentials",
        "https://www.youtube.com/watch?v=mreYmQc306c",
        "This video teaches you how to use ffi to access the underlying platform, be it JavaScript, Erlang or Elixir.",
      ),
    ],
    [
      Also(
        "A simple Date type for working with dates without times or zones.",
        "https://github.com/michaeljones/rada",
        ProjectUpdate,
      ),
      Also(
        "Pink - Bindings to Ink for building terminal UIs",
        "https://github.com/Massolari/pink",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-06-27",
    [
      News(
        "Glint reaches version 1.0",
        "https://github.com/TanklesXL/glint",
        "Glint is a library for writing command line tools in gleam",
      ),
      News(
        "Gleam + Tauri template",
        "https://github.com/mscharley/gleam-tauri-demo",
        "This template should help get you started developing with Tauri in Gleam with Tailwind CSS.",
      ),
      News(
        "Using Gleam Packages in Your Elixir Project",
        "https://blog.nytsoi.net/2024/06/26/gleam-deps-in-elixir",
        "A quick explaination of two issues preventing simple usage of Gleam in Elixir projects.",
      ),
    ],
    [
      Also(
        "Formal 2.0 - Type safe HTML form decoding and validation.",
        "https://github.com/lpil/formal",
        ProjectUpdate,
      ),
      Also(
        "A Gemini-to-Gopher proxy that bridges the smolweb to even more smolweb.",
        "https://github.com/gemrest/momoka",
        ProjectUpdate,
      ),
      Also(
        "The Star Language that will outshine Rust? Gleam.",
        "https://www.youtube.com/watch?v=Zy-eDWVam_Y",
        Video,
      ),
    ],
  ),
  #(
    "2024-06-20",
    [
      News(
        "A Gleam compiler written in Gleam.",
        "https://github.com/schurhammer/gig",
        "A Gleam compiler targeting C.",
      ),
      News(
        "PriceFlow - Startup using Gleam",
        "https://github.com/usepriceflow/app",
        "The source code for PriceFlow all in on Gleam and building in the open.",
      ),
      News(
        "Handles - Pure Gleam templating language.",
        "https://github.com/Olian04/gleam_handles",
        "A templating language heavily inspired by Mustache and Handlebars.js.",
      ),
    ],
    [
      Also(
        "Gleam library that provides an IEEE 754 compliant float type.",
        "https://github.com/richard-viney/ieee_float",
        ProjectUpdate,
      ),
      Also(
        "A TUI library for gleam.",
        "https://github.com/sanchit1053/gleam_tui",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-06-13",
    [
      News(
        "Create Robust Web Apps with Gleam and Lustre",
        "https://www.youtube.com/watch?v=3kr4Ydx6GGU",
        "In this video, Isaac shows you how to build a completely type-safe web app in Gleam using the Lustre framework.",
      ),
      News(
        "Exploring Gleam, a type-safe language on the BEAM! ",
        "https://christopher.engineering/en/blog/gleam-overview/",
        "In this article, Christopher talks about Gleam, how they found it, and why they're already LOVING it.",
      ),
      News(
        "Gleam by Example",
        "https://gleambyexample.com/",
        "Gleam by Example is a collection of code snippets to help you get familiar with the language.",
      ),
      News(
        "Implement DNS in a weekend in Gleam",
        "https://github.com/snorfalorpagus/dns-in-a-weekend-gleam",
        "A recursive DNS resolver written in Gleam based on Implement DNS in a weekend.",
      ),
    ],
    [
      Also(
        "A Gleam rewrite of a bullet hell style game.",
        "https://github.com/Acepie/bullet_heck_gleam",
        ProjectUpdate,
      ),
      Also(
        "Game of Life in Gleam.",
        "https://github.com/tcoopman/gleam-of-life",
        ProjectUpdate,
      ),
      Also(
        "Introducing Midas a task library for Gleam",
        "https://vimeo.com/956066721",
        Video,
      ),
    ],
  ),
  #(
    "2024-06-06",
    [
      News(
        "End-to-end types: full-stack web apps",
        "https://www.youtube.com/watch?v=eVtkYQva0Ic",
        "In this talk, from Code BEAM Europe 2023, Hayleigh takes a look at how to build a fun interactive audio application",
      ),
      News(
        "Interactive Lustre tutorial",
        "https://gleamtours.com/lustre-tutorial/introduction/welcome-to-lustre/",
        "This interactive tutorial takes you through everything you need to build all kinds of web applications with Lustre",
      ),
      News(
        "Fluoresce - algebraic effects framework for Gleam",
        "https://github.com/RyanBrewer317/fluoresce",
        "You should be a pretty big fan of control effects before attempting to build a serious project with fluoresce!",
      ),
      News(
        "Bravo - 2.3.0",
        "https://github.com/Michael-Mark-Edu/bravo",
        "Comprehensive ETS bindings for Gleam. ",
      ),
      News(
        "Keynote panel discussion: The next 30 years",
        "https://www.youtube.com/watch?v=hMU5yq7l6lI",
        "A celebration of the 30 year anniversary of the 1st international Erlang User Conference with a look towards the future.",
      ),
    ],
    [
      Also(
        "stdin 1.0.0 - provides a synchronous iterator for consuming stdin.",
        "https://github.com/Olian04/gleam-stdin",
        ProjectUpdate,
      ),
      Also(
        "This Gleam project prints iterations of the Dragon Curve stacked on top of each other.",
        "https://github.com/tcoard/gleam3d",
        ProjectUpdate,
      ),
      Also(
        "Temporary - A package to work with temporary files and directories.",
        "https://github.com/giacomocavalieri/temporary",
        ProjectUpdate,
      ),
      Also(
        "Gleam 1.2 just dropped.",
        "https://www.youtube.com/watch?v=h91mfQgmruc",
        Video,
      ),
    ],
  ),
  #(
    "2024-05-30",
    [
      News(
        "Gleam 1.2.0 release - Fault tolerant Gleam",
        "https://gleam.run/news/fault-tolerant-gleam/",
        "We've got fault tolerant compilation, language server improvements, improved formatting for pipes and more.",
      ),
      News(
        "Kielet 2.0.0 - A GNU Gettext implementation",
        "https://gitlab.com/Nicd/kielet",
        "translate your Gleam or BEAM application without needing to change its source code or recompile it.",
      ),
      News(
        "Gloogle - Search through all public gleam packages",
        "https://gloogle.run",
        "In Gloogle, you can search in functions and types by; their names, their signatures or their documentation.",
      ),
    ],
    [
      Also(
        "The Ultimate Guide to Gleam Concurrency.",
        "https://www.youtube.com/watch?v=8rCgnKHUUVA",
        Video,
      ),
      Also(
        "Gleam JSON 2.0 is faster using erlangs built-in JSON library.",
        "https://github.com/gleam-lang/json/",
        ProjectUpdate,
      ),
      Also(
        "Brainf**k interpreter in Gleam.",
        "https://github.com/Lokdien/bfgleam",
        Educational,
      ),
      Also(
        "Convert HTML into Lustre automatically.",
        "https://lpil.github.io/html-lustre-converter/",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-05-23",
    [
      News(
        "Gleam on NPM",
        "https://github.com/ghivert/gleam-lang-npm",
        "Add Gleam to your environment using NPM, helpful in certain situations.",
      ),
      News(
        "Grille-Pain - A Toast component for Gleam",
        "https://github.com/ghivert/grille-pain",
        "A nice utility library for creating toasts, currently for the JavaScript target only.",
      ),
      News(
        "Gleam 1.2.0 first release candidate",
        "https://github.com/gleam-lang/gleam/blob/main/CHANGELOG.md#v120-rc1---2024-05-23",
        "Try it out now.",
      ),
    ],
    [
      Also(
        "Louis learning Lustre",
        "https://www.youtube.com/watch?v=8o9hzyVHp7E",
        Video,
      ),
      Also(
        "Snapshot testing with Gleam (In Italian)",
        "https://www.youtube.com/watch?v=uUqfA3aaPNg",
        Video,
      ),
      Also(
        "Erlang/OTP 27.0 Release",
        "https://www.erlang.org/news/170",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-05-16",
    [
      News(
        "A Practical Use Case for Function Capture in Gleam",
        "https://gleaming.dev/articles/function-capture-in-gleam/",
        "Explaining the use of function captures in Gleam.",
      ),
      News(
        "Your backend is too complicated",
        "https://www.youtube.com/watch?v=D88S_RdagP8",
        "Isaac shows how to simplify your backend stack using Gleam.",
      ),
      News(
        "chrobot: v1.0",
        "https://github.com/JonasGruenwald/chrobot",
        "Gleam bindings to Chrome devtools protocol.",
      ),
    ],
    [
      Also(
        "Stacky: BEAM stack trace in Gleam.",
        "https://github.com/inoas/stacky",
        ProjectUpdate,
      ),
      Also(
        "Gang of None? Design Patterns in Elixir.",
        "https://www.youtube.com/watch?v=agkXUp0hCW8",
        Video,
      ),
    ],
  ),
  #(
    "2024-05-09",
    [
      News(
        "Code BEAM Lite Stockholm",
        "https://codebeamstockholm.com/",
        "Single day single track conference all about the BEAM ecosystem held in Stockholm.",
      ),
      News(
        "Meadow",
        "https://github.com/JoelVerm/meadow",
        "A server side for glare, the web framework based on SolidJS.",
      ),
      News(
        "Gleam starter on Codesandbox",
        "https://codesandbox.io/p/devbox/github/codesandbox/sandbox-templates/tree/main/gleam",
        "Fork this template and immediately have a running Gleam setup (with Erlang).",
      ),
      News(
        "Projects for Gleam",
        "https://github.com/orgs/gleam-lang/projects",
        "Find out more information about what is being worked on in Gleam by checking out the Github projects.",
      ),
    ],
    [
      Also(
        "Sturnidae: Bindings to Starling Bank's API.",
        "https://github.com/lpil/sturnidae",
        ProjectUpdate,
      ),
      Also(
        "Priorityq: A priority queue implementation based on max pairing heaps. Written in pure Gleam.",
        "https://github.com/nicklimmm/priorityq",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-05-02",
    [
      News(
        "Run Gleam run",
        "https://changelog.com/podcast/588",
        "Louis joins the changelog podcast to talk about the inspiration and development of Gleam.",
      ),
      News(
        "Building your first Gleam web app with Wisp and Lustre",
        "https://gleaming.dev/articles/building-your-first-gleam-web-app/",
        "Taha guides you through some of the many things to implement when building a web app.",
      ),
      News(
        "Gleam compiler backend for Nix configurations",
        "https://github.com/glistix/glistix",
        "Write Nix configuration using Gleam.",
      ),
      News(
        "Gleam background generator",
        "https://bgleam.chromatic.garden/",
        "Generate pretty Gleam backgrounds.",
      ),
    ],
    [
      Also(
        "Taking Erlang to OCaml 5 (with Leandro Ostera)",
        "https://www.youtube.com/watch?v=IxQ586TS8Gw",
        Podcast,
      ),
      Also(
        "A collection of handy dynamic decoders",
        "https://github.com/hayleigh-dot-dev/decipher",
        ProjectUpdate,
      ),
      Also(
        "Gary: Gleam interface to Erlang sparse arrays",
        "https://github.com/hunkyjimpjorps/gary",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-04-25",
    [
      News(
        "Scriptorium - A simple blog generator",
        "https://hexdocs.pm/scriptorium",
        "A simple blog generator using Lustre and lustre_ssg.",
      ),
      News(
        "The optimizations in Erlang/OTP 27",
        "https://www.erlang.org/blog/optimizations/",
        "Explore the new optimizations, in OTP 27, for record updates and other recent improvements.",
      ),
      News(
        "Building a Redis clone from scratch",
        "https://www.youtube.com/watch?v=_lDjzVmWsWg",
        "Louis does the Gleam + Redis challenge on CodeCrafters",
      ),
      News(
        "Big Ben 1.0",
        "https://github.com/maxdeviant/bigben",
        "A clock abstraction, with time travel.",
      ),
      News(
        "Template to incorporate Gleam in Vue projects",
        "https://github.com/vleam/vleam",
        "Vleam (Vue + gLEAM) is a set of tools allowing developers to incrementally incorporate the Gleam programming language into their Vue projects.",
      ),
    ],
    [
      Also(
        "Catppuccin: Soothing pastel library",
        "https://github.com/MAHcodes/catppuccin",
        ProjectUpdate,
      ),
      Also(
        "A simple parallel map library",
        "https://github.com/PastMoments/parallel_map",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-04-18",
    [
      News(
        "Gleam version v1.1",
        "https://gleam.run/news/gleam-v1.1/",
        "This latest version brings Language Server improvements, Bun support, Rebar support and more",
      ),
      News(
        "Gleam Trick: Resultify",
        "https://blog.nytsoi.net/2024/04/16/resultify",
        "A short explaination of dealing with exceptions when calling external functions",
      ),
      News(
        "Cleam",
        "https://github.com/darky/cleam",
        "Detect unused exports from your modules",
      ),
      News(
        "Gling: 1.0",
        "https://codeberg.org/Pi-Cla/gling",
        "In the great Gleam tradition here is a tool to help glingify your strings!",
      ),
    ],
    [
      Also(
        "Telega: Telegram bot",
        "https://github.com/bondiano/telega",
        ProjectUpdate,
      ),
      Also(
        "Elm to Gleam & Lustre",
        "https://www.youtube.com/watch?v=LNYWlHLptK0",
        Video,
      ),
      Also(
        "Shakespeare: General-purpose OTP actors",
        "https://github.com/maxdeviant/shakespeare",
        ProjectUpdate,
      ),
      Also(
        "term_size: retrieve the terminal’s size",
        "https://hexdocs.pm/term_size/",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-04-11",
    [
      News(
        "Building the same app in Gleam and JavaScript",
        "https://gleaming.dev/articles/building-same-app-in-gleam-and-js/",
        "How do we create a simple app in Gleam? This article compares the process with JavaScript for a simple project",
      ),
      News(
        "This is not a toy project, with Leandro Ostera and Emil Privér",
        "https://www.youtube.com/watch?v=cFdZ6M1zQT4",
        "Leandro Ostera talks about OCamlm it's ecosystem and building Riot, which is bringing the best of erlang to OCaml",
      ),
      News(
        "Sketch 1.0 — a new way to write your CSS in Gleam",
        "https://github.com/ghivert/sketch",
        "Instead of relying on an external CSS, sketch allows you to build your own styles directly from gleam, with the full power of CSS",
      ),
      News(
        "Gleam 1.1.0 second release candidate",
        "https://github.com/gleam-lang/gleam/blob/main/CHANGELOG.md#v110-rc2---2024-04-10",
        "Try it out now.",
      ),
    ],
    [
      Also(
        "Nessie: a friendly DNS resolution library",
        "https://github.com/ckreiling/nessie",
        ProjectUpdate,
      ),
      Also(
        "Gleam track on codecrafters.io",
        "https://app.codecrafters.io/tracks/gleam",
        Educational,
      ),
      Also(
        "An RGB color guesser",
        "https://george-grec.github.io/rgbeam/",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-04-04",
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
    "2024-03-28",
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
    "2024-03-21",
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
