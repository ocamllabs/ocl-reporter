The continuous build project is geared towards creating a pool of physical machines used to continuously test packages that are packaged via OPAM.

This also includes creating the appropriate tools and libraries to enable management and development of machine infrastructure, for example an OCaml library to interface with Github (available through OPAM).

Current status: wiring up machines and planning the service. Please use the infrastructure@lists.ocaml.org mailing list to discuss this effort.

### Machines for the build pool

We've been assembling a small collection of conventional high-powered machines that can build the whole package set quite quickly, and also more unusual CPU architectures and operating systems that will help developers that don't have access to them. So far we have:

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