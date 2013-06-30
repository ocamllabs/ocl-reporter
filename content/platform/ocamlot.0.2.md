OCamlot (OCaml Online Testing), is a Continuous Integration and Testing
system for packages provided via [OPAM][].  It comprises all the
appropriate tools and libraries to enable management and development of
the machine infrastructure, for example an OCaml library to [interface
with Github](https://github.com/avsm/ocaml-github) ([available through
OPAM](http://opam.ocamlpro.com/pkg/github.0.6.1.html)).  If you submit a
package via OPAM, you will be rewarded with regular regression tests
across many diverse operating systems and build tool
environments. Ultimately, we would also like to integrate benchmarking,
constraint exploration, experimental design, complete isolation, and
domain testing into this system.

The resourcing and commissioning of the Machine Pool itself is dealt
with [separately](#Machine Pool) from this software which utilises it.

Current status: Minimal [version 0.2.0 released]()

[OPAM]: http://opam.ocamlpro.com
