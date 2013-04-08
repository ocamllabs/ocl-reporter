open Core.Std
open Types
include Data_people
include Data_papers

module Projects = struct
  open Project
  module Platform = struct

   let opam_refs = [ 
     Reference.github "OCamlPro" "opam";
     Reference.webpage "http://ocamlpro.opam.com";
     Reference.pdf ~name:"Developer Manual" "https://github.com/OCamlPro/opam/blob/master/doc/dev-manual/dev-manual.pdf?raw=true";
     Reference.github_issues "OCamlPro" "opam";
   ]
    let rec project =
      { project_id="platform"; 
        project_name="OCaml Platform"; 
        project_owner=People.amir;
        team=People.([ avsm; tg; lpw25; sheets; yallop; pwang ]);
        tasks;
      }
    and tasks = [ 
      mk_task ~name:"OPAM 1.0 (if it builds, ship it)"
        ~start:"2012-03-15" ~finish:"2013-03-14"
        ~owner:People.tg
        ~status:`Complete
        ~descr:"opam10"
        ~refs:opam_refs () ;
      mk_task ~name:"OPAM 1.1 (the CI and Test release)"
        ~start:"2013-02-17" ~finish:"2013-05-01"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"opam11"
        ~refs: opam_refs () ;
      mk_task ~name:"OPAM 1.2 (the Platform release)"
        ~start:"2013-05-01" ~finish:"2013-08-01"
        ~owner:People.tg
        ~status:`Planning
        ~descr:"opam12"
        ~refs:opam_refs ();
      mk_task ~name:"OPAM Doc"
        ~start:"2013-01-16"
        ~owner:People.lpw25
        ~status:`Doing
        ~descr:"opam-doc"
        ~refs:[ 
           Reference.github ~name:"opam-doc" "lpw25" "opam-doc" ;
           Reference.github ~name:"bin-doc" "lpw25" "bin-doc" ;
         ] () ;
      mk_task ~name:"OCamlot"
        ~start:"2013-01-16"
        ~owner:People.sheets
        ~status:`Planning
        ~refs:[ Reference.github "ocamllabs" "ocamlot" ] () ;
      mk_task ~name:"Platform Preview"
        ~start:"2013-03-01" ~finish:"2013-06-01"
        ~owner:People.amir
        ~status:`Planning () ;
    ]
  end

  module Compiler = struct

    let rec project = {
      project_id="compiler";
      project_name="The OCaml Compiler" ;
      project_owner = People.lpw25; 
      team = People.([ yallop ]);
      tasks;
    }
    and tasks = [
      mk_task ~name:"Open types"
        ~start:"2012-10-01" ~finish:"2013-01-09"
        ~owner:People.lpw25
        ~status:`Complete
        ~refs:[ Reference.github "lpw25" "ocaml-open" ] ();
      mk_task ~name:"Record disambiguation"
        ~start:"2012-09-03" ~finish:"2012-12-02"
        ~owner:People.lpw25
        ~status:`Complete
        ~refs:[ Reference.webpage ~name:"Mantis" "http://caml.inria.fr/mantis/view.php?id=5759" ] () ;
      mk_task ~name:"Camlp4 redesign"
        ~start:"2012-12-01" ~finish:"2013-03-01"
        ~owner:People.lpw25
        ~status:`Doing
        ~refs:[ Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/02/05/camlp4-alternative-part-2.html"] () ;
      mk_task ~name:"Namespaces"
        ~start:"2013-02-01"
        ~owner:People.lpw25
        ~status:`Planning
        ~refs:[ Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/03/10/ocaml-namespaces.html" ] () ;
      mk_task ~name:"Multicore"
        ~start:"2013-03-01"
        ~owner:People.stedolan
        ~status:`Planning () ;
    ]
  end

  module Outreach = struct

    let rec project = {
      project_id="outreach";
      project_name="Community Outreach" ;
      project_owner = People.amir; 
      team = People.([ avsm ]);
      tasks;
    }
    and tasks = [
      mk_task ~name:"Book review site"
        ~start:"2011-06-01" ~finish:"2013-01-01"
        ~owner:People.avsm
        ~status:`Complete
        ~refs:[ Reference.webpage ~name:"Homepage" "http://realworldocaml.org" ] ();
      mk_task ~name:"OCaml.org infrastructure"
        ~start:"2011-08-01" ~finish:"2013-02-01"
        ~owner:People.avsm
        ~status:`Complete
        ~refs:[ Reference.webpage ~name:"Wiki" "" ] () ;
      mk_task ~name:"Real World OCaml"
        ~start:"2011-05-01" ~finish:"2013-08-01"
        ~owner:People.avsm
        ~status:`Doing
        ~refs:[ Reference.webpage ~name:"Homepage" "http://realworldocaml.org" ] ();
      mk_task ~name:"OCaml.org redesign"
        ~start:"2013-01-01" ~finish:"2013-05-01"
        ~owner:People.amir
        ~status:`Doing ();
    ]
  end

  module Mirage = struct
    let project_owner = People.avsm
    let team = People.([ amir; djs ])

    let rec project = { 
      project_id="mirage";
      project_name="Mirage OS"; 
      team; project_owner; tasks 
    } and tasks = [
      mk_task ~name:"Unikernel Mirage prototype"
        ~start:"2012-08-01" ~finish:"2013-03-02"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"asplos2013"
        ~refs:[
           Reference.paper ~name:"ASPLOS 2013" asplos_2013;
           Reference.paper ~name:"HotCloud 2010" hotcloud_2010;
         ] ();    
      mk_task ~name:"Xen.org incubation"
        ~start:"2012-12-01" ~finish:"2013-04-01"
        ~owner:People.amir
        ~status:`Doing
        ~refs:[ Reference.webpage ~name:"Proposal" "http://wiki.xen.org/wiki/Mirage_Incubation_Project_Proposal" ] ();
      mk_task ~name:"Mirari"
        ~start:"2013-02-02" ~finish:"2013-05-01"
        ~owner:People.vb
        ~status:`Doing
        ~refs:[ Reference.github "mirage" "mirari" ] () ;
      mk_task ~name:"Mirage Developer Preview"
        ~start:"2013-02-26" ~finish:"2013-07-26"
        ~owner:People.djs
        ~status:`Planning
        ~refs: [ Reference.github "mirage" "mirage-platform" ] () ;
      mk_task ~name:"Formalisms for packet processing"
        ~start:"2013-04-01" ~finish:"2013-10-01"
        ~owner:People.balrajsingh
        ~status:`Planning ()
    ] 
  end

  let all = [ Platform.project; Mirage.project;
              Compiler.project; Outreach.project ]
end

