Add open extensible types to OCaml. One open type already exists
within OCaml: the exn type used for exceptions. This project extends
this mechanism to allow the programmer to create their own open types.
This has previously been proposed for functional languages a number of
times, for instance as part of a solution to the expression problem
(Loh et al. ["Open Data Types and Open Functions"](http://people.cs.uu.nl/andres/OpenDatatypes.pdf)).
Unlike "exn", these extensible types can have type parameters, allowing
for extensible GADTs.

For example:

```ocaml
type foo = ..

type foo += A

type foo += B of int

let is_a x =
  match x with
    A -> true
  | _ -> false
```
