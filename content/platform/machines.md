In order to create a robust and stable Continuous Integration system, we need a pool of machines that reflect the diverse environments where OCaml code is deployed.

To this end, we've been assembling a small collection of conventional high-powered machines that can build the whole OPAM package set quite quickly, and also more unusual CPU architectures and operating systems that will help developers that don't have access to them. So far we have:

* 12-core AMD64/Linux Debian 64-bit
* 12-core AMD64/Linux Debian 32-bit
* Raspbian ARMv6/Linux 32-bit (Raspberry Pi 512MB)
* Debian ARMv6/Linux 32-bit (Dreamplug)
* FreeBSD/sparc64 (thanks to Jasper Wallace for the donation)
* OpenBSD/macppc (G4 Powerbook) (thanks to Dave Scott for the donation)
* MacOS X Mountain Lion
* iMac G5/Debian 64-bit
* Windows 7 64-bit

Clearly the ARM devices will need either some parallelisation or some extreme overclocking to build the whole package set!