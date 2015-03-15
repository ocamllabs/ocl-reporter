The first Ctypes release used `dlopen` to dynamically access C libraries, but this
approach has [some limitations](https://github.com/realworldocaml/book/issues/1701)
that will be addressed by also generating C stub files that can be compiled
using the system C compiler.

From the [Ctypes 0.4](https://github.com/ocamllabs/ocaml-ctypes/releases/tag/0.4.0)
release onwards, there is comprehensive support for C stub generation that is 
completely independent of the dynamic `libffi`-based mode (one mode can be used
without the other).

As of early 2015, there are a growing set of OCaml C bindings that use
Ctypes as their [binding generator](https://github.com/search?utf8=%E2%9C%93&q=ocaml+ctypes&type=Repositories&ref=searchresults)
of choice.  These include uses from industrial users such as Citrix, Jane Street and Cryptosense.
