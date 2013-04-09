OPAM 1.2 will be the release that forms part of the OCaml Platform.  We're still planning this feature-set in more detail, but here are some thoughts:

* OPAM could become a compiler front-end by linking to the `compiler-libs` that are installed by the OCaml compiler.  This lets OPAM automatically satisfy dependencies for packages and generate the boilerplate for testing and benchmarking code.

* The existing support for switching between compiler versions is very powerful, and we plan to support "collections" of stable libraries that are tested more extensively than others. This will evolve into support for switching into a stable release of the Platform, to ensure that your code will interoperate with other users of the same Platform version.  

This is all still being planned, so be sure to share your thoughts on the [Platform mailing list](http://lists.ocaml.org/listinfo/platform).
