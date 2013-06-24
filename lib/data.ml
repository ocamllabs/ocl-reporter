open Core.Std
open Types
include Data_people
include Data_papers
include Data_news

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
        project_elevator="A rigorously designed, tested and documented base of OCaml libraries and tools.";
        team=People.([ avsm; tg; lpw25; sheets; yallop; pwang; vbotbol ]);
        tasks;
      }
    and tasks = [ 
      mk_task ~name:"OPAM 1.0 (if it builds, ship it)"
        ~start:"2012-03-15" ~finish:"2013-03-14"
        ~owner:People.tg
        ~status:`Complete
        ~descr:"opam10"
        ~related:[("OPAM 1.1", "platform", "OPAM 1.1 (the CI and Test release)")]
        ~refs:opam_refs () ;
      mk_task ~name:"OPAM 1.1 (the CI and Test release)"
        ~start:"2013-02-17" ~finish:"2013-05-01"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"opam11"
        ~related:[("OPAM 1.2", "platform", "OPAM 1.2 (the Platform release)");
                   ("OCamlot", "platform", "OCamlot")]
        ~refs: opam_refs () ;
      mk_task ~name:"OPAM 1.2 (the Platform release)"
        ~start:"2013-05-01" ~finish:"2013-08-01"
        ~owner:People.tg
        ~status:`Planning
        ~descr:"opam12"
        ~related:[("Platform Preview", "platform", "Platform Preview")]
        ~refs:opam_refs ();
      mk_task ~name:"OPAM Doc"
        ~start:"2013-01-16"
        ~owner:People.vbotbol
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
        ~descr:"ocamlot"
        ~related:[("OPAM 1.1","platform","OPAM 1.1 (the CI and Test release)");
                  ("Machine Pool", "platform", "Machine Pool")]
        ~refs:[ Reference.github "ocamllabs" "ocamlot" ] () ;
      mk_task ~name:"Machine Pool"
        ~start:"2012-11-16"
        ~finish:"2013-06-01"
        ~owner:People.avsm
        ~status:`Doing ()
        ~descr:"machine-pool"
        ~related:[("OCamlot", "platform", "OCamlot")];

      mk_task ~name:"Platform Preview"
        ~start:"2013-03-01" ~finish:"2013-07-01"
        ~owner:People.amir
        ~status:`Planning ()
        ~descr:"platform-prev"
        ~related:[("OPAM 1.2", "platform", "OPAM 1.2 (the Platform release)");
                  ("OCamlot", "platform", "OCamlot")]
        ~refs:[ Reference.webpage ~name:"Platform mailing list" "http://lists.ocaml.org/listinfo/platform" ];

      mk_task ~name:"Foreign Function Interface"
        ~start:"2013-03-01" ~finish:"2013-06-01"
        ~owner:People.yallop
        ~status:`Complete ()
        ~descr:"ctypes"
        ~refs:[ Reference.github "ocamllabs" "ctypes";
                Reference.webpage ~name:"Documentation" "https://github.com/ocamllabs/ocaml-ctypes/wiki" ];
    ]
  end

  module T2 = struct
    let rec project =
      { project_id="t2"; 
        project_name="Trilogy 2"; 
        project_owner=People.avsm;
        project_elevator="Building a resilient liquid OS, with multipath and adaptive scheduling.";
        team=People.([ vsevolod; gparisis; amir; crowcroft; tg ]);
        tasks;
      }
    and tasks = [ 
       mk_task ~name:"Polyversal TCP prototype"
        ~start:"2012-10-01"
        ~finish:"2013-09-01"
        ~owner:People.vsevolod
        ~status:`Doing
        ~descr:"pvtcp"
        ~refs: [
           Reference.github "ocamllabs" "pvtcp";
           Reference.paper ~name:"Position paper" conext_pvtcp;
         ] ();
       mk_task ~name:"Irminsule"
        ~start:"2013-03-01"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"irminsule"
        ~refs:[ Reference.github "samoht" "cagit" ] () ;
    ]
  end

  module Compiler = struct

    let rec project = {
      project_id="compiler";
      project_name="The OCaml Compiler" ;
      project_owner = People.lpw25; 
      project_elevator="Maintaining, extending and documenting the core OCaml compiler toolchain";
      team = People.([ yallop; stedolan; avsm ]);
      tasks;
    }
    and tasks = [
      mk_task ~name:"Open types"
        ~start:"2012-10-01" ~finish:"2013-01-09"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"open-types"
        ~refs:[ Reference.github "lpw25" "ocaml-open";
                Reference.webpage ~name:"Website" "http://sites.google.com/site/ocamlopen/" ] ();
      mk_task ~name:"Record disambiguation"
        ~start:"2012-09-03" ~finish:"2012-12-02"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"record-disambiguation"
        ~refs:[
          Reference.webpage ~name:"Mantis" "http://caml.inria.fr/mantis/view.php?id=5759" ;
          Reference.mantis 5584;
        ] () ;
      mk_task ~name:"Syntax extensions"
        ~start:"2012-12-01" ~finish:"2013-06-01"
        ~owner:People.lpw25
        ~status:`Doing
        ~descr:"syntax-extensions"
        ~refs:[ Reference.webpage ~name:"Working group" "http://lists.ocaml.org/listinfo/wg-camlp4";
                Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/01/23/camlp4-alternative-part-1.html"] () ;
      mk_task ~name:"Namespaces"
        ~start:"2013-02-01"
        ~owner:People.lpw25
        ~status:`Planning
        ~descr:"namespaces"
        ~refs:[
          Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/03/10/ocaml-namespaces.html" ;
          Reference.webpage ~name:"Epic Mail Thread" "http://lists.ocaml.org/pipermail/platform/2013-February/000050.html"
       ] () ;
      mk_task ~name:"Multicore"
        ~start:"2013-03-01"
        ~owner:People.stedolan
        ~descr:"multicore"
        ~status:`Planning
        ~refs: [ Reference.github "stedolan" "ocaml" ] ();
      mk_task ~name:"Compile-time meta programming"
        ~start:"2013-04-01"
        ~owner:People.yallop
        ~status:`Planning
        ~descr:"meta-programming" ();
      mk_task ~name:"Emission of DWARF debugging information"
        ~start:"2013-01-01" ~finish:"2013-06-01"
        ~owner:People.shinwell
        ~status:`Doing
        ~descr:"dwarf" 
        ~refs: [ Reference.github ~name:"4.00.1-allocation-profiling" "mshinwell" "ocaml" ] ();
      mk_task ~name:"OCaml Java 2.0"
        ~start:"2013-04-01" ~finish:"2013-08-01"
        ~owner:People.xclerc
        ~status:`Doing
        ~descr:"ocamljava2" 
        ~refs: [ Reference.webpage "http://ocamljava.x9c.fr/preview/" ] ();
    ]
  end

  module Outreach = struct

    let rec project = {
      project_id="outreach";
      project_name="Community Outreach" ;
      project_owner = People.amir; 
      project_elevator="Building an effective online presence for the worldwide OCaml community";
      team = People.([ avsm ]);
      tasks;
    }
    and tasks = [
      mk_task ~name:"Real World OCaml"
        ~start:"2011-05-01" ~finish:"2013-08-01"
        ~owner:People.avsm
        ~status:`Doing
        ~descr:"rwo-book"
        ~refs:[ Reference.webpage ~name:"Homepage" "http://realworldocaml.org";
                Reference.webpage ~name: "Twitter" "http://twitter.com/RealWorldOCaml"] ();
      mk_task ~name:"Book review site"
        ~start:"2011-06-01" ~finish:"2013-01-01"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"rwo-review-site"
        ~related:[("Real World OCaml", "outreach", "Real World OCaml")]
        ~refs:[ Reference.webpage ~name:"Homepage" "http://realworldocaml.org" ] ();
      mk_task ~name:"Meta preprocessor"
        ~start:"2013-04-01" ~finish:"2013-08-01"
        ~owner:People.pwang
        ~status:`Planning
        ~descr:"mpp"
        ~related:[("Real World OCaml", "outreach", "Book review site")]
        ~refs:[ Reference.github ~name:"mpp code" "pw374" "MPP-language-blender" ] ();
      mk_task ~name:"OCaml.org infrastructure"
        ~start:"2011-08-01" ~finish:"2013-02-01"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"ocaml-org-infra"
        ~related:[("OCamlot", "platform", "OCamlot")]
        ~refs:[ Reference.webpage ~name:"Wiki" "" ] () ;
      mk_task ~name:"OCaml.org redesign"
        ~start:"2013-01-01" ~finish:"2013-05-01"
        ~owner:People.amir
        ~status:`Doing
        ~descr:"ocaml-org-design"
        ~refs:[ Reference.webpage ~name:"OCaml.org" "http://ocaml.org";
                Reference.webpage ~name:"Wiki" "https://github.com/ocaml/ocaml.org/wiki";
                Reference.webpage ~name:"Blog" "http://amirchaudhry.com/wireframe-demos-for-ocamlorg" ] () ;
    ]
  end

  module Illuminate = struct
    let project_owner = People.avsm
    let team = People.([ amir; pwang; sheets; iml; crowcroft ])

    let rec project = {
      project_id="illuminate";
      project_name="Illuminate";
      project_elevator="Connecting cyber-physical devices with rigorous programming, coordination and persistence.";
      team; project_owner; tasks;
    } and tasks = [

      mk_task ~name:"Signpost prototype"
        ~start:"2012-08-01" ~finish:"2013-06-01"
        ~owner:People.heidi
        ~status:`Doing
        ~descr:"signpostv1"
        ~refs:[
         ] ();

      mk_task ~name:"Real-time templating"
       ~start:"2013-03-01" ~finish:"2013-08-01"
       ~owner:People.pwang
       ~status:`Planning
       ~descr:"templates"
       ~related:[("Meta preprocessor", "outreach", "Meta preprocessor")]
       ~refs: [       ] ();

      mk_task ~name:"Declarative graphing library"
       ~start:"2013-04-14" ~finish:"2013-07-14"
       ~owner:People.dbunzli
       ~status:`Doing
       ~descr:"vg"
       ~related:[("Real-time templating", "illuminate", "Real-time templating")]
       ~refs: [
         Reference.webpage ~name:"Gg library" "http://erratique.ch/software/gg";
         Reference.webpage ~name:"Vg library" "http://erratique.ch/software/vg";
       ] ();

      mk_task ~name:"Raspberry OCaml"
       ~start:"2012-11-01" ~finish:"2013-02-01"
       ~owner:People.avsm
       ~status:`Complete
       ~descr:"raspberryocaml"
       ~refs: [ 
         Reference.mantis 5798;
         Reference.blog ~name:"Jane Street blog" "https://ocaml.janestreet.com/?q=node/110";
       ]  ();
    ]

  end

  module Mirage = struct
    let project_owner = People.avsm
    let team = People.([ tg; amir; djs; crowcroft; mort; balrajsingh; raphael; smh; haris; rwatson; vb; jludlam; lars; mac; gabor ])

    let rec project = { 
      project_id="mirage";
      project_name="Mirage OS"; 
      project_elevator="A high-performance, type-safe library OS written in OCaml.";
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
        ~start:"2012-12-01" ~finish:"2013-05-01"
        ~owner:People.amir
        ~status:`Doing
        ~descr:"xen-org"
        ~refs:[ Reference.webpage ~name:"Proposal" "http://wiki.xen.org/wiki/Mirage_Incubation_Project_Proposal";
                Reference.webpage ~name:"Xen.org Mirage Page" "http://www.xenproject.org/developers/teams/mirage-os.html" ] ();
      mk_task ~name:"Mirari"
        ~start:"2013-02-02" ~finish:"2013-05-01"
        ~owner:People.vb
        ~status:`Doing
        ~descr:"mirari"
        ~refs:[ Reference.github "mirage" "mirari" ] () ;
      mk_task ~name:"Thespian"
        ~start:"2013-04-15" ~finish:"2013-07-01"
        ~owner:People.euan
        ~status:`Doing
        ~descr:"thespian"
        ~refs:[  ] () ;
      mk_task ~name:"Mirage Developer Preview"
        ~start:"2013-02-26" ~finish:"2013-07-26"
        ~owner:People.djs
        ~status:`Planning
        ~descr:"dev-preview"
        ~refs: [
           Reference.github "mirage" "mirage-platform";
           Reference.webpage ~name:"Meeting Minutes" "http://openmirage.org/wiki/weekly-2013-04-16";
        ] () ;
      mk_task ~name:"Formalisms for packet processing"
        ~start:"2013-04-01" ~finish:"2013-10-01"
        ~owner:People.balrajsingh
        ~status:`Planning
        ~descr:"packet-proc" ();
      mk_task ~name:"kFreeBSD"
        ~start:"2013-06-01" ~finish:"2013-09-01"
        ~owner:People.gabor
        ~status:`Doing
        ~descr:"kfreebsd" ();
      mk_task ~name:"Nigori"
        ~start:"2012-10-01" ~finish:"2013-06-01"
        ~owner:People.bogdan
        ~status:`Doing ~descr:"nigori" 
        ~refs: [
          Reference.pdf ~name:"Original Nigori paper" "http://www.links.org/files/nigori-overview.pdf";
        ] ();
    ] 
  end

  let all = [ Platform.project; Mirage.project; Illuminate.project;
              Compiler.project; T2.project; Outreach.project ]
end

