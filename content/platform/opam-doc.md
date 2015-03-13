The OCaml toolchain has shipped with the `ocamldoc` tool for a long time.
`ocamldoc` runs over a single OCaml library and generates cross-referenced
documentation.  It also supports a variety of outputs, such as Latex, HTML, PDF
and even manpages.  However, it is starting to show its age for large, complex
codebases such as [Core](http://github.com/janestreet/core), and so we are
developing a more scalable alternative for the Platform effort.

OPAM-doc consists of two separate commands:

* [bin-doc](http://github.com/ocamllabs/bin-doc) is a replacement for the OCamldoc lexer (which extracts documentation from [source code comments](http://caml.inria.fr/pub/docs/manual-ocaml-4.00/manual029.html). It uses the OCaml-4.00+ facility for generating `.cmt` files that contain the typed AST, and generates `.cmd` files which contain the documentation information.  By using a separate file from the AST, we leave open the possibility of having multiple language translations in the future.  These `.cmd` and `.cmdi` files can be combined with the `.cmt` files to generate complete documentation directly from the output of the compiler.  This command is intended to be temporary, and can be integrated into the upstream in the future.

* [opam-doc](http://github.com/ocamllabs/opam-doc) takes a set of `cmt` and `cmd` files and outputs a single JSON representation of all the files.  This JSON can then be post-processed (or directly rendered in Javascript) to create a single documentation repository that reliably renders cross-references across entire libraries.  Thus, the entire Platform can have one documentation source rather than having to search across packages.

The ultimate aim is to support the OCaml platform with interactive tutorials using the
[js_of_ocaml](http://ocsigen.org/js_of_ocaml) compiler.  You can try out the prototype
of this in OPAM via `opam install opam-doc && opam doc core async`.  It will start a
local webserver on which you can browse the traffic.  There is also a snapshot available
on [the Mirage documentation](http://mirage.github.io) site.

This work is continued in a form intended for upstream inclusion in the compiler
via the Codoc task.
