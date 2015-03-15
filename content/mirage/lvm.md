A logical volume manager allows you to group together multiple physical disks
(volumes) and treat them as a pool of disk blocks, from which you can allocate
multiple logical disks (volumes).

This pure OCaml implementation uses the same on-disk format as Linux LVM with
the following features:

* constant-time volume manipulation
* linear-mapped logical volumes

It provides an `mlvm` command-line interface to use the library under Unix.
