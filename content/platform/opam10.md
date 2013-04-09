OPAM 1.0 is a source-based package manager for OCaml. It supports multiple
simultaneous compiler installations, flexible package constraints, and a
Git-friendly development workflow. 

The goal of the first version of OPAM was to get something released that would
provide basic package management facilities to the community, but also be
designed with distributed open-source design in mind.  To that end, OPAM 1.0
supports a
[remotes](http://opam.ocamlpro.com/doc/Advanced_Usage.html#h2-Handlingofrepositories)
mechanism which lets you combine local development trees with other people's
remote Git or Darcs repositories.  Whenever `opam update` is run, all the
remotes are refreshed and merged, letting you subscribe to other people's
compilers and package trees.

This first version is build-system agnostic in the interests of compatibility
with the large existing body of third party external source code, and so can't
do much in the way of advanced manipulation of the packages.

OPAM 1.0 has been a great success.  Since its release, there have been hundreds
of external contributions from the community, and over 500 packages are now
contained within the [main package repository](http://github.com/OCamlPro/opam-repository)!
