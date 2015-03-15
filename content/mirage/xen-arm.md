The ARMv7 architecture introduced the (optional) Virtualization Extensions,
providing hardware support for running virtual machines on ARM devices, and
Xen's ARM Hypervisor uses this to support hardware accelerated ARM guests.

Mini-OS is a tiny OS kernel designed specifically for running under Xen. It
provides code to initialise the CPU, display messages on the console, allocate
memory (malloc), and not much else. It is used as the low-level core of
Mirage's Xen implementation.

Mirage v1 was built on an old version of Mini-OS which didn't support ARM. For
Mirage v2, we have added ARM support to the current Mini-OS (completing Karim
Allah Ahmed's initial ARM port) and made Mirage depend on it as an external
library. This means that Mirage will automatically gain support for other
architectures that get added later. We are currently working with the Xen
developers to get our Mini-OS fork upstreamed into Xen 4.5 and 4.6.
