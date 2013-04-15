There are currently two ways of generating OCaml code from within
OCaml programs: camlp4 (and its successor, ppx), which produces
untyped syntax, and MetaOCaml, which produces typed code.

Our research into static metaprogramming aims to combine the
advantages of the two approaches.  The resulting system will allow
users to write code generators that enjoy the guarantees provided by
MetaOCaml, but that run entirely during compilation, like camlp4
extensions.  Typeful generation of code based on statically-available
information has applications in a number of areas, including
deriving-style generic programming extensions, HTML templates, foreign
function interface generation and embedded DSLs.
