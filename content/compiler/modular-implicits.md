A common criticism of OCaml is its lack of support for ad-hoc polymorphism. The
classic example of this is OCaml’s separate addition operators for integers
`(+)` and floating-point numbers `(+.)`.  Another example is the need for
type-specific printing functions (`print_int`, `print_string`, etc.) rather
than a single print function which works across multiple types.

Taking inspiration from Scala’s
[implicits](http://docs.scala-lang.org/tutorials/tour/implicit-parameters.html)
and "[Modular Type
Classes](http://www.mpi-sws.org/~dreyer/papers/mtc/main-long.pdf)", we propose
a system for ad-hoc polymorphism in OCaml based on using modules as
type-directed implicit parameters.  You can try out an [interactive REPL](http://andrewray.github.io/iocamljs/modimp_show.html)
of a prototype implementation online.
