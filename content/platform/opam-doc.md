Improving the documentation generation of OCaml tools. The aim is to support the OCaml platform with fully cross-referenced documentation from source code, including the ability to include interactive tutorials using the
[js_of_ocaml](http://ocsigen.org/js_of_ocaml) compiler.

By extracting inline documentation from source code and storing it in a binary format (similar to the new .cmt files) we hope to make it easier for tools to access the documentation associated with a module. In particular we hope to produce fully cross-reference documentation across the whole OCaml platform.

We also aim to improve the support for different translations of documentation via localisation files.