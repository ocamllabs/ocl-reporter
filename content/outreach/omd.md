Much of the workflow of the Ocaml.org website depends on a solid Markdown
implementation.  We currently shell out to external processors such as Pandoc,
but a pure OCaml library would be very helpful in embedding it more naturally
into the toolchain.  It would also be helpful for the js_of_ocaml integration
of OCaml in the future.
