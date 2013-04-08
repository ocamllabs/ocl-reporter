The first Mirage prototype was initially described in the [HotCloud 2011](http://anil.recoil.org/papers/2010-hotcloud-lamp.pdf) paper, and then
built and evaluated in the [ASPLOS 2013](http://anil.recoil.org/papers/2013-asplos-mirage.pdf) paper.   During the
course of the work, we separated our thinking into the general concept of
_unikernels_ (which are specialised, sealed tasks that can be compiled very
portably), and the OCaml-based Mirage prototype that comprehensively
implemented the solution.

This task resulted in a solid prototype for the evaluation in the paper, but
further cleanup and documentation is still required to release a public
version. This continues as part of the Xen.org incubation task.
