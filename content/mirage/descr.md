<a href="http://openmirage.org"><img class="left" src="../images/mirage.jpg" width="70px" /></a>The cloud has so far mostly been used to consolidate existing operating systems
and manage them more conveniently. The interface between guest kernels,
applications and VMs are all managed very differently, leading to serious
inefficiencies, unreliability and insecurity.  [Mirage
OS](http://www.openmirage.org) revisits the library OS concept (built here as
[Nemesis](http://www.cl.cam.ac.uk/research/srg/netos/old-projects/nemesis/documentation.html)
in the late '90s), and narrows the gap between safe, high-level programming,
and low-level systems construction.

Applications are written in high-level OCaml and compiled directly into
microkernels that run on the Xen hypervisor. By treating the hypervisor as a
stable hardware platform, we can focus on high-performance protocol
implementations without worrying about having to support the thousands of
device drivers found in a traditional OS.  Although Mirage initially targets
the Xen hypervisor, other backends, such as a FreeBSD kernel module and
Javascript, also exist.

Mirage includes clean-slate functional implementations of protocols ranging
from TCP/IP, DNS, SSH, Openflow (switch/controller), HTTP, XMPP and Xen
inter-VM transports. Some of the new applications we're building using Mirage
include the next-generation [Xen Cloud
Platform](http://www.xen.org/products/cloudxen.html) (a widely deployed
open-source Xen distribution), dubbed [Project
Windsor](http://xen.org/xensummit/xs12na_talks/T2.html).
