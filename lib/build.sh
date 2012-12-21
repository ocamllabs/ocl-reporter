#!/bin/sh -e

eval `opam config -env`

ocamlbuild -j 4 -use-ocamlfind report.native www.native github_query.native
