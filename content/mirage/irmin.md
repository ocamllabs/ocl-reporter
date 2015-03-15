Irmin is a distributed filesystem and block store that follows the same
design principles as [Git](http://git-scm.com).  The design consists of three
main components:

* a low-level immutable and consistent key/value data-store
* a DAG persisted in that datastore; and
* a tag store which associate names to keys of the low-level data-store.

Irmin is written in pure OCaml, and can thus be compiled to a variety of
backends (including Javascript, and [Mirage](http://openmirage.org)
microkernels). Unlike the git frontend, applications can directly iterate over
the object graph.

The immutability of the low-level block store makes it significantly easier to
apply replication and network coding techniques to improve resilience via
replication, and to optimise scheduling across many hosts.
