Features needed:

* Add cmdliner interface to unify the binaries
* Use some templating engine for all the HTML stuff
* Finish up the Markdown output

The good:

* Github query engine works very well, but needs ability to
  filter non-release tags via some convention (particularly the
  OCaml forks!)

* Sexp editing is nice versus a database as we can diff/prettyprint
  quite easily from a toplevel.

The bad:

* Lack of sharing in sexplib means that we have to go through a
  layer of ugly sharing indirection, which prevents use of GADTs
  and other nice type constraints for event/updates.

* Where do general content updates like personal blog posts go?

* The individual project page really needs to be denser. Layout isn't great 
  at the moment.

The ugly:

* Can't always open Core.Std since COW camlp4 assumes the
  native OCaml namespace.
* Syntax extension spaces make layout a little awkward.

The crazy:

* Can we fix the sexplib sharing problem by writing an ORM backend
  which "mirrors" a set of sexplib docs into a SQLite db for quick
  indexing and manipulation? The Sqlite would be readonly and writes
  would go back to the sexplib.
