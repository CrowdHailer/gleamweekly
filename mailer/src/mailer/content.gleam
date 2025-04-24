import gleam/option.{None, Some}

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
  JobOportunity
  Meetup
}

pub const issues = [
  #(
    "2025-04-24",
    None,
    [
      News(
        "Lustre 5.0",
        "https://hexdocs.pm/lustre/announcements/2025-04-19.html",
        "This release includes performance improvements, better HTML form support, new component functionality and more.",
      ),
      News(
        "Supercharge your Tests with Snapshot Testing",
        "https://www.youtube.com/watch?v=DpakV96jeRk",
        "Jak is here with a promise to \"completely rid the developer of the boring task of having to manually write and manage unit tests' assertions\".",
      ),
      News(
        "Spotless service",
        "https://github.com/CrowdHailer/gleam_spotless",
        "Instant OAuth integration for personal projects.",
      ),
      News(
        "Fortfound",
        "https://github.com/cauebs/fortfound",
        "Reimplementation of Zachtronics' Fortune's Foundation.",
      ),
    ],
    [
      Also(
        "lucid 1.0 - A little logic library.",
        "https://github.com/RyanBrewer317/lucid",
        ProjectUpdate,
      ),
      Also(
        "Gleam Syntax Postcard.",
        "https://www.kurz.net/posts/gleam-postcard",
        BlogPost,
      ),
      Also(
        "smol 1.0 - a little webserver for javascript.",
        "https://gitlab.com/arkandos/smol",
        ProjectUpdate,
      ),
      Also(
        "rexen 1.0 - a 'regex engine' that compiles and evaluates regular expressions using a Non-deterministic Finite Automaton (NFA).",
        "https://github.com/tonievictor/rexen",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-04-10",
    Some("A couple of blog post in this weeks issue."),
    [
      News(
        "In praise of Gleam's decode",
        "https://jonashedeng.github.io/posts/gleam-decode/",
        "The decode api or some combination of terseness, weird dedicated syntax, macros, magics, etc.",
      ),
      News(
        "Just 1.0",
        "https://github.com/GearsDatapacks/just/",
        "A JavaScript lexer and syntax highlighter for Gleam.",
      ),
      News(
        "Lambda Days 2025 | 12 - 13 June.",
        "https://www.lambdadays.org/lambdadays2025",
        "Use the discount code GleamDreamTeam for 10% off.",
      ),
    ],
    [
      Also(
        "It's TEA time: Nestful now manages state with Gleam and Lustre.",
        "https://blog.nestful.app/p/its-tea-time-nestful-now-manages",
        BlogPost,
      ),
      Also(
        "Splitter a package for fast string parsing.",
        "https://github.com/lpil/splitter",
        ProjectUpdate,
      ),
      Also(
        "glight: configurable actor based structured logging with multiple customizable transports.",
        "https://github.com/distrill/glight",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-03-27",
    Some(
      "Consistent library growth in the Gleam ecosystem. And a new Elixir conference, that I will be involved with.",
    ),
    [
      News(
        "atomb 1.0",
        "https://github.com/lpil/atomb",
        "An unopinionated atom feed builder.",
      ),
      News(
        "messua 1.0",
        "https://codeberg.org//d2718/messua",
        "A collection of convenience types and functions that might amount to a small web framework.",
      ),
      News(
        "Alchemy Conf 2025 | March 31 - April 3 Braga, Portugal",
        "https://alchemyconf.com/",
        "A new Elixir conference joins the BEAM family.",
      ),
    ],
    [
      Also(
        "glebs - An OAuth PKCE helper for the Browser",
        "https://github.com/andho/glebs",
        ProjectUpdate,
      ),
      Also(
        "A Decision Maker's Guide to Typed Functional Languages",
        "https://www.youtube.com/watch?v=sl1UQXgtepE",
        Video,
      ),
    ],
  ),
  #(
    "2025-03-20",
    None,
    [
      News(
        "A deep dive into Gleam's latest tooling, types, modules, and more.",
        "https://www.youtube.com/watch?v=uLndcdX9ZYY",
        "Raul takes us on a tour at Erlang Solution's Erlang & Elixir user group meet-up in Budapest",
      ),
      News(
        "avmgls - AtomVM Gleam LED Strip application",
        "https://github.com/karlsson/avmgls",
        "AtomVM is an alternative erlang runtime for small devices. This demo show a setup that works with Gleam.",
      ),
      News(
        "A Code Centric Journey into the Gleam Language",
        "https://www.youtube.com/watch?v=PfPIiHCId0s",
        "A inproved second iteration of this talk from Jak.",
      ),
    ],
    [
      Also(
        "Estimated? Done! Planning poker in Gleam",
        "https://estimated-done.ahlcode.fi",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-03-13",
    Some(
      "A lovely selection of libraries and a discount code for a conference stateside.",
    ),
    [
      News(
        "Gleam 1.9.1",
        "https://github.com/gleam-lang/gleam/releases/tag/v1.9.1",
        "Testing is over and Gleam 1.9 is ready.",
      ),
      News(
        "LambdaConf 2025",
        "http://www.eventbrite.com/e/903567092497/?discount=PETERSAXTON15",
        "The conference is on May the 10th and 11th this year. Use the link for a discount.",
      ),
      News(
        "mockth - a module mocking library",
        "https://github.com/bondiano/mockth",
        "A Gleam wrapper around the Meck library for erlang",
      ),
    ],
    [
      Also(
        "Gond: faking Elixir's cond for multi branch expressions",
        "https://github.com/inoas/gleam-gond",
        ProjectUpdate,
      ),
      Also(
        "Reimplementation of paralleldrive/cuid2 in Gleam.",
        "https://github.com/fravan/cuid2_gleam",
        ProjectUpdate,
      ),
      Also(
        "A simple uwu-ifier library.",
        "https://codeberg.org/JevFungus/uwu",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-03-06",
    Some(
      "Property testing and a chess bot competition I'm keen on both of these developments. Maybe I can combine them.",
    ),
    [
      News(
        "The Gleam Chess Tournament",
        "https://github.com/isaacharrisholt/gleam-chess-tournament",
        "A friendly competition to see who can create the best chess bot.",
      ),
      News(
        "qcheck 1.0",
        "https://github.com/mooreryan/gleam_qcheck",
        "QuickCheck-inspired property testing with integrated shrinking.",
      ),
      News(
        "Gleam 1.9.0 is out for testing",
        "https://github.com/gleam-lang/gleam/releases/tag/v1.9.0-rc1",
        "The next version of Gleam is ready for testing.",
      ),
      News(
        "Gleam bindings to Datastar",
        "https://github.com/sporto/gleam-datastar",
        "Datastar - build reactive web applications with the simplicity of server-side rendering and the power of a full-stack SPA framework.",
      ),
    ],
    [
      Also(
        "gleamstral 1.0 - client for the Mistral AI API",
        "https://github.com/Neofox/gleamstral",
        ProjectUpdate,
      ),
      Also(
        "A partial port of Riak's vector clocks from Erlang to Gleam",
        "https://github.com/aloussase/gleam-vector-clocks",
        Educational,
      ),
    ],
  ),
  #(
    "2025-02-27",
    Some("A server for live reloading and thinking about errors."),
    [
      News(
        "Olive - live reload for your classic server",
        "https://github.com/fravan/olive",
        "Olive takes care of launching your server as well as a proxy to enable live reloading features.",
      ),
      News(
        "Gleam, coming from Erlang",
        "https://olano.dev/blog/gleam-coming-from-erlang/",
        "Notes on using Gleam from someone familiar with the BEAM.",
      ),
      News(
        "outcome 1.0 - an error handling library",
        "https://github.com/sporto/gleam-outcome",
        "Inspired by snag, outcome distinguishes between expected and unexpected errors.",
      ),
    ],
    [
      Also(
        "clockwork - an easy-to-use Cron library",
        "https://github.com/renatillas/clockwork",
        ProjectUpdate,
      ),
      Also(
        "quaternion - a simple quaternion implementation",
        "https://github.com/PiaCOS/quaternion_gleam",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-02-20",
    Some(
      "This issue of Gleam weekly it's Gleam Time. We also have some great talks from the community.",
    ),
    [
      News(
        "Fullstack Gleam: Static Types on the BEAM, and Javascript You'll Love.",
        "https://www.youtube.com/watch?v=4n6O_u0SSAc",
        "Brett Kolodny took a deep dive into Gleam and demonstrated how to build a non-trivial full-stack application with it.",
      ),
      News(
        "Gleam Time!",
        "https://github.com/gleam-lang/time",
        "It's always 'Gleam Time'. And now there is a library for working with times and dates.",
      ),
      News(
        "Contributing to the Gleam Compiler",
        "https://www.youtube.com/watch?v=Nqs196deu_c",
        "Surya (Gears) talks through contributing to the Gleam compiler.",
      ),
    ],
    [
      Also(
        "pinkdf2 - bindings to the heavily-optimized fast_pbkdf2 NIF for PBKDF2",
        "https://github.com/yazatamorph/pinkdf2",
        ProjectUpdate,
      ),
      Also(
        "Women in BEAM: survey results",
        "https://www.erlang-solutions.com/blog/women-in-beam/",
        Educational,
      ),
      Also(
        "tarbomb an implementation of XKCD 1168",
        "https://tarbomb-b4a21a.gitlab.io/",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-02-13",
    Some(
      "Talking about the future with Jak and the present with the developer survey results. This issue of Gleam Weekly even offers us loops.",
    ),
    [
      News(
        "The Future of Gleam: Innovations and Insights with Giacomo Cavalieri",
        "https://www.beamrad.io/86",
        "Jak and Lars have a delightful conversation about Gleam, the language's type safety, adoption and ecosystem growth. ",
      ),
      News(
        "Developer survey results for 2024",
        "https://gleam.run/news/developer-survey-2024-results/",
        "The results are in for the first ever Gleam Developer Survey. It ran for a couple months at the end of 2024 and received 841 responses.",
      ),
      News(
        "iv - general-purpose, persistent array structure",
        "https://gitlab.com/arkandos/iv",
        "Use it like you would use an array in other programming languages and expect comparable or better runtime characteristics.",
      ),
    ],
    [
      Also(
        "lustre_alpine - A library for working with Alpine.JS through Lustre attributes.",
        "https://github.com/renatillas/lustre_alpine",
        ProjectUpdate,
      ),
      Also(
        "dag_json - JSON Directed Acyclic Graph for IPLD.",
        "https://github.com/CrowdHailer/dag_json",
        ProjectUpdate,
      ),
      Also(
        "gloop - Stack-safe `while do` and `do while` loops.",
        "https://github.com/DriesDhooghe/gloop",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-02-06",
    None,
    [
      News(
        "An implementation of a Bidirectional Map - 1.0 release",
        "https://github.com/GearsDatapacks/gleam-mapped",
        "Efficiently navigate from key to value and back",
      ),
      News(
        "Gleam 1.8.0 is out for testing",
        "https://github.com/gleam-lang/gleam/releases/tag/v1.8.0-rc1",
        "Here is the next version of Gleam ready to try.",
      ),
      News(
        "Squirrel lib explained in a video",
        "https://www.youtube.com/watch?v=f_T5PZYLK2A",
        "Squirrel is a library for type safe SQL queries.",
      ),
    ],
    [
      Also(
        "gleam_javascript is now v1.0.0.",
        "https://github.com/gleam-lang/javascript",
        ProjectUpdate,
      ),
      Also(
        "Boyer-Moore search algorithm implementation.",
        "https://git.ahlcode.fi/nicd/boyer_moore",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-01-30",
    None,
    [
      News(
        "Beencode a fast Bencode library.",
        "https://github.com/giacomocavalieri/beencode",
        "It's around 1.3x faster and less memory hungry than bento.",
      ),
      News(
        "Fabulous 1.0",
        "https://github.com/DeveloperSpoot/fabulous",
        "Table library with text wrapping.",
      ),
      News(
        "Trellis 1.0",
        "https://github.com/ethanthoma/trellis",
        "A simple library for pretty printing tabular data.",
      ),
    ],
    [
      Also(
        "Call for feedback on Gleam material for a university course",
        "https://discord.com/channels/768594524158427167/1047101890707603547/threads/1333917437346840576",
        Educational,
      ),
      Also(
        "Erlang/OTP 27.2.1",
        "https://www.erlang.org/patches/otp-27.2.1",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-01-23",
    Some(
      "Details on two conferences happening in the next 8 days in this weeks issue.",
    ),
    [
      News(
        "Spoke 1.0 released",
        "https://github.com/sbergen/spoke",
        "An MQTT 3.1.1 client written in Gleam for the Erlang runtime.",
      ),
      News(
        "Code BEAM Lite London | 31 January 2025",
        "https://codebeamlondon.com",
        "Next Friday, a single day single track conference for the BEAM, with a GLEAM keynote from Louis.",
      ),
      News(
        "Functional Conf 2025 | 24 - 25 January 2025",
        "https://functionalconf.com/",
        "Starting tomorrow! Includes Robert Virding talking about erlang and myself talking about vegetables and language design.",
      ),
    ],
    [
      Also(
        "Gaste - A termbin.com clone written in Gleam",
        "https://codeberg.org/cmooon/gaste",
        ProjectUpdate,
      ),
      Also(
        "Raul received a stipend grant to help released the version 1 of Chip",
        "https://www.youtube.com/watch?v=0qEi_aCPIq8",
        Video,
      ),
      Also(
        "Brett does a quick write-up of their impressions of Gleam after writing a small Lustre app.",
        "https://snarky.ca/my-impressions-of-gleam/",
        BlogPost,
      ),
    ],
  ),
  #(
    "2025-01-16",
    Some(
      "I never heard of phantom types until I got into Gleam. This week you can find out about them and much more.",
    ),
    [
      News(
        "bungibindies 1.0 released",
        "https://github.com/strawmelonjuice/bungibindies",
        "Gleam bindings to the Bun runtime API's.",
      ),
      News(
        "Lustre Universal Components from Lambda Days 2024",
        "https://www.youtube.com/watch?v=TbCm-zR7qZ0",
        "The best of Elm and Phoenix LiveView.",
      ),
      News(
        "Phantom types",
        "https://www.youtube.com/watch?v=dMtZdPiMfb0",
        "You could be doing more with static typing.",
      ),
    ],
    [
      Also(
        "Shork 1.0 - A MySQL/MariaDB database client.",
        "https://github.com/ninanomenon/shork",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2025-01-09",
    Some(
      "News from Gleam this week. We have some WASM tooling which is not Gleam to WASM compilation. Important distinction there.",
    ),
    [
      News(
        "Popcicle 1.0",
        "https://github.com/dinkelspiel/popcicle",
        "Simple to use, styleable popovers for Lustre ",
      ),
      News(
        "Game Dev Log: Render Loop",
        "https://www.wking.dev/logs/render-loop",
        "Will breaks down the render loop of his Gleam game engine..",
      ),
      News(
        "gl_wasm 1.0",
        "https://github.com/gertvv/gl_wasm",
        "Create binary WebAssembly modules in Gleam.",
      ),
    ],
    [
      Also(
        "GleamRPC - Remote Procedure Call.",
        "https://github.com/Billuc/gleamrpc",
        ProjectUpdate,
      ),
      Also(
        "Evolving a structural editor.",
        "https://crowdhailer.me/2025-01-02/the-evolution-of-a-structural-code-editor/",
        BlogPost,
      ),
    ],
  ),
  #(
    "2025-01-02",
    Some(
      "New year, new gleam release. Obviously. But that's not all we have some cool libraries and games programming.",
    ),
    [
      News(
        "Game Dev Log: Game Loop",
        "https://www.wking.dev/logs/game-loop",
        "Will is building a Tactical RPG, think Final Fantasy Tactics or XCOM from scratch in Gleam.",
      ),
      News(
        "Cog 1.0",
        "https://github.com/DanielleMaywood/cog",
        "A package for performing code generation actions.",
      ),
      News(
        "Gleam 1.7.0 third release candidate",
        "https://github.com/gleam-lang/gleam/releases/tag/v1.7.0-rc3",
        "The next version of Gleam is now ready to try.",
      ),
    ],
    [
      Also(
        "gleam-pkg for installing Gleam CLI programs right inside your OS",
        "https://github.com/enkerewpo/gleam-pkg",
        ProjectUpdate,
      ),
      Also(
        "Clad 1.0 - an intuitive way to parse command line arguments into a record.",
        "https://github.com/ryanmiville/clad",
        ProjectUpdate,
      ),
      Also(
        "Lifeguard 1.0 - a generic actor pool",
        "https://github.com/Pevensie/lifeguard",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-12-26",
    Some(
      "It's been a great year to be coding in Gleam; we got a 1.0 release, 
    this newsletter started and many new people joined the Gleam community. It has been a pleasure to be part of it, see you all in 2025.",
    ),
    [
      News(
        "Pevensie framework v1.0 release",
        "https://github.com/Pevensie/pevensie",
        "A modular backend framework for Gleam, this first release includes solutions for authentication and caching.",
      ),
      News(
        "\"Gleam: Past, Present, Future\" from FOSDEM 2024",
        "https://www.youtube.com/watch?v=clsTrQUt-4M",
        "Looking back to earlier this year when Gleam 1.0 was announced.",
      ),
      News(
        "\"The Mess We're In\" by Joe Armstrong",
        "https://www.youtube.com/watch?v=lKXe3HUG2l4",
        "An all time classic from one of the creators of Erlang.",
      ),
    ],
    [
      Also(
        "Themis 1.0 - Prometheus client",
        "https://github.com/guillheu/Themis",
        ProjectUpdate,
      ),
      Also(
        "Bath - a generic resource pool for Gleam",
        "https://github.com/Pevensie/bath",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-12-19",
    Some(
      "Short and sweet selection of links for this Gleam Weekly. Still some classic content as we talk about recusion and the ever relevant Todo app.",
    ),
    [
      News(
        "Learn recursion with Gleam",
        "https://www.youtube.com/watch?v=debOFwJyXyk",
        "Recursion is a difficult topic for people new to it, but it doesn't have to be! Let's take a tour of recursion using Gleam.",
      ),
      News(
        "Fish completions for Gleam",
        "https://github.com/glpda/gleam-completions",
        "Handwritten completions for Gleam when using the Fish shell",
      ),
    ],
    [
      Also(
        "The classic TodoMVC written in Lustre",
        "https://github.com/ryanmiville/lustre-todomvc",
        Educational,
      ),
      Also(
        "given - Ergonomic early returns (lazy guards) for Bool, Result and Option types in Gleam",
        "https://github.com/inoas/gleam-given",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-12-12",
    Some("Start getting excited for next year with the Gleam roadmap."),
    [
      News(
        "Introducing the Gleam roadmap!",
        "https://gleam.run/news/introducing-the-gleam-roadmap/",
        "A bird's eye view of what's happening in Gleam",
      ),
      News(
        "VSCode IDE Debugging Setup & Demo",
        "https://cdaringe.com/gleam-debugging-early-days/",
        "Blog post and video on how to use the VSCode JS debugger.",
      ),
    ],
    [
      Also(
        "The Gleam London xmas social will be on the 19th in Paddington!",
        "https://meetdown.app/group/58acfb/Gleam-London",
        Meetup,
      ),
      Also(
        "TicTacToe implemented in Gleam and Phoenix",
        "https://github.com/chouzar/tictactoe",
        ProjectUpdate,
      ),
      Also(
        "Queer Mandelbrot with Gleam + HTML5 Canvas",
        "https://github.com/sigmasternchen/queermandelbrot",
        Educational,
      ),
      Also(
        "Advent of Code in Gleam",
        "https://dev.to/sethcalebweeks/series/29636",
        Educational,
      ),
    ],
  ),
  #(
    "2024-12-05",
    Some(
      "Even more great libraries this week, I've even snuck in my own offering, Felix, that implements passkey authentication.",
    ),
    [
      News(
        "Glexer 2.0 released",
        "https://github.com/DanielleMaywood/glexer",
        "A lexer for Gleam, written in Gleam. Now whitespace preserving.",
      ),
      News(
        "Hexdocs Offline",
        "https://github.com/daniellionel01/hexdocs_offline/",
        "Useful if you want to reduce the tabs in your browser or travel a lot/don't have a stable internet connection all the time.",
      ),
      News(
        "Felix 1.0 released",
        "https://github.com/CrowdHailer/felix",
        "Authentication via Passkey (WebAuthn/FIDO2)",
      ),
      News(
        "json_blueprint 1.0 released",
        "https://github.com/lostbean/json_blueprint",
        "Encoding, decoding and generated JSON schemas for your data types.",
      ),
    ],
    [
      Also(
        "gleamstar 1.0 - The A* search algorithm implemented",
        "https://github.com/dinkelspiel/gleamstar",
        ProjectUpdate,
      ),
      Also(
        "A short video primer on using 'use'",
        "https://www.youtube.com/watch?v=-rtVWja_vJI",
        Video,
      ),
      Also(
        "Cigogne 1.0 - A Postgres migration tool",
        "https://github.com/Billuc/cigogne",
        ProjectUpdate,
      ),
      Also(
        "tobble 1.0 - A simple table library",
        "https://github.com/ollien/tobble",
        ProjectUpdate,
      ),
      Also(
        "Gleam weekly is now sharing to Bluesky.",
        "https://bsky.app/profile/crowdhailer.bsky.social/post/3lcl2t64np227",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-11-28",
    Some(
      "This week a bunch of useful libraries reach 1.0, early Christmas perhaps.",
    ),
    [
      News(
        "Atto 1.0",
        "https://github.com/ieeemma/atto",
        "Robust and extensible parser-combinators.",
      ),
      News(
        "Optimist 1.0",
        "https://github.com/hayleigh-dot-dev/optimist",
        "A simple package for modelling optimistic ui updates.",
      ),
      News(
        "Gleameter 1.0",
        "https://github.com/theonlytails/gleameter",
        "Implementation of the International System of Units, including support for adding custom units.",
      ),
      News(
        "Persevero 1.0",
        "https://github.com/JosephTLyons/persevero",
        "Execute fallible operations multiple times. ",
      ),
    ],
    [
      Also(
        "Nothing To Do - A Gleam service that throws out random tasks for inspiration",
        "https://ntd.naomieow.xyz/",
        ProjectUpdate,
      ),
      Also(
        "A Code Centric Journey Into the Gleam Language",
        "https://www.youtube.com/watch?v=yHe_wzFg4W8",
        Video,
      ),
    ],
  ),
  #(
    "2024-11-21",
    Some(
      "The Gleam language tooling continues it's rapid improvement with the latest 1.6 release and other news in this issue of Gleam Weekly.",
    ),
    [
      News(
        "Gleam 1.6.0 released",
        "https://gleam.run/news/context-aware-compilation/",
        "Featuring so many excellent improvements that Louis struggled to title this post. Dive into the 1.6 release post to see all the new things.",
      ),
      News(
        "Gleam's Lustre is Frontend Development's Endgame",
        "https://blog.nestful.app/p/gleams-lustre-is-frontend-developments?triedRedirect=true",
        "How a combination of language, architecture and ecosystem lead to more maintainable code and a more enjoyable experience.",
      ),
      News(
        "Watching a task with Midas on nodejs",
        "https://vimeo.com/1030747035",
        "Demonstration of watching for filesystem changes and automatically rerunning a build and deploy task with Midas on node.",
      ),
    ],
    [
      Also(
        "BEAM's bright future with Gleam (and JavaScript?) - Code BEAM Lite Stockholm 2024",
        "https://www.youtube.com/watch?v=fhJBEuJjxFQ",
        Video,
      ),
      Also(
        "A subset of the Haskell Euterpea library, translated while learning Gleam.",
        "https://github.com/karlsson/gleuterpea",
        Educational,
      ),
    ],
  ),
  #(
    "2024-11-14",
    Some("Another week another survey, this time for Women of the BEAM."),
    [
      News(
        "lenient_parse is feature complete against the Python equivalents it emulates.",
        "https://github.com/JosephTLyons/lenient_parse",
        "Lenient parsing functions for Gleam, modelled after Python's `int()` and `float()` built-ins. ",
      ),
      News(
        "Raycast extension for Gleam packages",
        "https://www.raycast.com/ryanmiville/gleam-packages",
        "Raycast is a collection of powerful productivity tools all within an extendable launcher.",
      ),
      News(
        "Women in the BEAM survey",
        "https://docs.google.com/forms/d/e/1FAIpQLScRW_1tvqCbM1mGv9ak5Zu9sacvOobYHJT-Uqwgd992Ac1SnQ/viewform",
        "Lorena Mireles is conducting a survey to better understand diversity and inclusion within this ecosystem.",
      ),
    ],
    [
      Also(
        "OAS 1.0 - parse an OpenAPI spec.",
        "https://github.com/crowdhailer/oas",
        ProjectUpdate,
      ),
      Also(
        "Zerl: Making Zig in the BEAM an ez time.",
        "https://www.youtube.com/watch?v=ejYcWRERetM",
        Video,
      ),
      Also(
        "Gleam implementation of the last-write-wins register CRDT.",
        "https://github.com/lpil/lww-register-crdt",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-11-07",
    Some(
      "The Gleam developer survey 2024 is out. This is your chance to shape our 2025 plans, so fill it in and share with your friends!",
    ),
    [
      News(
        "The Gleam developer survey 2024 is out",
        "https://developer-survey.gleam.run/",
        "This is your chance to shape our 2025 plans, so fill it in and share with your friends!
        You don't need to currently be a Gleam programmer to participate. Just an interest is good.",
      ),
      News(
        "Arctic framework website",
        "https://arctic-framework.org/",
        "The Arctic framework now has a website that explains more about the project.",
      ),
      News(
        "You don't need loops",
        "https://www.youtube.com/watch?v=92b5-yPZfxQ",
        "Looping is a very common, and very useful, practice in software development.
        But do you need it, or are there other alternatives? Perhaps, better alternatives?",
      ),
    ],
    [
      Also(
        "Basic support for Gleam is now available on Zerops.",
        "https://github.com/zeropsio/recipe-gleam",
        ProjectUpdate,
      ),
      Also(
        "preppy - a nifty app to help in the kitchen.",
        "https://giacomocavalieri.github.io/preppy/",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-10-31",
    None,
    [
      News(
        "Gleam's Journey on the BEAM",
        "https://www.youtube.com/watch?v=6I0IbJtUC3U",
        "Keynote from Code BEAM Europe '24 How Gleam is part of and enriches the erlang ecosystem.",
      ),
      News(
        "Stóráil 1,0",
        "https://github.com/lpil/storail",
        "A simple on-disc JSON based data store",
      ),
    ],
    [
      Also(
        "Gleam Postgres Starter with Mist",
        "https://github.com/nermalcat69/gleam-mist-pgo",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-10-24",
    Some(
      "Being able to inspect the processes of a running application is a super power for languages on the BEAM.
    Gleam now has a native view into this information.",
    ),
    [
      News(
        "Spectator: A BEAM observer tool for Gleam",
        "https://github.com/JonasGruenwald/spectator",
        "A beautiful tool using a lustre server component to render a live view of active processes and information about them.",
      ),
    ],
    [
      Also(
        "Barnacle 1.0 - Self-healing clusters for Gleam applications on the BEAM.",
        "https://github.com/Pevensie/barnacle",
        ProjectUpdate,
      ),
      Also(
        "How to use Lustre Server Components",
        "https://www.youtube.com/watch?v=bzvYJHRrin0",
        Video,
      ),
      Also(
        "Squeal 1.0 - format your .sql files.",
        "https://github.com/MoeDevelops/squeal",
        ProjectUpdate,
      ),
      Also(
        "string_width - Layout and measure the sizes of a strings printed in the terminal.",
        "https://gitlab.com/arkandos/string-width",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-10-17",
    Some(
      "Code BEAM EU was a great event this week. If you got excited about Gleam here are some updates for you.",
    ),
    [
      News(
        "A hands-on exploration of modern web development strategies.",
        "https://magic-numbers.fly.dev/",
        "This site neatly demonstrates different ways of building web applications.",
      ),
      News(
        "Code BEAM EU has happened",
        "https://twitter.com/loreniuxmr/status/1846086567921963242",
        "This year's edition had more Gleam mentioned than ever before.",
      ),
      News(
        "Gleam Lustre Progressive Web App",
        "https://github.com/sanabel-al-firdaws/lustre_pwa",
        "A concrete example of working with Gleam and Lustre to build PWA's.",
      ),
    ],
    [
      Also(
        "Gleam Afterwork in Paris",
        "https://www.meetup.com/fr-FR/gleam-paris/events/303945572/",
        Meetup,
      ),
      Also(
        "Gleam - An Introduction to the Language and Platform",
        "https://www.youtube.com/watch?v=N4nJ7EK-e2s",
        Video,
      ),
    ],
  ),
  #(
    "2024-10-10",
    Some(
      "Two blog posts celebrating the down to earth nature of Gleam in this weeks issue of Gleam weekly.",
    ),
    [
      News(
        "Gleam is Pragmatic",
        "https://blog.drewolson.org/gleam-is-pragmatic/",
        "Over the past few months Drew has been experimenting with the Gleam programming language and is very impressed.",
      ),
      News(
        "6 years with Gleam",
        "https://crowdhailer.me/2024-10-04/6-years-with-gleam/",
        "I first contributed to Gleam in 2018, this is a summary of my journey so far.",
      ),
    ],
    [
      Also(
        "Going local-first with Tauri v2 and Gleam.",
        "https://www.youtube.com/watch?v=lPO1UT3NE6o",
        Video,
      ),
      Also(
        "hexdeck.pm - A hexdocs aggregator.",
        "https://hexdeck.pm/",
        ProjectUpdate,
      ),
      Also(
        "gleamlz_string - Implementation of pieroxy's lz-string compression algorithm.",
        "https://github.com/eelmafia/gleamlz_string",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-10-03",
    Some(
      "This week is apparently video week in Gleam land. why not find out what makes Lustre tick, the pre-eminent front end framework for Gleam.",
    ),
    [
      News(
        "Designing The Lustre Web Framework",
        "https://www.youtube.com/watch?v=4n5fFMLVOBo",
        "Lustre is a web framework that takes inspiration from Elm, React, and Erlang's actor model.
        Listen to Hayleigh talk about how it came to be and where it's going.",
      ),
      News(
        "Lustre and Gleam Make my Heart Rate Go Down",
        "https://dev.to/enoonan/lustre-and-gleam-make-my-heart-rate-go-down-a-case-study-5765",
        "A quick case study on the experience of building a financial assessment client app in Gleam.",
      ),
    ],
    [
      Also(
        "Your next favorite programming language: Gleam.",
        "https://www.youtube.com/watch?v=vyEWc0-kbkw",
        Video,
      ),
      Also(
        "Mysig - ideas for a tiny asset bundler in Gleam.",
        "https://vimeo.com/1014472629/d60bd6ecea",
        Video,
      ),
    ],
  ),
  #(
    "2024-09-26",
    Some(
      "This weeks Gleam update has one of my favourite kind of project, someone playing with languages.
    Why not try transpile Gleam to F#.",
    ),
    [
      News(
        "Gleam Cookbook",
        "https://github.com/gleam-lang/cookbook/",
        "A repo for collecting examples of how to do stuff in Gleam.",
      ),
      News(
        "Midas 1.0 - stable task abstraction",
        "https://github.com/midas-framework/midas",
        "Midas is for making quick scripts and automations.",
      ),
      News(
        "Gleam.NET - An F# target for Gleam",
        "https://github.com/josh-degraw/gleam",
        "A fun project that demonstrates compiling Gleam to F#.",
      ),
    ],
    [
      Also(
        "gleemenu - A neat little API for creating single choice dialogs using dmenu clones.",
        "https://github.com/SaphiraKai/gleemenu",
        ProjectUpdate,
      ),
      Also(
        "An Erlanger's encounter with Gleam.",
        "https://www.youtube.com/watch?v=vPP8ib2qqtI",
        Video,
      ),
      Also(
        "gleamy_lights - Coloured terminal output for Gleam.",
        "https://github.com/strawmelonjuice/gleamy_lights",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-09-19",
    Some(
      "Been away for a week on my honeymoon and a quick checkin with the Gleam community shows the release of yet another version.
    The release of 1.5.0 comes with more community contributions than ever before.",
    ),
    [
      News(
        "Gleam 1.5.0 released",
        "https://gleam.run/news/convenient-code-actions/",
        "Context aware exhaustiveness errors, prettier documentation, prettier errors and so much more.",
      ),
      News(
        "JSON-Typedef 1.0",
        "https://github.com/lpil/json-typedef",
        "Work with JSON using a schema! RFC8927.",
      ),
      News(
        "Radiate",
        "https://github.com/pta2002/gleam-radiate",
        "Hot reloading while in development for Gleam.",
      ),
    ],
    [
      Also(
        "leviathan 1-.0 - Implementation of a state monad.",
        "https://github.com/tttardigrado/leviathan",
        ProjectUpdate,
      ),
      Also(
        "Steerlab — A Job opportunity in Gleam",
        "https://steerlab.notion.site/Software-engineer-dd672cafae4c46438f91f37851b473ae",
        JobOportunity,
      ),
    ],
  ),
  #(
    "2024-09-12",
    Some("Short but sweet update of the goings on in Gleam land."),
    [
      News(
        "gleewhois 1.0",
        "https://github.com/kjartanhr/gleewhois",
        "WHOIS client for Gleam.",
      ),
      News(
        "Macabre an experiment to compile Gleam source code to Python.",
        "https://github.com/dusty-phillips/macabre",
        "Dusty is having fun on the path to making a self hosted compiler.",
      ),
      News(
        "Why not join the Gleam Dev Squad on Daily.dev.",
        "https://app.daily.dev/squads/gleamdev/vK2dDOzzoH0NNB_GVC3Y8x-YhijF5p1RUE8hsownNZE",
        "This squad is a place to share tech posts, ideas, and discussions all about Gleam.",
      ),
    ],
    [
      Also(
        "gloq - API Wrapper for the GroqCloud.",
        "https://github.com/AryaanSheth/gloq",
        ProjectUpdate,
      ),
      Also(
        "Gleam - Next Step for Backend Engineers.",
        "https://www.youtube.com/watch?v=Wr2OPvheLHg",
        Video,
      ),
    ],
  ),
  #(
    "2024-09-05",
    Some("Updates from the Gleamlings."),
    [
      News(
        "Building a real-time chat in Gleam",
        "https://gautier.dev/articles/real-time-gleam-chat",
        "Gautier recounts their first steps in Gleam, from a Hello World to building a complete chat application.",
      ),
      News(
        "Paint: make drawings, animations, and games with Gleam",
        "https://adelhult.github.io/paint/",
        "A DSL for drawing images and making interactive experiences/small games (currently targeting the HTML Canvas API).",
      ),
    ],
    [
      Also(
        "Small library for rsa keys generation and message signing",
        "https://github.com/jmrflora/rsa_keys",
        ProjectUpdate,
      ),
      Also(
        "Tagg - An HTML template library that uses an XML/HTML tag syntax",
        "https://github.com/jasonprogrammer/tagg",
        ProjectUpdate,
      ),
      Also(
        "Elm Town 79 - Inspired: Gleam with Hayleigh",
        "https://discourse.elm-lang.org/t/elm-town-79-inspired-gleam-with-hayleigh/9956",
        Podcast,
      ),
      Also(
        "Bucket - Gleam S3 API client",
        "https://github.com/lpil/bucket",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-08-29",
    Some(
      "A short an sweet update from the Gleam community this week,
      maybe everyone was having too much fun at the second Gleam London meetup.",
    ),
    [
      News(
        "Gleam is not Rust",
        "https://www.youtube.com/watch?v=uvQL-xJWGwI",
        "If you ever need to explain why Gleam is not Rust Issac has your back.",
      ),
      News(
        "My first experience with Gleam",
        "https://pliutau.com/my-first-experience-with-gleam-lang/",
        "Alex shares their personal experience with the language.",
      ),
    ],
    [
      Also(
        "Glake - Snake written in Gleam",
        "https://glake.run/",
        ProjectUpdate,
      ),
      Also(
        "Polly 1.0 - a portable polling file system watcher",
        "https://gitlab.com/arkandos/polly",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-08-22",
    Some("Another good cache of packages from the community this week."),
    [
      News(
        "Know-How-Computer emulator",
        "https://poelstra.github.io/know-how-computer/",
        "Learn about how computers 'really work', with an online emulator for the Know How Computer.",
      ),
      News(
        "Directories 1.0 released",
        "https://github.com/ditherwither/directories",
        "A package to get standard locations of directories for temporary files, config, cache, etc.",
      ),
      News(
        "Globin 1.0 released",
        "https://github.com/apainintheneck/globlin",
        "File globbing for Gleam.",
      ),
    ],
    [
      Also(
        "Nymph - programming language, implemented with Gleam",
        "https://github.com/theonlytails/nymph_gleam",
        ProjectUpdate,
      ),
      Also(
        "Pocket_watch - Easily time the execution of a block or function.",
        "https://hexdocs.pm/pocket_watch/",
        ProjectUpdate,
      ),
      Also(
        "Platform - A zero dependency Gleam package to get information about the host system.",
        "https://github.com/ditherwither/platform",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-08-15",
    Some(
      "Strong library game from the community in this weeks Gleam weekly. type safe SQL!!",
    ),
    [
      News(
        "Squirrel 1.0 released",
        "https://github.com/giacomocavalieri/squirrel",
        "Type safe SQL in Gleam ",
      ),
      News(
        "How to deploy Gleam apps anywhere",
        "https://www.youtube.com/watch?v=SheuSu3Slzw",
        "This week's video from Isaac focuses on how to get your Gleam apps into production.",
      ),
    ],
    [
      Also(
        "Arctic - A declarative way of authoring fast websites.",
        "https://github.com/RyanBrewer317/arctic",
        ProjectUpdate,
      ),
      Also(
        "FluentCI 1.0.0 - Write CI/CD pipelines in Gleam.",
        "https://hex.pm/packages/fluentci",
        ProjectUpdate,
      ),
      Also(
        "Webls - A clean simple package for common web listing files such as Sitemaps & RSS Feeds",
        "https://github.com/versecafe/webls",
        ProjectUpdate,
      ),
      Also(
        "Humanise - Easily format values for human readability.",
        "https://github.com/SaphiraKai/humanise",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-08-08",
    None,
    [
      News(
        "Gleam 1.4.0 released",
        "https://gleam.run/news/supercharged-labels/",
        "With a shorthand syntax for labels, warnings on every build, constant concatenation and more.",
      ),
      News(
        "The basics for a fullstack SPA in Gleam",
        "https://keii.dev/posts/the-basics-for-a-fullstack-spa-in-gleam",
        "This article goes into the stack and libraries used to create a fully functional fullstack application with Gleam.",
      ),
      News(
        "Eventsourcing 3.0 (and 2.0 and 1.0) released",
        "https://github.com/renatillas/eventsourcing",
        "CQRS and Event Sourcing for Gleam.",
      ),
    ],
    [
      Also(
        "First impressions of Gleam: lots of joys and some rough edges.",
        "https://ntietz.com/blog/first-impressions-of-gleam/",
        BlogPost,
      ),
      Also(
        "Betamine - A Minecraft server written in Gleam.",
        "https://github.com/zwubs/betamine",
        ProjectUpdate,
      ),
      Also(
        "Gleesend - API client for resend.com",
        "https://github.com/dinkelspiel/gleesend",
        ProjectUpdate,
      ),
    ],
  ),
  #(
    "2024-08-01",
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
    None,
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
