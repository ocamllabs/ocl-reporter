Debuggers such as the GNU debugger [gdb](http://www.gnu.org/software/gdb/) are
valuable tools when tracking down problems in low-level or parallel
applications.  The programmer experience when using such a debugger to examine
natively-compiled OCaml programs currently lacks lustre.  Recent versions of
the compiler can emit a limited amount of debugging information which enables
the recovery of correct stack traces in the debugger.  However names of
functions still appear in mangled form, it is not possible to reference local
variables by name, and traversal of OCaml values is troublesome.  This is
unfortunately by no means an exhaustive list of deficiencies.

This project aims to equip the native-code OCaml compiler and the GNU debugger
with the necessary infrastructure to improve debugging of OCaml programs.  The
compiler will be enhanced to emit the standard DWARF debugging information
format in order to describe the naming and placement of data together with
relevant type information.  At the same time the debugger will gain
functionality to understand the OCaml-specific parts of this information
including the ability to demangle OCaml names.  It is planned to implement much
of the DWARF output stage in the compiler and the debugger-side support in
libraries such that they might be re-used in other projects.

It is hoped that, as support for native-code debugging of OCaml programs in the
traditional manner evolves, it will become more easily possible to build more
advanced debugging tools.  These might exploit the scripting capabilities of
gdb, for example, and target environments such as large-scale concurrent
systems.

This work is ongoing in the [dwarf](https://github.com/ocaml/ocaml/tree/dwarf)
branch of the OCaml repository.
