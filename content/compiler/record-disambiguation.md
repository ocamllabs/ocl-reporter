Type-based record disambiguation: [Leo](http://www.lpw25.net) helped with the
record-disambiguation branch of OCaml by Jacques Garrigue. This branch uses
type-information to disambiguate between record labels and variant constructors
with the same names. For discussions of the semantics of this feature see
[Gabriel](http://gallium.inria.fr/~scherer/gagallium/resolving-field-names/)'s
or
[Alain](http://www.lexifi.com/blog/type-based-selection-label-and-constructors)'s
blog posts. Leo rewrote the record-disambiguation branch to use an alternative
semantics and improved the error messages. The branch has since been [merged
into OCaml
trunk](https://github.com/ocaml/ocaml/commit/c8273a179cb0bc835924eeca522922a1769d9d54)
