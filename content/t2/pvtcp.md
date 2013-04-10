Over the last decade TCP has become the de facto "narrow waist" of the Internet;
a one-size-fit-all transport that is poorly suited to the needs of modern
applications. As middle-boxes have become ubiquitous, it has become nigh
impossible for alternative transports to exist, and so application developers
have come to view opening a TCP socket as the only reliable way to connect to a
server. Some recent proposals circumvent this problem by camouflaging new
transports so that they appear like TCP to middleboxes.

Polyversal TCP aims to unify many different strands of TCP to make it suitable
to work as an extensible one-size-fits-all transport that can take advantage
of heterogenous interconnects such as shared memory or virtual machine channels.
This will in turn greatly simplify the construction of complex distributed systems
being built elsewhere in OCaml Labs.
