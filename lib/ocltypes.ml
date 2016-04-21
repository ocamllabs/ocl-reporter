open Core.Std

module Person = struct
  type affiliation = [
    | `Citrix
    | `OnApp
    | `CL
    | `CLx (* For CL affiliates not directly funded by OCL or affiliated with OCL PIs *)
    | `OCP
    | `INRIA
    | `JSC
    | `Horizon
    | `Google
    | `NYU
    | `UMONS
    | `UPMC
    | `SRI
    | `Past
  ]

  let to_string (x:affiliation) =
    match x with
    | `Citrix -> "Citrix"
    | `Google -> "Google"
    | `OnApp -> "OnApp"
    | `CL -> "Cambridge Computer Laboratory"
    | `CLx -> "Cambridge Computer Laboratory"
    | `JSC -> "Jane Street Capital"
    | `OCP -> "OCamlPro"
    | `INRIA -> "INRIA"
    | `Horizon -> "Horizon"
    | `NYU -> "New York University"
    | `UMONS -> "Universite de Mons, Belgium"
    | `SRI -> "SRI International"
    | `UPMC -> "Université  Pierre et Marie Curie, Paris"
    | `Past -> "Former Members"

  let cmp (a:affiliation) (b:affiliation) =
    let order = function
    |`CL -> 0
    |`CLx -> 1
    |`Citrix -> 2
    |`OCP -> 3
    |`INRIA -> 3
    |`JSC -> 4
    |`Horizon -> 5
    |`SRI -> 6
    |`OnApp -> 7
    |`NYU -> 8
    |`UMONS -> 9
    |`UPMC -> 9
    |`Google -> 10
    |`Past -> 11
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

module Paper = struct
  type t = {
    id: string;
    title: string;
    url: string;
    authors: string;
    date: Date.t;
    conf: string;
    conf_url: string;
  }

  let mk ~id ~title ~url ~authors ~date ~conf ~conf_url =
    let date = Date.of_string date in
    { id; title; url; authors; date; conf; conf_url }
end

module Reference = struct

  type link = [
   | `Pdf of string
   | `Blog of string
   | `Github of string * string (* user, repo *)
   | `Github_issues of string * string (* user, repo *)
   | `Github_issue of string * string * int (* user, repo, issue *)
   | `Github_tag of string * string * string (* user, repo, tag *)
   | `Webpage of string
   | `Video of string
   | `Slideshare of string
   | `Mantis of int
   | `Paper of Paper.t
  ]
  and t = {
    name: string;
    link: link;
  }

  let blog ?(name="Blog Post") url =
    { name; link=(`Blog url) }

  let mantis ?(name="Bug report") num =
    { name; link=(`Mantis num) }

  let github ?(name="Github") owner repo =
    { name; link=(`Github (owner,repo)) }

  let github_issues ?(name="Issues") owner repo =
    { name; link=(`Github_issues (owner,repo)) }

  let github_issue ?(name="Issues") owner repo issue =
    { name; link=(`Github_issue (owner,repo,issue)) }

  let webpage ?(name="Homepage") url =
    { name; link=(`Webpage url) }

  let pdf ?(name="PDF") url =
    { name; link=(`Pdf url) }

  let paper ?(name="Paper") paper =
    { name=name; link=(`Paper paper) }

  let video ?(name="Video") url =
    { name; link=(`Video url) }
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
    project_elevator: string;
    team: Person.t list;
    tasks: task list;
  }
  and task = {
    task_name: string;
    task_descr: string option;
    start: Date.t;
    finish: Date.t option; (* A task with no end date ends up in the "infinity planning column" *)
    owner: Person.t;
    status: status;
    refs: Reference.t list;
    related: (string * string * string) list;
  }

  let mk_task ~name ~start ?finish ~owner ?(team=[]) ~status ?(refs=[]) ?(related=[]) ?descr () =
    let start = Date.of_string start in
    let finish = Option.map finish ~f:Date.of_string in
    { task_name=name; task_descr=descr; start; finish; owner; status; refs; related }

  let people_in_project p = 
    let rest = List.fold_left ~init:[] ~f:(fun a t -> t.owner :: a) p.tasks in
    List.dedup (p.project_owner :: p.team @ rest)

  let tasks_for_person proj person =
    List.filter proj.tasks (fun t -> t.owner = person)
end
