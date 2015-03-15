open Core.Std
open Types
include Data_people
include Data_papers
include Data_news

module Projects = struct
  open Project

  module Platform = struct

   let opam_refs = [
     Reference.github "ocaml" "opam";
     Reference.webpage "https://opam.ocaml.org";
     Reference.pdf ~name:"Developer Manual" "https://github.com/ocaml/opam/blob/master/doc/dev-manual/dev-manual.pdf?raw=true";
     Reference.github_issues "ocaml" "opam";
   ]

   let ocamlot_refs = [
     Reference.github ~name:"ocamlot-state" "ocamlot" "ocamlot-state";
     Reference.github ~name:"ocamlot" "ocamllabs" "ocamlot";
     Reference.github_issues "ocamllabs" "ocamlot";
     Reference.blog ~name:"Travis and OPAM" "http://anil.recoil.org/2013/09/30/travis-and-ocaml.html";
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
      mk_task ~name:"OPAM 1.0"
        ~start:"2012-03-15" ~finish:"2013-03-14"
        ~owner:People.tg
        ~status:`Complete
        ~descr:"opam10"
        ~related:[("OPAM 1.1", "platform", "OPAM 1.1 (the CI and Test release)")]
        ~refs:opam_refs () ;
      mk_task ~name:"OPAM 1.1"
        ~start:"2013-02-17" ~finish:"2013-10-01"
        ~owner:People.tg
        ~status:`Complete
        ~descr:"opam11"
        ~related:[("OPAM 1.2", "platform", "OPAM 1.2 (the Platform release)");
                   ("OCamlot", "platform", "OCamlot")]
        ~refs: opam_refs () ;
      mk_task ~name:"OPAM 1.2"
        ~start:"2013-11-01" ~finish:"2014-10-01"
        ~owner:People.tg
        ~status:`Complete
        ~descr:"opam12"
        ~related:[("Platform Preview", "platform", "Platform Preview")]
        ~refs: (opam_refs @ [
          Reference.webpage ~name:"ChangeLog" "https://raw.githubusercontent.com/ocaml/opam/1.2.0/CHANGES";
          Reference.webpage ~name:"Release Post" "https://opam.ocaml.org/blog/opam-1-2-0-release/";
        ]) ();

      mk_task ~name:"OPAM-in-a-box"
        ~start:"2013-12-01" ~finish:"2015-05-01"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"opaminabox"
        ~related:[("OPAM 1.2", "platform", "OPAM 1.2 (the Platform release)")]
        ~refs:[ Reference.github_issue ~name:"Task ticket" "ocaml" "opam" 1035
        ] ();

      mk_task ~name:"OPAMDoc prototype"
        ~start:"2013-01-16" ~finish:"2013-11-01"
        ~owner:People.vbotbol
        ~status:`Complete
        ~descr:"opam-doc"
        ~related:[("Codoc", "platform", "Codoc")]
        ~refs:[
           Reference.github ~name:"opam-doc" "ocamllabs" "opam-doc" ;
           Reference.webpage ~name:"Snapshot Docs" "http://mirage.github.io"
         ] () ;

      mk_task ~name:"OCamlot 0.2.0"
        ~start:"2013-03-31" ~finish:"2013-09-15"
        ~owner:People.sheets
        ~status:`Complete
        ~descr:"ocamlot.0.2"
        ~related:[("OPAM 1.0","platform","OPAM 1.0");
                  ("Machine Pool", "platform", "Machine Pool")]
        ~refs: ocamlot_refs () ;

      mk_task ~name:"Non-x86 Machines"
        ~start:"2012-11-16" ~finish:"2013-06-01"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"machine-pool"
        ~related:[("OCamlot", "platform", "OCamlot")] ();

      mk_task ~name:"Platform Preview"
        ~start:"2013-01-01" ~finish:"2013-07-01"
        ~owner:People.amir
        ~status:`Complete
        ~descr:"platform-prev"
        ~related:[("OPAM 1.2", "platform", "OPAM 1.2 (the Platform release)");
                  ("OCamlot", "platform", "OCamlot")]
        ~refs:[
          Reference.pdf ~name:"OCaml 2013 status" "http://ocaml.org/meetings/ocaml/2013/slides/madhavapeddy.pdf";
          Reference.webpage ~name:"Platform mailing list" "http://lists.ocaml.org/listinfo/platform"
        ] ();

      mk_task ~name:"Ctypes 0.1"
        ~start:"2013-03-01" ~finish:"2013-07-01"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"ctypes"
        ~refs:[ Reference.github "ocamllabs" "ctypes";
                Reference.webpage ~name:"Documentation" "https://github.com/ocamllabs/ocaml-ctypes/wiki" ]
        ();
      mk_task ~name:"Ctypes Stubgen"
        ~start:"2013-09-01"
        ~finish:"2015-03-15"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"ctypes-stubs"
        ~refs:[ Reference.github "ocamllabs" "ctypes";
                Reference.webpage ~name:"Documentation" "https://github.com/ocamllabs/ocaml-ctypes/wiki";
                Reference.pdf ~name:"OCaml 2013 demo" "http://ocaml.org/meetings/ocaml/2013/proposals/ctypes.pdf" ]
        ~related:[("Ctypes", "platform", "Ctypes")]
        ();

      mk_task ~name:"Docker Builds"
        ~start:"2014-06-01"
        ~finish:"2015-04-01"
        ~owner:People.avsm
        ~status:`Doing
        ~descr:"opam-bulk"
        ~refs: [ Reference.github "avsm" "ocaml-dockerfile";
                 Reference.webpage ~name:"Output" "http://www.recoil.org/~avsm/opam-bulk"; ]
        ~related:[("OPAM 1.2", "platform", "OPAM 1.2")] ();

      mk_task ~name:"OCaml.org governance"
        ~start:"2014-07-01"
        ~finish:"2015-06-01"
        ~owner:People.amir
        ~status:`Doing
        ~descr:"governance"
        ~refs: [ Reference.blog "http://amirchaudhry.com/towards-governance-framework-for-ocamlorg/" ] ();

      mk_task ~name:"Codoc 0.2.0"
        ~start:"2014-04-01"
        ~finish:"2015-02-20"
        ~owner:People.sheets
        ~status:`Complete
        ~descr:"codoc.0.2.0"
        ~refs: [ Reference.blog ~name:"Blog post" "http://opam.ocaml.org/blog/codoc-0-2-0-released/";
                 Reference.github_issues "dsheets" "codoc";
                 Reference.github ~name:"Codoc" "dsheets" "codoc";
                 Reference.github ~name:"Doc-Ock-Lib" "lpw25" "doc-ock-lib";
                 Reference.github ~name:"Doc-Ock-XML" "dsheets" "doc-ock-xml";
                 Reference.paper Data_papers.ocaml_platform_2014;
                 Reference.pdf ~name:"Slides" "http://ocaml.org/meetings/ocaml/2014/ocl-platform-2014-slides.pdf"
        ] ();

      mk_task ~name:"Assemblage"
        ~start:"2014-06-10"
        ~finish:"2015-06-10"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"assemblage"
        ~refs: [ Reference.github "samoht" "assemblage";
                 Reference.github_issues "samoht" "assemblage";
                 Reference.paper Data_papers.ocaml_platform_2014;
                 Reference.pdf ~name:"Slides" "http://ocaml.org/meetings/ocaml/2014/ocl-platform-2014-slides.pdf" ]
        ();
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
        ~start:"2012-10-01" ~finish:"2014-05-05"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"open-types"
        ~refs:[ Reference.github "lpw25" "ocaml-open";
                Reference.webpage ~name:"Website" "http://sites.google.com/site/ocamlopen/";
                Reference.mantis 5584] ();

      mk_task ~name:"Record disambiguation"
        ~start:"2012-09-03" ~finish:"2013-02-01"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"record-disambiguation"
        ~refs:[
          Reference.mantis 5759;
        ] () ;

      mk_task ~name:"Syntax extensions"
        ~start:"2012-12-01" ~finish:"2013-06-01"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"syntax-extensions"
        ~refs:[ Reference.webpage ~name:"Working group" "http://lists.ocaml.org/listinfo/wg-camlp4";
                Reference.webpage ~name:"Blog (part 1)" "http://www.lpw25.net/2013/01/23/camlp4-alternative-part-1.html";
                Reference.webpage ~name:"Blog (part 2)" "http://www.lpw25.net/2013/02/05/camlp4-alternative-part-2.html"
        ] () ;

      mk_task ~name:"Namespaces and module aliases"
        ~start:"2013-02-01" ~finish:"2014-09-15"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"namespaces"
        ~refs:[
          Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/03/10/ocaml-namespaces.html" ;
          Reference.webpage ~name:"Epic Mail Thread" "http://lists.ocaml.org/pipermail/platform/2013-February/000050.html";
          Reference.paper Data_papers.module_aliases_2014;
          Reference.video "https://www.youtube.com/watch?v=9wYssJyvijA"
       ] () ;

      mk_task ~name:"Multicore"
        ~start:"2013-03-01"
        ~finish:"2015-04-01"
        ~owner:People.kchandras
        ~descr:"multicore"
        ~status:`Doing
        ~refs: [
           Reference.github "stedolan" "ocaml" ;
           Reference.paper Data_papers.multicore_ocaml_2014;
           Reference.video "https://www.youtube.com/watch?v=FzmQTC_X5R4";
        ] ();

      mk_task ~name:"Emission of DWARF debugging information"
        ~start:"2013-01-01"
        ~finish:"2015-04-01"
        ~owner:People.shinwell
        ~status:`Doing
        ~descr:"dwarf"
        ~refs: [
           Reference.github ~name:"4.00.1-allocation-profiling" "mshinwell" "ocaml";
           Reference.video "https://www.youtube.com/watch?v=NF2WpWnB-nk";
        ] ();

      mk_task ~name:"OCaml Java"
        ~start:"2013-04-01" ~finish:"2013-08-01"
        ~owner:People.xclerc
        ~status:`Complete
        ~descr:"ocamljava2"
        ~refs: [ Reference.webpage "http://ocamljava.x9c.fr/preview/" ] ();

      mk_task ~name:"Modular Implicits prototype"
        ~start:"2014-01-01" ~finish:"2015-02-01"
        ~owner:People.lpw25
        ~status:`Complete
        ~descr:"modular-implicits"
        ~refs: [
          Reference.github "ocamllabs" "ocaml-modular-implicits";
          Reference.webpage ~name:"Demo" "http://andrewray.github.io/iocamljs/modimp_show.html";
          Reference.paper Data_papers.modular_implicits_2014;
          Reference.video "https://www.youtube.com/watch?v=3wVUXTd4WNc"
        ] ();
 
      mk_task ~name:"Higher kinded polymorphism"
        ~start:"2013-06-01" ~finish:"2014-08-01"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"higher"
        ~refs: [
          Reference.paper Data_papers.flops_2014;
          Reference.github "ocamllabs" "higher";
        ] ();

      mk_task ~name:"Exception matches"
        ~start:"2013-11-01" ~finish:"2014-06-01"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"exception-match"
        ~refs: [
          Reference.blog "http://ocamllabs.github.io/compiler-hacking/2014/02/04/handler-case.html";
          Reference.mantis 6318;
        ] ()
    ]   
  end

  module Outreach = struct

    let rec project = {
      project_id="outreach";
      project_name="Community Outreach" ;
      project_owner = People.amir;
      project_elevator="Building an effective online presence for the worldwide OCaml community";
      team = People.([ avsm; amir ]);
      tasks;
    }
    and tasks = [
      mk_task ~name:"Real World OCaml"
        ~start:"2011-05-01" ~finish:"2013-11-01"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"rwo-book"
        ~refs:[ Reference.webpage ~name:"Homepage" "http://realworldocaml.org";
                Reference.webpage ~name: "Twitter" "http://twitter.com/RealWorldOCaml"] ();
      mk_task ~name:"Book review site"
        ~start:"2011-06-01" ~finish:"2013-03-01"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"rwo-review-site"
        ~related:[("Real World OCaml", "outreach", "Real World OCaml")]
        ~refs:[ Reference.webpage ~name:"Homepage" "http://realworldocaml.org" ] ();
      mk_task ~name:"MPP"
        ~start:"2013-04-01" ~finish:"2013-08-01"
        ~owner:People.pwang
        ~status:`Complete
        ~descr:"mpp"
        ~related:[("Real World OCaml", "outreach", "Book review site")]
        ~refs:[ Reference.github ~name:"mpp code" "pw374" "MPP-language-blender" ] ();
      mk_task ~name:"Markdown processor"
        ~start:"2013-06-01" ~finish:"2014-12-01"
        ~owner:People.pwang
        ~status:`Complete
        ~descr:"omd"
        ~refs:[ Reference.github ~name:"OMD" "ocaml" "omd" ] ();
      mk_task ~name:"OCaml.org infrastructure"
        ~start:"2011-08-01" ~finish:"2013-02-01"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"ocaml-org-infra"
        ~related:[("OCamlot", "platform", "OCamlot")]
        ~refs:[ Reference.webpage ~name:"Wiki" "" ] () ;
      mk_task ~name:"OCaml.org redesign"
        ~start:"2013-01-01" ~finish:"2013-11-01"
        ~owner:People.amir
        ~status:`Complete
        ~descr:"ocaml-org-design"
        ~refs:[ Reference.webpage ~name:"OCaml.org" "http://ocaml.org";
                Reference.webpage ~name:"Wiki" "https://github.com/ocaml/ocaml.org/wiki";
                Reference.webpage ~name:"Blog" "http://amirchaudhry.com/wireframe-demos-for-ocamlorg"
         ] () ;
      mk_task ~name:"FPDays tutorial"
        ~start:"2013-06-01" ~finish:"2013-12-01"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"fpdays2013"
        ~refs:[ Reference.blog ~name:"Prep" "http://amirchaudhry.com/fpdays-ocaml-session";
                Reference.blog ~name:"Post-mortem" "http://amirchaudhry.com/fpdays-review/";
                Reference.github "ocamllabs" "fpdays-skeleton"
         ] () ;
      mk_task ~name:"2048 in js_of_ocaml"
        ~start:"2014-06-01" ~finish:"2015-01-21"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"2048-tutorial"
        ~refs: [ Reference.github "ocamllabs" "2048-tutorial";
                 Reference.webpage ~name:"ICFP tutorial" "http://cufp.org/2014/t7-leo-white-introduction-to-ocaml.html";
                 Reference.webpage ~name:"Functional Conf Bangalore" "http://functionalconf.com/2014/schedule.html";
                 Reference.webpage ~name:"Online Demo" "http://gazagnaire.org/fuconf14/";
        ] ();
      mk_task ~name:"L28: Advanced FP"
        ~start:"2014-06-01" ~finish:"2015-05-01"
        ~owner:People.yallop
        ~status:`Complete
        ~descr:"l28"
        ~refs: [ Reference.webpage ~name:"Course Page" "http://www.cl.cam.ac.uk/teaching/1415/L28/";
                 Reference.webpage ~name:"F-omega interpreter" "http://ocamllabs.github.io/fomega/";
        ] ();
      mk_task ~name:"Compiler Hacking Evenings"
       ~start:"2013-08-01"
       ~owner:People.yallop
       ~status:`Complete
       ~descr:"compiler-hacking"
       ~refs: [ Reference.blog "http://ocamllabs.github.io/compiler-hacking/";
                Reference.webpage ~name:"Mailing List" "http://lists.ocaml.org/listinfo/cam-compiler-hacking" ] ();
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
        ~status:`Complete
        ~descr:"xen-org"
        ~refs:[ Reference.webpage ~name:"Proposal" "http://wiki.xen.org/wiki/Mirage_Incubation_Project_Proposal";
                Reference.webpage ~name:"Xen.org Mirage Page" "http://www.xenproject.org/developers/teams/mirage-os.html" ] ();
      mk_task ~name:"Mirari"
        ~start:"2013-02-02" ~finish:"2013-06-01"
        ~owner:People.vb
        ~status:`Complete
        ~descr:"mirari"
        ~refs:[
           Reference.github "mirage" "mirari";
           Reference.blog ~name:"Blog" "http://openmirage.org/blog/introducing-vchan" ] () ;
      mk_task ~name:"Mirage 0.9"
        ~start:"2013-01-26" ~finish:"2013-07-26"
        ~owner:People.djs
        ~status:`Complete
        ~descr:"dev-preview"
        ~refs: [
           Reference.github "mirage" "mirage-platform";
           Reference.webpage ~name:"Meeting Minutes" "http://openmirage.org/wiki/weekly-2013-04-16";
        ] () ;
      mk_task ~name:"Mirage 1.0"
        ~start:"2013-06-01" ~finish:"2013-11-09"
        ~owner:People.avsm
        ~status:`Complete
        ~descr:"mirage-1.0"
        ~refs: [
           Reference.github "mirage" "mirage";
           Reference.blog ~name:"Announcement" "http://openmirage.org/blog/announcing-mirage10";
           Reference.webpage ~name:"Homepage" "http://openmirage.org";
        ] () ;
      mk_task ~name:"Mirage 2.0"
       ~start:"2013-11-01" ~finish:"2014-08-01"
       ~owner:People.avsm
       ~status:`Complete
       ~descr:"mirage-2.0"
       ~refs: [
          Reference.github "mirage" "mirage";
          Reference.blog ~name:"Announcement" "http://openmirage.org/blog/announcing-mirage-20-release";
          Reference.paper Data_papers.mirageos_ocaml_2014;
       ] ();
      mk_task ~name:"TCP/IP Stack"
        ~start:"2013-04-01" ~finish:"2014-03-01"
        ~owner:People.balrajsingh
        ~status:`Complete
        ~descr:"tcpip" ();

      mk_task ~name:"kFreeBSD"
        ~start:"2013-06-01" ~finish:"2013-12-01"
        ~owner:People.gabor
        ~status:`Complete
        ~descr:"kfreebsd"
        ~refs:[
          Reference.github "pgj" "mirage-kfreebsd";
          Reference.mantis 6167;
        ] ();

      mk_task ~name:"Nigori"
        ~start:"2012-10-01" ~finish:"2013-06-01"
        ~owner:People.bogdan
        ~status:`Complete ~descr:"nigori"
        ~refs: [ Reference.pdf ~name:"Original Nigori paper" "http://www.links.org/files/nigori-overview.pdf"; ] ();
      mk_task ~name:"OCaml TLS"
       ~start:"2014-01-01" ~finish:"2015-03-01"
       ~owner:People.hannes
       ~status:`Complete ~descr:"ocaml-tls"
       ~refs: [
          Reference.paper Data_papers.tls_ocaml_2014;
          Reference.github "mirleft" "ocaml-tls";
          Reference.webpage ~name:"BitCoin Pinata" "http://ownme.ipredator.se/";
          Reference.video "https://media.ccc.de/browse/congress/2014/31c3_-_6443_-_en_-_saal_2_-_201412271245_-_trustworthy_secure_modular_operating_system_engineering_-_hannes_-_david_kaloper.html#video"
       ] ();
      mk_task ~name:"Jitsu toolstack"
       ~start:"2014-05-01" ~finish:"2015-05-01"
       ~owner:People.magnus
       ~status:`Complete ~descr:"jitsu"
       ~refs: [
          Reference.paper Data_papers.jitsu_2015;
          Reference.github "magnuss" "jitsu";
       ] ();
       mk_task ~name:"Irmin 1.0"
        ~start:"2013-03-01"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"irmin"
        ~refs:[
           Reference.paper ~name:"JFLA 2015 paper" Data_papers.irmin_jfla_2015;
           Reference.paper ~name:"OCaml 2014 poster" Data_papers.irmin_ocaml_2014;
           Reference.github "mirage" "ocaml-git";
           Reference.github "mirage" "irmin";
           Reference.blog ~name:"Blog (part 1)" "http://openmirage.org/blog/introducing-irmin";
           Reference.blog ~name:"Blog (part 2)" "http://openmirage.org/blog/introducing-irmin";
        ] () ;
       mk_task ~name:"Xen/ARMv7 port"
         ~start:"2014-02-01" ~finish:"2014-09-01"
         ~owner:People.tleonard
         ~status:`Complete
         ~descr:"xen-arm"
         ~refs: [
           Reference.github "mirage" "mirage-xen-minios";
           Reference.blog "http://openmirage.org/blog/introducing-xen-minios-arm";
           Reference.paper Data_papers.jitsu_2015;
         ] ();
       mk_task ~name:"Home Router"
         ~start:"2015-01-01"
         ~owner:People.mpreston
         ~status:`Doing
         ~descr:"home-router"
         ~refs: [ Reference.github "yomimono" "mirage-nat" ] ();

       mk_task ~name:"Signpost prototype"
        ~start:"2012-08-01" ~finish:"2013-06-01"
        ~owner:People.heidi
        ~status:`Complete
        ~descr:"signpostv1"
        ~refs:[ Reference.paper ~name:"USENIX FOCI 2013" usenix_foci_2013; ] ();

      mk_task ~name:"Graphing"
       ~start:"2013-04-14" ~finish:"2013-08-14"
       ~owner:People.dbunzli
       ~status:`Complete
       ~descr:"vg"
       ~related:[("Real-time templating", "illuminate", "Real-time templating")]
       ~refs: [
         Reference.webpage ~name:"Gg library" "http://erratique.ch/software/gg";
         Reference.webpage ~name:"Vg library" "http://erratique.ch/software/vg";
       ] ();

       mk_task ~name:"Moana ML"
        ~start:"2014-08-01" ~finish:"2015-04-01"
        ~owner:People.yans
        ~status:`Doing
        ~descr:"moanaml"
        ~refs:[ Reference.github "yansh" "MoanaML";
                Reference.blog ~name:"Mozilla Ignite Blog" "https://mozillaignite.org/apps/411/";
                Reference.blog ~name:"Summary Blog" "http://yansnotes.blogspot.co.uk/2015/01/work-summary-ocaml-labs.html";
                Reference.paper Data_papers.mw4ng_2014;  ] ();

       mk_task ~name:"Polyversal TCP prototype"
        ~start:"2012-10-01"
        ~finish:"2015-02-01"
        ~owner:People.vsevolod
        ~status:`Doing
        ~descr:"pvtcp"
        ~refs: [
           Reference.github "ocamllabs" "pvtcp";
           Reference.paper ~name:"Position paper" conext_pvtcp;
         ] ();

       mk_task ~name:"LVM-compatible block device"
        ~start:"2014-10-01"
        ~owner:People.djs
        ~status:`Doing
        ~descr:"lvm"
        ~refs: [
           Reference.github "mirage" "mirage-block-volume";
        ] ();
    ]
  end

  let all = [ Platform.project;
              Compiler.project;
              Mirage.project;
              Outreach.project 
            ]
end

