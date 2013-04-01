open Core.Std

module Person = struct
  type affiliation = [
    | `Citrix
    | `OnApp
    | `CL
    | `OCP
    | `JSC
    | `Horizon
    | `Google
    | `NYU
    | `UMONS
    | `SRI
  ]

  let to_string (x:affiliation) =
    match x with
    | `Citrix -> "Citrix"
    | `Google -> "Google"
    | `OnApp -> "OnApp"
    | `CL -> "Cambridge Computer Laboratory"
    | `JSC -> "Jane Street Capital"
    | `OCP -> "OCamlPro"
    | `Horizon -> "Horizon"
    | `NYU -> "New York University"
    | `UMONS -> "Universite de Mons, Belgium"
    | `SRI -> "SRI International"

  let cmp (a:affiliation) (b:affiliation) =
    let order = function
    |`CL -> 0
    |`Citrix -> 1
    |`OCP -> 2
    |`JSC -> 3
    |`Horizon -> 4
    |`SRI -> 5
    |`OnApp -> 6
    |`NYU -> 7
    |`UMONS -> 8
    |`Google -> 9
    in compare (order a) (order b)

  type t = {
    id: string;
    name: string;
    affiliation: affiliation;
    role: string;
    homepage: string option;
    bio: string option;
    mugshot: string option;
  }

  (* Group people by affiliation *)
  let by_affiliation =
    List.fold_left ~init:[] ~f:(fun a b ->
      match List.Assoc.find a b.affiliation with
      |None -> List.Assoc.add a b.affiliation [b]
      |Some v ->
        (* TODO is there a List.Assoc.replace? *)
        let l = List.Assoc.remove a b.affiliation in
        List.Assoc.add l b.affiliation (b::v)
    )
end

module Reference = struct

  type link = [
   | `Pdf of string
   | `Blog of string
   | `Github of string * string (* user, repo *)
   | `Github_tag of string * string * string (* user, repo, tag *)
   | `Webpage of string
   | `Video of string
   | `Slideshare of string
   | `Mantis of int
   | `Paper of string * string * string (* URL, authors , descr *)
  ]
  and t = {
    name: string;
    link: link;
  }

  let github ?(name="") owner repo =
    { name; link=(`Github (owner,repo)) }

  let webpage ?(name="") url =
    { name; link=(`Webpage url) }
end

module Output = struct

  type ty = [
   | `Paper of Reference.t (* conference ref *)
   | `Blog_post
   | `Talk of Reference.t (* conference ref *)
   | `Event of string list (* people id list *)
   | `Article of Reference.t (* publication ref *)
   | `Asset
   | `Code
  ]
  and t = {
    id: string;
    ref: Reference.t;
    ty: ty;
    descr: string;
  }
end

module Project = struct

  type status =
    [ `Planning
    | `Doing
    | `Complete
    ]
   
  let status_to_string = function
    |`Planning -> "planning"
    |`Doing -> "doing"
    |`Complete -> "complete"

   type project = {
    project_id: string;
    project_name: string;
    project_owner: Person.t;
    team: Person.t list;
    tasks: task list;
  }
  and task = {
    task_name: string;
    start: Date.t;
    finish: Date.t option; (* A task with no end date ends up in the "infinity planning column" *)
    owner: Person.t;
    status: status;
    refs: Reference.t list;
  }
end
