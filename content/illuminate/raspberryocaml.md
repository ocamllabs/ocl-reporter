The [Raspberry Pi](http://www.cl.cam.ac.uk/~rdm34/raspi/) has an ARMv6 processor, and there are two main distributions available. 
Debian wheezy is compiled with <i>soft float</i> (which emulates floating point) and is fairly compatible with most software.
The [Raspbian](http://raspbian.org) distribution is recompiled to take advantage of <i>hard float</i>, which is faster but requires a new set of binary packages.

_Soft-float Debian_: If you use soft-float Debian, there is a nice guide available on the [Jane Street OCaml blog](https://ocaml.janestreet.com/?q=node/110) blog on how to bootstrap the native code OCaml compiler on it.
The standard binary packages included with Debian will also work fine.

_Hard-float Raspbian_: Once you have Raspbian installed, the byte-code `ocamlc` compiler will work, but the `ocamlopt` native code compiler doesnt work out of the box.
This is due to differences in the ARMv6 and ARMv7 instruction setsa
.The Raspbian distribution uses a calling convention called `VFPE2` to handle floating point, and OCaml doesn't recognise it by default.

Luckily, the issue has been [fixed](https://github.com/ocaml/ocaml/commit/a4253570ff0fcfcf25e145d68e02e198915503fb) upstream in the OCaml compiler, and will appear in version `4.00.2`.
Meanwhile, you can download precompiled debs with this patch by adding the following to `/etc/apt/sources.list`:

```
deb http://www.cl.cam.ac.uk/~lpw25/ocaml-rpi/ wheezy main
deb-src http://www.cl.cam.ac.uk/~lpw25/ocaml-rpi/ wheezy main
```

Alternatively, you can also use [OPAM](http://opam.ocamlpro.com) to compile a custom compiler (see the Jane Street blog post above for instructions on how to install OPAM):

```
$ opam switch 4.00.1+raspberrypi
$ eval `opam config -env`
```

This compiler should work on Raspbian with no issues.
Many thanks to [Jeffery Scofield](http://psellos.com/ocaml/compile-to-iphone.html) for all this help with this patch!
