(*
 * Copyright (c) 2012 Anil Madhavapeddy <anil@recoil.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

(* Scan a directory and convert from sexp for a particular type *)
open Core.Std

let scan_dirs dir =
  Sys.ls_dir ("content/"^dir) |!
  List.map ~f:(fun fname -> Filename.realpath ("content/"^dir^"/"^fname)) |!
  List.filter ~f:(fun fname ->
    match Sys.is_directory fname with
    |`Yes -> true
    |`No |`Unknown -> false)

let load dir name conv =
  Sexp.load_sexp_conv (dir^"/"^name) conv |!
  function
    |`Result r -> r
    |`Error (exn,_) ->
      Printf.eprintf "Error reading %s/%s: %s" dir name (Exn.to_string exn);
      exit 1

let loads dir name conv =
  Sexp.load_sexps_conv (dir^"/"^name) conv |!
  List.map ~f:(function
    |`Result r -> r
    |`Error (exn,t) ->
      prerr_endline (Sexp.to_string_hum (Sexp.Annotated.get_sexp t));
      Printf.eprintf "Error reading %s/%s: %s" dir name (Exn.to_string exn);
      exit 1
  )

let scan ~f dir =
  Sys.ls_dir ("content/"^dir) |!
  List.filter ~f:(fun fname -> Filename.check_suffix fname ".scm") |!
  List.map ~f:(fun fname -> load ("content/"^dir) fname f)

let md_file_to_html subdirs file =
  let fname = Printf.sprintf "content/%s/%s.md" (String.concat ~sep:"/" subdirs) file in
  match Sys.file_exists fname with
  |`Yes ->
    Cow.Xml.of_string (
      In_channel.input_all (
        Unix.open_process_in ("pandoc -f markdown -t html " ^ fname)
      )
    )
  |`No |`Unknown -> eprintf "skipping %s\n" fname; Cow.Xml.of_string " "

let md_string_to_html buf =
  let ic,oc = Unix.open_process "pandoc -f markdown -t html" in
  Out_channel.output_string oc buf;
  Out_channel.close oc;
  Cow.Xml.of_string (In_channel.input_all ic)
