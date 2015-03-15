OCaml's `try` construct is good at dealing with exceptions, but not so good at
handling the case where no exception is raised.  This feature (now part of
OCaml 4.02.0) implements a simple extension to `try` that adds support for
handling the "success" case.

The `try` construct in current OCaml supports matching against raised
exceptions but not against the value produced when no exception is raised.
Contrariwise, the `match` construct supports matching against the value
produced when no exception is raised, but does not support matching against
raised exceptions. As implemented, the patch addresses this asymmetry,
extending match with clauses that specify the "failure continuation":

```
match expr
with pattern_1 -> expr_1
   | ...
   | pattern_n -> expr_n
   | exception pattern_1' -> expr_1'
   | ...
   | exception pattern_n' -> expr_n'
```

With this additional extension the choice between `match` and `try` becomes
purely stylistic. We might optimise for succinctness, and use try in the case
where exceptions are expected (for example, where they're used for control
flow), reserving match for the case where exceptions are truly exceptional.


