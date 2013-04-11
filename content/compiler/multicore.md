Building an efficient multi-core garbage collector remains a
challenging research issue. We will begin by investigating techniques
that do not involve fine-grained locking, as this has been shown to be
error-prone, difficult to maintain, and impacts sequential
performance. Instead, we prefer to isolate threads to individual
cores, with region-based heaps that can be garbage collected
separately. This technique has been successfully demonstrated in
MultiMLton, system and runtime, and we will implement it in OCaml and
its large body of third-party code.
