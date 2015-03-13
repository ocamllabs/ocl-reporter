As the OPAM package database grows beyond 3000 packages, we need automated ways
of building each package.  This requires not only an OCaml and OPAM
installation, but also some sandboxing techniques to install external
dependencies.  For Linux, we are using the [Docker](http://docker.com)
container manager to perform these builds.  The logs from bulk builds are then
collected via the [Irmin](http://irmin.io) database in order to be classified
and rendered to a webpage.

Note that this is a purely Linux-only solution.  While it lets us test various
distributions such as CentOS, Debian, Ubuntu and RHEL, we still need other
solutions for MacOS X, Free/Net/OpenBSD and Windows.  That will hopefully get
easier as the upstream Docker support for non-Linux platforms matures.
