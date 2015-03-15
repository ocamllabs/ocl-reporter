Moana, an information-centric middleware for distributed services and
applications. Moana offers a shared graph-based storage abstraction through
which applications communicate with each other by appending and observing the
shared graph.

Moana supports two basic operations of ADD and MAP; add allows an application
to persistently extend the global graph, and map provides a dynamically
maintained mapping of the global graph to an application specific, internal
sub-graph. MoanaML is a pure OCaml implementation of this abstraction to make
it suitable for use in MirageOS unikernels.
