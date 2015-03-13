The Assemblage toolbox provides an API and a set of binaries to setup, manage,
and use OCaml projects.  The library can be used to describe OCaml projects
with static dependencies.  A project description consists of a list of
libraries, binaries and/or toplevels, each containing a list of compilation
units with precise (and static) dependency relationships.

Using a project description, the tools can generate:

* a `.merlin` to help edit the project;
* a `Makefile` to build the project;
* a `.install` to install the project; and
* a `META` file to use the project

Assemblage is still a work-in-progress and has not had a public release.
