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

open Core.Std

type t = [
  | `H1 of string
  | `H2 of string
  | `H3 of string
  | `H4 of string
  | `P of string
  | `L of t list
  | `F of string
]

type ts = t list

type file = string

let rec to_string = function
  | `H1 x -> "# " ^ x
  | `H2 x -> "## " ^ x
  | `H3 x -> "### " ^ x
  | `H4 x -> "#### " ^ x
  | `P x -> x
  | `L ts -> String.concat ~sep:"\n" (List.map ~f:(fun t -> "* " ^ (to_string t)) ts)
  | `F fname -> In_channel.read_all fname

let ts_to_string ts =
  String.concat ~sep:"\n\n" (List.map ~f:to_string ts)

let from_file filename =
  `F (Printf.sprintf "content/%s" filename)

let from_file_to_html_exn file =
  let fname = Printf.sprintf "content/%s.md" file in
  match Sys.file_exists fname with
  |`Yes ->
    Cow.Xml.of_string (
      In_channel.input_all (
        Unix.open_process_in ("omd " ^ fname)
      )
    )
  |`No |`Unknown -> eprintf "skipping %s\n" fname; Cow.Xml.of_string " "

let from_file_to_html file =
  try
    from_file_to_html_exn file
  with exn ->
    eprintf "warning: skipped %s\n" file;
    []
