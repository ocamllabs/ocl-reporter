Discussion about the ocaml.org infrastructure machines should be
directed to the [ocaml.org infrastructure list](http://lists.ocaml.org/listinfo/infrastructure).
This is a public, archived mailing list.

We currently have a single 12-core host
`bactrian.ocamllabs.cl.cam.ac.uk` running Debian and Xen. It is
configured with the following VMs:

- `ocaml-mx.ocamllabs.cl.cam.ac.uk` is an internal mailing list relay for
list traffic. The `ocaml.org` e-mail is handled via the University
[managed domain service](http://www.ucs.cam.ac.uk/managed-mail-domains),
and they relay e-mail for `lists.ocaml.org`
over to our VM. It runs [Mailman](http://www.gnu.org/software/mailman/)
and [Postfix](http://postfix.org/).

- `ocaml-www1.ocamllabs.cl.cam.ac.uk` is a web server VM. It can virtual
host multiple non-SSL domains. It current hosts
[realworldocaml.org](http://realworldocaml.org/).
Please get in touch with Anil if you need something else hosted here,
`as it has plenty of capacity at the moment.

- `ocaml-www2.ocamllabs.cl.cam.ac.uk` is another web server VM, currently
used to host the [Mirage](http://www.cl.cam.ac.uk/projects/ocamllabs/projects/mirage.html)
website. It switches between being a UNIX VM
or a microkernel, depending on the current state of the Mirage tree.
