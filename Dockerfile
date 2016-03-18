FROM ocaml/opam
RUN opam pin add -n ocl-reporter https://github.com/ocamllabs/ocl-reporter.git
RUN opam depext -ui ocl-reporter
RUN opam install -j 2 -y -v ocl-reporter
