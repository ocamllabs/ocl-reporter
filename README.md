`ocl-reporter` converts a directory of files containing project and people
information into a set of web pages for OCaml Labs.

It's currently not intended for external use (mainly because it was hacked
together at high speed for purpose), but we do intend to evolve it into a
more general purpose reporting tool for other projects too.

The data sources can be found at <http://github.com/ocamllabs/updates>.

It installs two binaries:

* `ocl-reporter` reads s-expressions from a `contents/` directory and
  outputs the result to a `html` directory.

* `ocl-github-query` uses the Github API to query project tags and
  changelogs, and output them as progress updates too. This saves us
  from having to manually track project release details.
