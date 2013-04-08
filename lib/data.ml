open Core.Std
open Types

module People = struct
  open Person
  (* 
    Computer Lab people
  *)
  let avsm = {
    id="avsm";
    name="Anil Madhavapeddy";
    affiliation=`CL;
    role="PI";
    bio=None;
    homepage=Some "http://anil.recoil.org";
    mugshot=(Some "avsm.jpg");
  }
  let mycroft = {
    id="mycroft";
    name="Alan Mycroft";
    affiliation=`CL;
    role="PI";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~am21";
    mugshot=(Some "mycroft.jpg");
  }
  let iml = {
    id="iml";
    name="Ian Leslie";
    affiliation=`CL;
    role="PI";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~iml1]";
    mugshot=(Some "iml.jpg");
  }
  let crowcroft = {
    id="crowcroft";
    name="Jon Crowcroft";
    affiliation=`CL;
    role="PI";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~jac22";
    mugshot=(Some "crowcroft.gif");
  }
  let amir = {
    id="amirmc";
    name="Amir Chaudhry";
    affiliation=`CL;
    role="Program Manager";
    bio=None;
    homepage=Some "http://amirchaudhry.com";
    mugshot=(Some "amir.jpg");
  }
  let lpw25 = {
    id="lpw25";
    name="Leo White";
    affiliation=`CL;
    role="Research Associate";
    bio=None;
    homepage=Some "http://lpw25.net";
    mugshot=Some "lpw25.jpg";
  }
  let yallop = {
    id="yallop";
    name="Jeremy Yallop";
    affiliation=`CL;
    role="Senior Research Associate";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  let stedolan = {
    id="stedolan";
    name="Stephen Dolan";
    affiliation=`CL;
    role="PhD candidate";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  let balrajsingh = {
    id="balrajsingh";
    name="Balraj Singh";
    affiliation=`CL;
    role="PhD candidate";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  let heidi = {
    id="heidi";
    name="Heidi Howard";
    affiliation=`CL;
    role="Research Assistant";
    bio=None;
    homepage=Some "http://etc-hosts.blogspot.co.uk";
    mugshot=Some "heidi.jpg";
  }
  let raphael = {
    id="raphael";
    name="Raphael Proust";
    affiliation=`CL;
    role="PhD Student";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  let smh = {
    id="smh";
    name="Steven Hand";
    affiliation=`CL;
    role="Reader";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~smh22";
    mugshot=Some "smh.jpg";
  }
  let haris = {
    id="haris";
    name="Haris Rotsos";
    affiliation=`CL;
    role="PhD Student";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~cr409/";
    mugshot=Some "haris.jpg";
  }
  let vsevolod = {
    id="vsevolod";
    name="Vsevolod Stakhov";
    affiliation=`CL;
    role="PhD Student";
    bio=None;
    homepage=Some "https://github.com/vstakhov";
    mugshot=Some "vsevelod.jpg";
  }
  let griffin = {
    id="griffin";
    name="Tim Griffin";
    affiliation=`CL;
    role="Reader";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~tgg22";
    mugshot=Some "griffin.jpg";
  }
  let stephend = {
    id="stephand";
    name="Stephen Dolan";
    affiliation=`CL;
    role="PhD Student";
    bio=None;
    homepage=Some "https://github.com/stedolan";
    mugshot=None;
  }
  let rwatson = {
    id="rwatson";
    name="Robert Watson";
    affiliation=`CL;
    role="Senior Research Associate";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~rnw24/";
    mugshot=Some "rwatson.jpg";
  }
  let alib = {
    id="alib";
    name="Alistair Beresford";
    affiliation=`CL;
    role="Lecturer";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~arb33";
    mugshot=Some "alib.jpg";
  }
  let bogdan = {
    id="bogdan";
    name="Bogdan-Alexandru Matican";
    affiliation=`CL;
    role="ACS Student";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  let sheets = {
    id="sheets";
    name="David Sheets";
    affiliation=`CL;
    role="Research Assistant";
    bio=None;
    homepage=None;
    mugshot=(Some "sheets.png");
  }
  (* 
    Citrix people
  *)
  let djs = {
    id="djs";
    name="Dave Scott";
    affiliation=`Citrix;
    role="Xen Architect";
    bio=None;
    homepage=Some "http://dave.recoil.org";
    mugshot=Some "djs.jpg";
  }
  let vb = {
    id="vb";
    name="Vincent Bernardoff";
    affiliation=`Citrix;
    role="Research Intern";
    bio=None;
    homepage=Some "https://github.com/vbmithr";
    mugshot=None;
  }
  let jludlam = {
    id="jludlam";
    name="Jonathan Ludlum";
    affiliation=`Citrix;
    role="Software Engineer";
    bio=None;
    homepage=Some "http://jon.recoil.org";
    mugshot=Some "jludlam.jpg";
  }
  let lars = {
    id="lars";
    name="Lars Kurth";
    affiliation=`Citrix;
    role="Community Manager";
    bio=None;
    homepage=Some "http://wiki.xen.org/wiki/User:Lars.kurth";
    mugshot=Some "lars.jpg";
  }
  (* 
    Jane Street people
  *)
  let yaron = {
    id="yaron";
    name="Yaron Minsky";
    affiliation=`JSC;
    role="Head of Quantitative Research and Technology";
    bio=None;
    homepage=Some "http://wiki.xen.org/wiki/User:Lars.kurth";
    mugshot=Some "lars.jpg";
  }
  let shinwell = {
    id="shinwell";
    name="Mark Shinwell";
    affiliation=`JSC;
    role="Quantitative Researcher";
    bio=None;
    homepage=Some "http://www.three-tuns.net/mark";
    mugshot=None;
  }
  (* 
    OCamlPro people
  *)
  let tg = {
    id="tg";
    name="Thomas Gazagnaire";
    affiliation=`OCP;
    role="CTO";
    bio=None;
    homepage=Some "http://thomas.gazagnaire.org";
    mugshot=(Some "tg.png");
  }
  let fabrice = {
    id="fabrice";
    name="Fabrice Le Fessant";
    affiliation=`OCP;
    role="CEO";
    bio=None;
    homepage=Some "http://www.lefessant.net";
    mugshot=(Some "fabrice.png");
  }
  let pierre = {
    id="pierre";
    name="Pierre Chambart";
    affiliation=`OCP;
    role="";
    bio=None;
    homepage=Some "http://www.lsv.ens-cachan.fr/~chambart";
    mugshot=(Some "pierre.png");
  }
  (* 
    Horizon people
  *)
  let mac = {
    id="mac";
    name="Derek McAuley";
    affiliation=`Horizon;
    role="Professor of Digital Economy";
    bio=None;
    homepage=Some "http://www.cs.nott.ac.uk/~drm";
    mugshot=Some "mac.jpg";
  }
  let mort = {
    id="mort";
    name="Richard Mortier";
    affiliation=`Horizon;
    role="Lecturer";
    bio=None;
    homepage=Some "http://www.cs.nott.ac.uk/~rmm";
    mugshot=Some "mort.png";
  }
  let bishneet = {
    id="bishneet";
    name="Bishneet Kaur";
    affiliation=`Horizon;
    role="Intern";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  (* 
    Other people
  *)
  let ashish = {
    id="ashish";
    name="Ashish Agarwal";
    affiliation=`NYU;
    role="Research Scientist";
    bio=None;
    homepage=Some "http://ashishagarwal.org";
    mugshot=Some "ashish.png";
  }
  let christophe = {
    id="christophe";
    name="Christophe Troestler";
    affiliation=`UMONS;
    role="";
    bio=None;
    homepage=Some "http://math.umons.ac.be/an/fr";
    mugshot=Some "christophe.png";
  }
  let gabor = {
    id="gabor";
    name="Gabor Pali";
    affiliation=`CL;
    role="";
    bio=None;
    homepage=Some "http://people.freebsd.org/~pgj";
    mugshot=Some "gabor.jpg";
  }
  let prashanth = {
    id="prashanth";
    name="Prashanth Mundkur";
    affiliation=`SRI;
    role="Senior Research Scientist";
    bio=None;
    homepage=Some "https://github.com/pmundkur";
    mugshot=Some "prashanth.jpg";
  }
  let jhickey = {
    id="jhickey";
    name="Jason Hickey";
    affiliation=`Google;
    role="Software Engineer";
    bio=None;
    homepage=Some "http://main.metaprl.org/jyh";
    mugshot=Some "jhickey.jpg";
  }

  let all = [
    avsm; mycroft; iml; crowcroft; amir; lpw25; yallop;
    stedolan; balrajsingh; heidi; raphael; smh; haris;
    vsevolod; griffin; stephend; rwatson; alib; bogdan;
    djs; vb; jludlam; lars; yaron; shinwell; tg; fabrice;
    pierre; mac; mort; bishneet; ashish; christophe; gabor;
    prashanth; jhickey ]

  (* Split out the CUCL from the org list *)
  let of_cucl, of_other =
    let l = by_affiliation all in
    let cucl = List.Assoc.find_exn l `CL |> List.rev in
    let other =
      List.Assoc.remove l `CL
      |> List.sort ~cmp:(fun a b -> cmp (fst a) (fst b))
      |> List.map ~f:(fun (a,b) -> (a, List.rev b))
    in
    cucl, other
end

open Project
module Projects = struct

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
        team=People.([ avsm ]);
        tasks;
      }
    and tasks = [ 
      mk_task ~name:"OPAM 1.0 ('if it builds, ship it')"
        ~start:"2012-03-15" ~finish:"2013-03-14"
        ~owner:People.tg
        ~status:`Complete
        ~descr:"opam10"
        ~refs:opam_refs () ;
      mk_task ~name:"OPAM 1.1 ('the testing release')"
        ~start:"2013-02-17" ~finish:"2013-05-01"
        ~owner:People.tg
        ~status:`Doing
        ~descr:"opam11"
        ~refs: opam_refs () ;
      mk_task ~name:"OPAM 1.2 ('the Platform release')"
        ~start:"2013-05-01" ~finish:"2013-08-01"
        ~owner:People.tg
        ~status:`Planning
        ~descr:"opam12"
        ~refs:opam_refs ();
      mk_task ~name:"OPAM Doc"
        ~start:"2013-01-16"
        ~owner:People.lpw25
        ~status:`Doing
        ~refs:[ Reference.github "lpw25" "opam-doc" ] () ;
      mk_task ~name:"OCamelot"
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

