In order to create a robust and stable Continuous Integration system, we
need a pool of machines that reflect the diverse environments where
OCaml code is deployed.

To this end, we've been assembling a small collection of conventional
high-powered machines that can build the whole OPAM package set quite
quickly, and also more unusual CPU architectures and operating systems
that will help developers that don't have access to them. So far we
have:

* 12-core AMD64/Linux Debian 64-bit
* 12-core AMD64/Linux Debian 32-bit
* ARMv6l/Raspbian Linux 32-bit (Raspberry Pi 512MB)
* ARMv5tel/Debian Linux 32-bit (Dreamplug)
* sparc64/FreeBSD (thanks to Jasper Wallace for the donation)
* macppc/OpenBSD (G4 Powerbook) (thanks to Dave Scott for the donation)
* AMD64/MacOS X 10.8
* iMac G5/Debian Linux 64-bit
