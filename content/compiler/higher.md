Higher-kinded polymorphism (i.e. abstraction over type constructors) is an
essential component of many functional programming techniques such as monads,
folds, and embedded DSLs. ML-family languages typically support a form of
abstraction over type constructors using functors, but the separation between
the core language and the module language leads to awkwardness as functors
proliferate.

The *higher* library show how to express higher-kinded polymorphism in OCaml
without functors, using an abstract type `app` to represent type application,
and opaque brands to denote abstractable type constructors. The flexibility of
our approach can be seen by using it to translate a variety of standard
higher-kinded programs into functor-free OCaml code.  Read more about this in
the FLOPS 2014 paper linked above.
