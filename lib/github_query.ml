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

open Lwt
open Printf
open Core.Std

let bare_tag name version = version
let full_tag name version = name ^ "-" ^ version

let repos = [
  ("opam", [
     "OCamlPro", "opam", Some bare_tag;
  ]);
  ("infrastructure", [
     "avsm", "ocaml-github", Some full_tag;
  ]);
  ("mirage", [
     "mirage", "mirage-platform", Some full_tag;
     "mirage", "mirage-net", Some full_tag;
     "mirage", "xenbigarray", Some full_tag;
     "mirage", "ocaml-cstruct", Some full_tag;
     "mirage", "ocaml-cow", Some full_tag;
     "mirage", "ocaml-cohttp", Some full_tag;
     "mirage", "ocaml-uri", Some full_tag;
     "mirage", "ocaml-crunch", Some full_tag;
  ]);
  ("irminsule", [
     "mirage", "ocaml-xenstore", Some full_tag;
     "mirage", "dyntype", Some full_tag;
     "mirage", "orm", Some full_tag;
  ]);  
  ("signpost", [
     "mirage", "ocaml-dns", Some full_tag;
     "mirage", "ocaml-pcap", Some full_tag;
  ]);
(* no CHANGES file so it dies 
  ("ocamlorg","ocaml", ["ocaml-re"]);
*)
] 

type repo = {
  user: string;
  repo: string;
  tag: string;
  date: Date.t;
} and repos = repo list with sexp

let parse_iso8601 date =
  (* 2012-11-14T12:25:00Z *)
  try Scanf.sscanf date "%04d%_[-]%02d%_[-]%02d%_[T ]%02d:%02d:%02d%s"
    (fun yr mo da hr mi sec tz -> Date.create_exn ~y:yr ~m:(Month.of_int_exn mo) ~d:da)
  with | _ -> raise (Failure date)
  
let get_tags_and_times ~user ~repo =
  let open Github.Monad in
  let open Github_t in
  Github.Tag.get_tags_and_times ~token:Config.access_token ~user ~repo () >>=
  fun res ->
    let repos = List.map ~f:(fun (tag,v) ->
      let date = parse_iso8601 v in
      { user; repo; tag; date }
    ) res in
    return repos

let get_descr ~user ~repo =
  let open Github.Monad in
  let open Github_t in
  Github.Repo.info ~token:Config.access_token ~user ~repo () >>=
  fun info -> return info.repo_description

let get_changes ~user ~repo =
  Github_changes.get_changes ~user ~repo |!
  Github_changes.parse

let run_github fn =
  Lwt_main.run (Github.Monad.run (fn ()))

let _ =
  let open Report_types in
  List.iter ~f:(fun (project, repos) ->
    let results = List.map repos ~f:(fun (user,repo,change_fn) ->
      (* Every repo is an output, with each version being an update *)
      let id = sprintf "code-%s-%s" user repo in
      let ref = { Reference.name=repo; link=Some (`Github (user,repo)) } in
      let descr = run_github (fun () -> get_descr ~user ~repo) in
      let extra =[ {Reference.name="Homepage"; link=Some (`Webpage (sprintf "http://github.com/%s/%s" user repo))}] in
      let output = { Output.id; ref; ty=`Code; descr; extra } in
      let rs = run_github (fun () -> get_tags_and_times ~user ~repo) in
      (* Remap changelog labels to map to tag *)
      let changes = match change_fn with
        |None -> []
        |Some fn -> List.map ~f:(fun (v,c) -> fn repo v, c) (get_changes ~user ~repo)
      in
      let updates = List.map ~f:(fun r ->
        let date = r.date in
        let ty = `Release (id, { Reference.name=r.tag; link=Some (`Github_tag (user,repo,r.tag)) }) in
        let url = sprintf "http://github.com/%s/%s/archive/%s.tar.gz" user repo r.tag in
        let descr =
           match List.Assoc.find changes r.tag with
           |None -> sprintf "Released version %s." r.tag
           |Some buf -> sprintf "Released version [%s](%s) with these changes:\n\n<div class=\"changelog\">\n%s\n\n</div>" r.tag url buf
        in
        { Update.date; ty; descr }
      ) rs
      in
      output, updates
    ) in
    let outputs = List.map ~f:(fun (o,_) -> o) results in
    let updates = List.concat (List.map ~f:(fun (_,u) -> u) results) in
    let out = sprintf "./projects/%s/outputs-github.scm" project in
    Sexp.save_sexps_hum out (List.map ~f:Output.sexp_of_t outputs);
    let out = sprintf "./projects/%s/updates-github.scm" project in
    Sexp.save_sexps_hum out (List.map ~f:Update.sexp_of_t updates);
  ) repos
