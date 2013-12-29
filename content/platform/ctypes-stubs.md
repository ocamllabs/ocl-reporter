The first Ctypes release used `dlopen` to dynamically access C libraries, but this
approach has [some limitations](https://github.com/realworldocaml/book/issues/1701)
that will be addressed by also generating C stub files that can be compiled
using the system C compiler.
