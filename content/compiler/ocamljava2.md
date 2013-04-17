OCaml Java is a compiler from OCaml source code to Java bytecode, that can run
on any modern Java runtime. This is an interesting way to explore the multicore
runtime performance of OCaml with a highly concurrent collector, as is present
in the latest JVMs.

The goal of this work is to stabilise and release the [preview of 2.0](http://ocamljava.x9c.fr/preview/),
which greatly improves CPU utilisation and memory footprint.
