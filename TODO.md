* Add cmdliner interface to unify the binaries
* Use some templating engine for all the HTML stuff
* Finish up the Markdown output

The ugly:

* Can't always open Core.Std since COW camlp4 assumes the
  native OCaml namespace.
* Syntax extension spaces make layout a little awkward.

