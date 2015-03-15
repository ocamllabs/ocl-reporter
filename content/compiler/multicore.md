Adding shared-memory parallelism to an existing language
presents an interesting set of challenges. As
well as the difficulties of memory management in a
parallel setting, we must maintain as much backwards
compatibility as practicable. This includes not just
compatibility of the language semantics, but also of
the performance profile, memory usage and C bindings.
In the case of OCaml, users have come to rely
on certain operations being cheap, and OCaml’s C
API exposes quite a lot of internals.

The biggest challenge is implementing the garbage
collector. GC in OCaml is interesting because of pervasive
immutability. Many objects are immutable,
which simplifies some aspects of a parallel GC but
requires the GC to sustain a very high allocation rate.
Operations on immutable objects are very fast in
OCaml: allocation is by bumping a pointer, initialising
writes (the only ones) are done with no barriers,
and reads require no barriers. Our design is focussed
on keeping these operations as fast as they are at the
moment, with some compromises for mutable objects.

A previous design by Doligez et al. for Caml
Light was based on many thread-private heaps and
a single shared heap. It maintains the invariant that
there are no pointers from the shared to the private
heaps. Thus, storing a pointer to a private object
into the shared heap causes the private object and
all objects reachable from it to be promoted to the
shared heap en masse. Unfortunately this eagerly
promotes many objects that were never really shared:
just because an object is pointed to by a shared object
does not mean another thread is actually going to
attempt to access it.

Our design is similar but lazier, along the lines of
the multicore Haskell work, where objects are promoted
to the shared heap whenever another thread
actually tries to access them. This has a slower sharing
operation, since it requires synchronisation of two
different threads, but it is performed less often.

Please see the OCaml 2014 short paper linked above
for more details.
