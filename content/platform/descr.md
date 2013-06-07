<a href="http://ocaml.org"><img class="left" src="../images/ocaml-colour.png" width="70px" /></a>The OCaml Platform combines the core OCaml compiler with a coherent set of
libraries, tools and documentation.  The requirements and direction of the
Platform are initially being guided by large users of OCaml such as [Jane
Street](http://ocaml.janestreet.com),
[Citrix](http://www.xen.org/files/XenCloud/ocamldoc/) and
[Lexifi](http://www.lexifi.com/product/technology/ocaml).

The reason for initially taking direction from industrial users is because
these companies have a great deal of experience of using the language at scale
(e.g millions of lines of code, thousands of modules and complicated testing
requirements). We take a pragmatic view that examining and solving the problems
such users have will ultimately result in a large and positive impact on the
wider community, through significantly improved tooling, libraries and
documentation.

The current thrust of work is to improve the tooling around packaging, build
and test infrastructure.  Once complete, this will enable us to effectively
run over hundreds of community packages and determine selection criteria
for the Platform.  A key aspect of this selection will be which libraries
are already popular and in use, and also how actively maintained and portable
they are across different operating systems.

The tasks below reflect this by:

* The OPAM package manager acts as the package management front end.
* The OPAM Doc tool replaces the venerable `ocamldoc` tool with modern, cross-referenced HTML output across several libraries.
* The OCamlot testing infrastructure runs continuous integration of OPAM stable and candidate packages across a variety of operating systems and CPU architectures.

The mailing list for discussion about this is [platform@lists.ocaml.org](http://lists.ocaml.org/listinfo/platform) ([archive](http://lists.ocaml.org/pipermail/platform/)).
