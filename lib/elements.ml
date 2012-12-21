(*
 * Copyright (c) 2012 Anil Madhavapeddy <anil@recoil.org>
 * Copyright (c) 2012 Leo White <lpw25@cl.cam.ac.uk>
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

(* Holds all the modules that manipulate the sexp files for people, outputs,
 * updates and projects *)
open Core.Std

module Person = struct
  include Report_types.Person
  (* Scan the people list on disk *)
  exception Unknown of string
  let people = Scanner.scan t_of_sexp "people"

  let get id =
    match List.findi people ~f:(fun _ p -> p.id = id) with
    | None -> raise (Unknown id)
    | Some (_,p) -> p

  (* Compare people, role first, then alphabetical *)
  let cmp a b =
    match a.role, b.role with
    |None, None -> compare a.name b.name
    |Some _, None -> (-1)
    |None, Some _ -> 1
    |Some a, Some b -> compare b a

  (* Get all, sorted *)
  let all =
     List.sort ~cmp people

  (* Sort people by affiliation and return a sorted List.Assoc of them *)
  let by_affiliation =
    List.fold_left people ~init:[] ~f:(fun a b ->
      match List.Assoc.find a b.affiliation with
      |None -> List.Assoc.add a b.affiliation [b]
      |Some v ->
        (* TODO is there a List.Assoc.replace? *)
        let l = List.Assoc.remove a b.affiliation in
        List.Assoc.add l b.affiliation (b::v)
    ) |!
    List.map ~f:(fun (org, people) -> (org, List.sort ~cmp people)) 

  (* Split out the CUCL from the org list *)
  let of_cucl, of_other =
    let cucl = List.Assoc.find_exn by_affiliation `CL in
    let other = List.Assoc.remove by_affiliation `CL in
    cucl, other
   
end

module Reference = Report_types.Reference

module Output = struct

  include Report_types.Output

  (* Scan all the outputs on disk *)
  let outputs =
    Scanner.scan_dirs "projects" |!
    List.map ~f:(fun dir ->
      let project = Filename.basename dir in
      let outputs = Scanner.loads dir "outputs.scm" t_of_sexp in
      let outputs_github = try Scanner.loads dir "outputs-github.scm" t_of_sexp with _ -> [] in
      project, (outputs @ outputs_github)
    )

  exception Unknown_project of string
  exception Unknown of string

  let get_all project = 
    match List.Assoc.find outputs project with
    |None -> raise (Unknown project)
    |Some outputs -> outputs

  let get project id =
    let outputs = get_all project in 
      match List.find outputs ~f:(fun o -> o.id = id) with
      | None -> raise (Unknown id)
      | Some o -> o

  (* Search all projects for the output *)
  let search id =
    let (pid,os) = List.find_exn outputs ~f:(fun (p,os) ->
      match List.find os ~f:(fun o -> o.id = id) with
      |None -> false
      |Some _ -> true
    ) in
    get pid id
end

module Update = struct
  include Report_types.Update

  let cmp a b = Date.compare b.date a.date

  (* Scan all the updates on disk *)
  let updates =
    Scanner.scan_dirs "projects" |!
    List.map ~f:(fun dir ->
      let project = Filename.basename dir in
      let updates_ma = Scanner.loads dir "updates.scm" t_of_sexp in
      let updates_gh = try Scanner.loads dir "updates-github.scm" t_of_sexp with _ -> [] in
      let updates = List.sort ~cmp (updates_ma @ updates_gh) in
      project, updates
    )

  exception Unknown of string
  let get project =
    match List.Assoc.find updates project with
    |None -> raise (Unknown project)
    |Some p -> p

  let for_month date =
    List.map updates ~f:(fun (project, updates) ->
      (project, List.filter updates ~f:(fun update ->
        update.date.Date.y = date.Date.y &&
        update.date.Date.m = date.Date.m)))
    |! List.filter ~f:(function _,[] -> false |_ -> true)

  let filter_recent =
    let now = Date.of_tm (Unix.(gmtime (gettimeofday ()))) in
    fun u -> Date.diff now u.date < 90
 
  let get_recent project =
    let r = get project in
    if List.length r > 10 then List.filter ~f:filter_recent r else r
 
  let output_id_of_update u =
    match u.ty with
    |`Published id -> id
    |`Draft id -> id
    |`Accepted id -> id
    |`Event id -> id
    |`Press id -> id
    |`Release (id,_) -> id

  let output_of_update u =
    Output.search (output_id_of_update u)
 
  (* Updates for a particular output *)
  let for_output pid oid =
    List.filter (get pid) ~f:(fun u -> output_id_of_update u = oid)

  (* Check that every output has an update associated with it *)
  let _consistency_check =
    List.iter Output.outputs ~f:(fun (pid,os) ->
      List.iter os ~f:(fun o ->
        if List.length (for_output pid o.Output.id) = 0 then
          failwith (sprintf "No updates for output %s found" o.Output.id)
      )
    )
end

module Project = struct

  include Report_types.Project

  let cmp a b =
    compare (Output.get_all b.id) (Output.get_all a.id)

  (* Scan all the projects on disk *)
  let projects =
    Scanner.scan_dirs "projects" |!
    List.map ~f:(fun dir -> Scanner.load dir "project.scm" t_of_sexp) |!
    List.sort ~cmp 

  exception Unknown of string
  let get project =
    match List.findi ~f:(fun _ p -> p.id = project) projects with
    |None -> raise (Unknown project)
    |Some (_,p) -> p

  let of_type ty =
    List.filter projects ~f:(fun proj -> proj.ty = ty)

  (* List of projects a person is associated with, broken up
   * by the type. *)
  let for_person id =
    List.map all_types ~f:(fun ty ->
      List.filter projects ~f:(fun proj ->
        proj.ty = ty &&
        List.exists ~f:(fun m -> m.person = id) proj.team) |!
      fun res -> ty, res
    ) |!
    List.filter ~f:(function |(_,[]) -> false |(_,_) -> true)

  (* Get sorted outputs for a project, based on last update *)
  let get_outputs pid =
    let get_last_update o = List.hd_exn (Update.for_output pid o.Output.id) in
    Output.get_all pid |!
    List.sort ~cmp:(fun a b ->
      Update.cmp (get_last_update a) (get_last_update b)
    )

  (* Get the project that an output is associated with *)
  let get_project_for_output oid = 
    List.find_exn ~f:(fun p ->
      match List.find (Output.get_all p.id) ~f:(fun x -> x.Output.id=oid) with
      |None -> false
      |Some _ -> true
    ) projects

  let get_output oid =
    Output.get (get_project_for_output oid).id oid

  let cmp_team a b =
    compare a.since b.since
end
