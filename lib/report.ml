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
open Printf

let person_to_md pid =
  let open Elements.Person in
  let p = get pid in
  sprintf "[%s](#%s)" p.name pid

let ref_to_md r =
  let open Elements.Reference in
  let link_url link = 
    match link with
    | `Pdf url -> url
    | `Blog url -> url
    | `Github(user, repo) -> 
      sprintf "http://github.com/%s/%s" user repo
    | `Github_tag(user, repo, tag) -> 
      sprintf "https://github.com/%s/%s/archive/%s.tar.gz" user repo tag
    | `Website url -> url
    | `Webpage url -> url
    | `Video url -> url
    | `Slideshare url -> url
    | `Mantis id -> sprintf "http://caml.inria.fr/mantis/view.php?id=%d" id
    | `Paper (url,_,_) -> url
  in
  let main = 
    match r.link with
      None -> r.name
    | Some l -> sprintf "[%s](%s)" r.name (link_url l)
  in
  main

let output_to_short_md o =
  let open Elements.Output in
    `P (ref_to_md o.ref)

exception Update_mismatch of (string * Report_types.Output.ty)

(* Generate a list of projects, with updates *)
let update_to_md ~project u =
  let open Elements in
    match u.Update.ty with
    | `Published id -> begin
        let o = Output.get project id in
          match o.Output.ty with
          | `Paper conf ->
              `P (sprintf "*Published*: %s at %s. %s"
                    (ref_to_md o.Output.ref) (ref_to_md conf) u.Update.descr)
          | `Blog_post -> 
              `P (sprintf "*Blog Post*: %s. %s"
                  (ref_to_md o.Output.ref) u.Update.descr)
          | t -> raise (Update_mismatch ("Publish expects Paper or Blog_post",t))
      end
    | `Draft id -> begin
        let o = Elements.Output.get project id in
          match o.Output.ty with
          | `Paper conf ->
              `P (sprintf "*Draft*: %s for %s. %s"
                    (ref_to_md o.Output.ref) (ref_to_md conf) u.Update.descr)
          | t -> raise (Update_mismatch ("Draft expects Paper",t))
      end
    | `Accepted id -> begin
        let o = Elements.Output.get project id in
          match o.Output.ty with
          | `Paper conf ->
              `P (sprintf "*Accepted*: %s at %s. %s"
                    (ref_to_md o.Output.ref) (ref_to_md conf) u.Update.descr)
          | t -> raise (Update_mismatch ("Accepted expects Paper",t))
      end
    | `Event id -> begin
        let o = Elements.Output.get project id in
          match o.Output.ty with
          | `Talk conf ->
              `P (sprintf "*Talk*: %s at %s. %s"
                    (ref_to_md o.Output.ref) (ref_to_md conf) u.Update.descr)
          | `Event people -> 
              let people = 
                String.concat ~sep:", " (List.map ~f:person_to_md people) 
              in
                `P (sprintf "*Event*: %s, with %s. %s" 
                      (ref_to_md o.Output.ref) people u.Update.descr)
          | t -> raise (Update_mismatch ("Event expects Talk or Event",t))
      end
    | `Press id -> begin
        let o = Elements.Output.get project id in
          match o.Output.ty with
          | `Article pub ->
            `P (sprintf "*Press*: %s in %s. %s"
                  (ref_to_md o.Output.ref) (ref_to_md pub) u.Update.descr)
          | t -> raise (Update_mismatch ("Press expects Article",t))
      end
    | `Release(id, version) -> begin
        let o = Elements.Output.get project id in
          match o.Output.ty with
          | `Code ->
              `P (sprintf "*Release*: %s version %s. %s" 
                  (ref_to_md o.Output.ref) (ref_to_md version) u.Update.descr)
          | t -> raise (Update_mismatch ("Release expects Code",t))
      end
    
let projects =
  let open Elements in
  let member_to_md { Elements.Project.person; role; since } =
    let open Person in
    let person = get person in
    `P (sprintf "[%s](#%s), %s (%s)"
      person.name person.id (to_string person.affiliation) since)
  in
  List.map Project.projects ~f:(fun proj ->
    let id = proj.Project.id in
    let title = `H2 proj.Project.name in
    let intro = Markdown.from_file ["projects";id] "intro.md" in
    let related = 
      List.map ~f:ref_to_md proj.Project.related |!
      List.map ~f:(fun s -> `P s) |!
      fun rs -> [`L rs]
    in
    let outputs = 
      List.map ~f:output_to_short_md (Output.get_all id) |!
      fun os -> [`L os]
    in      
    let team =
      List.sort ~cmp:Pervasives.compare (proj.Project.team) |!
      List.map ~f:member_to_md |!
      fun ts -> [`L ts]
    in
    let updates =
      try
        List.sort ~cmp:Update.cmp (Update.get id) |!
        List.map ~f:(update_to_md ~project:id) |!
        fun us -> `H4 "Progress" :: [`L us]  
      with Update_mismatch (msg,t) ->
        Printf.eprintf "Update mismatch: %s\n" msg;
        prerr_endline (Sexp.to_string_hum (Output.sexp_of_ty t));
        exit 1
    in
    [ title; intro ] @ related @ outputs @ team @ updates 
  ) |!
  List.concat |!
  fun ps -> `H1 "Projects" :: ps

(* Generate monthlies, which are updates + narrative for the month *)
let monthlies =
  let open Elements in
  Scanner.scan_dirs "monthly" |!
  List.map ~f:(fun d ->
    let d = Filename.basename d in
    let date = Date.of_string_iso8601_basic ~pos:0 d in
    let narrative = Markdown.from_file ["monthly";d] "monthly.md" in
    let title = `H2 (sprintf "%s %d update" (Month.to_string date.Date.m) date.Date.y) in
    (* updates for the month *)
    let updates =
      try
        List.map (Update.for_month date) ~f:(fun (p, us) ->
          match us with
          |[] -> []
          |us ->
            let proj = Project.get p in
              (`P (sprintf "*[%s](#%s)*: " proj.Project.name p)) 
              :: (List.map ~f:(update_to_md ~project:p) us))
       |! List.concat |!
       fun us -> [`H3 "Updates"; `L us]
      with Update_mismatch (msg,t) ->
        Printf.eprintf "Update mismatch: %s" msg;
        prerr_endline (Sexp.to_string_hum (Output.sexp_of_ty t));
        exit 1
    in
    title :: narrative :: updates
  ) |! List.concat |!
  fun monthlies -> `H1 "Monthly Progress" :: monthlies

let _ =
  let intro = Markdown.from_file [] "intro.md" in
  let doc = intro :: monthlies @ projects in
  let out = Markdown.ts_to_string doc in
  print_endline out
