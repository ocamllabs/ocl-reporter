`ocl-reporter` converts a directory of files containing project and people
information into a set of web pages for OCaml Labs.

It's currently not intended for external use (mainly because it was hacked
together at high speed for purpose), but we do intend to evolve it into a
more general purpose reporting tool for other projects too.

## Updating the live site

* Edit the data in `lib/` with your changes.  The interesting files are
  in `data*.ml`.  Verify your changes with `make run`.
* The web pages need to be run through `ucampas` to add the Cambridge
  styling, to `make www` will do that.  This will change the contents
  of the `pages` directory only, so commit those results too.
* A cron job runs every hour on `cron-serv0.cl.cam.ac.uk` to sync the
  contents of `pages/` with the live directory.  That server doesnt
  run any code, so it just runs the `make cron` target to rsync files.

## Docker build

```
docker build -t ocl-reporter .
docker run -v `pwd`:/home/opam/src
```
