Since the release of OPAM 1.0, we've steadily been fixing bugs that have been
reported from the wider userbase.  The release has actually been remarkably
stable, and most of the issues are around the constraint solver (which tackles
an NP-complete problem with cunning heuristics).  There's also been quite a bit
of work on improving portability and integration with the operating system via
more interactive initialisation.

The big purpose behind the next release, though, is to improve support for
large-scale continuous integration and testing of the packages contained within
the repository.  [Jane Street](http://ocaml.janestreet.com), for example, is
now issuing [weekly releases](https://github.com/OCamlPro/opam-repository/pull/506) of their Core
standard library suite.  Testing these manually across Linux, FreeBSD, MacOS X
and several CPU architectures (x86, x86_64, ARM, Macppc) is both tedious and
error-prone, and so we'd like to automate the process.

OPAM doesn't need many changes to support this testing, but there is more
package metadata being added to facilitate the process, and tools such as
[oasis2opam](http://opam.ocamlpro.com/pkg/oasis2opam.0.2.4.html) help automate
this by looking inside the packages themselves.  The whole of OPAM is exported
as a [library](http://opam.ocamlpro.com/pkg/opam-lib.1.0.0.html) so that third-party
packages can interface with the OPAM repository without changing OPAM itself.
This is exactly what the [OCamlot](#OCamlot 0.2.0) project does.
