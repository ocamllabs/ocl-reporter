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
  ] with sexp

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

  type t = {
    id: string;
    name: string;
    affiliation: affiliation with default(`CL);
    role: string sexp_option;
    homepage: string option with default(None);
    bio: string option with default(None);
  } with sexp
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
    link: link sexp_option;
  } with sexp

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
    extra: Reference.t sexp_list;
  } with sexp

end

module Update = struct

  type ty = [
   | `Published of string  (* paper or blog_post id *)
   | `Draft of string  (* paper id *)
   | `Accepted of string  (* paper id *)
   | `Event of string (* meeting or talk id *)
   | `Press of string (* article id *)
   | `Release of string * Reference.t (* code id, version ref *)
  ]

  let sexp_of_ty ty =
    let open Sexp in
      match ty with
      | `Published id -> 
          List [Atom "Published"; sexp_of_string id]
      | `Draft id -> 
          List [Atom "Draft"; sexp_of_string id]
      | `Accepted id -> 
          List [Atom "Accepted"; sexp_of_string id]
      | `Event id -> 
          List [Atom "Event"; sexp_of_string id]
      | `Press id -> 
          List [Atom "Press"; sexp_of_string id]
      | `Release(id, ver)  -> 
          List [Atom "Release"; 
                sexp_of_string id; 
                Reference.sexp_of_t ver]

  let ty_of_sexp sexp =
    let open Sexp in
    let open Sexplib.Conv_error in
      match sexp with
      | List [Atom "Published"; el] -> 
          `Published (string_of_sexp el)
      | List [Atom "Draft"; el] -> 
          `Draft (string_of_sexp el)
      | List [Atom "Accepted"; el] -> 
          `Accepted (string_of_sexp el)
      | List [Atom "Event"; el] -> 
          `Event (string_of_sexp el)
      | List [Atom "Press"; el] -> 
          `Press (string_of_sexp el)
      | List [Atom "Release"; el1; el2] -> 
          `Release (string_of_sexp el1, Reference.t_of_sexp el2)
      | Atom "Published" | List (Atom "Published" :: _) -> 
          stag_incorrect_n_args "ty" "Published" sexp
      | Atom "Draft" | List (Atom "Draft" :: _) ->
          stag_incorrect_n_args "ty" "Draft" sexp
      | Atom "Accepted" | List (Atom "Accepted" :: _) ->
          stag_incorrect_n_args "ty" "Accepted" sexp
      | Atom "Event" | List (Atom "Event" :: _) ->
          stag_incorrect_n_args "ty" "Event" sexp
      | Atom "Press" | List (Atom "Press" :: _) ->
          stag_incorrect_n_args "ty" "Press" sexp
      | Atom "Release" | List (Atom "Release" :: _) ->
          stag_incorrect_n_args "ty" "Release" sexp
      | Atom _ | List _ -> 
          unexpected_stag "ty" sexp

  type t = {
    date: Date.t;
    ty: ty;
    descr: string;
  } with sexp
end

module Project = struct

  type project_type = [
   | `Systems
   | `Platform
   | `Compiler
  ] and member = {
    person: string; (* looked up dynamically with People.get *)
    role: string;
    since: string;
  } 
  and t = {
    id: string;
    ty: project_type;
    name: string;
    team: member list;
    related: Reference.t sexp_list;
  } with sexp

  let all_types = [ `Systems ; `Platform ; `Compiler ]

  let string_of_project_type =
    function
    |`Systems -> "Systems"
    |`Platform -> "Platform"
    |`Compiler -> "Compiler"
end
