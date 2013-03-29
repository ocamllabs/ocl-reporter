open Core.Std
open Types

module People = struct
  open Person
  let avsm = {
    id="avsm";
    name="Anil Madhavapeddy";
    affiliation=`CL;
    role="PI";
    bio=None;
    homepage=Some "http://avsm.recoil.org";
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
    homepage=None;
    mugshot=(Some "amir.jpg");
  }
  let djs = {
    id="djs";
    name="Dave Scott";
    affiliation=`Citrix;
    role="Xen Architect";
    bio=None;
    homepage=Some "http://dave.recoil.org";
    mugshot=None;
  }
  let tg = {
    id="tg";
    name="Thomas Gazagnaire";
    affiliation=`OCP;
    role="CTO";
    bio=None;
    homepage=Some "http://thomas.gazagnaire.org";
    mugshot=(Some "tg.png");
  }
  let lpw25 = {
    id="lpw25";
    name="Leo White";
    affiliation=`CL;
    role="Research Associate";
    bio=None;
    homepage=Some "http://lpw25.net";
    mugshot=Some "default.gif";
  }
  let vb = {
    id="vb";
    name="Vincent Bernardoff";
    affiliation=`Citrix;
    role="Research Intern";
    bio=None;
    homepage=Some "https://Reference.github.com/vbmithr";
    mugshot=None;
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

end

module Projects = struct
  open Project

  module Platform = struct

    let rec project =
      { project_id="platform"; 
        project_name="OCaml Platform"; 
        project_owner=People.amir;
        team=People.([ avsm ]);
        tasks;
      }
    and tasks =
      [ { task_name="OPAM 1.0 ('if it builds, ship it')";
          start=Date.of_string "2012-03-15";
          finish=Some (Date.of_string "2013-03-14");
          owner=People.tg;
          status=`Complete;
          refs= [ Reference.github "OCamlPro" "opam" ]
        };
        { task_name="OPAM 1.1 ('the testing release')";
          start=Date.of_string "2013-02-17";
          finish= Some (Date.of_string "2013-05-01");
          owner=People.tg;
          status=`Doing;
          refs= [ Reference.github "OCamlPro" "opam" ]
        };
        { task_name="OPAM 1.2 ('the Platform release')";
          start=Date.of_string "2013-05-01";
          finish= Some (Date.of_string "2013-08-01");
          owner=People.tg;
          status=`Planning;
          refs= [ Reference.github "OCamlPro" "opam" ]
        };
        { task_name="OPAM Doc";
          start=Date.of_string "2013-01-16";
          finish=None;
          owner=People.lpw25;
          status=`Doing;
          refs= [ Reference.github "lpw25" "opam-doc" ]
        };
        { task_name="Ocamelot";
          start=Date.of_string "2013-01-16";
          finish=None;
          owner=People.yallop;
          status=`Planning;
          refs= [ Reference.github "ocamllabs" "ocamelot" ]
        };
        { task_name="Platform Preview";
          start=Date.of_string "2013-03-01";
          finish=Some (Date.of_string "2013-06-01");
          owner=People.amir;
          status=`Planning;
          refs = []
        }
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
    and tasks =
      [
        { task_name="Open types";
          start=Date.of_string "2012-10-01";
          finish=Some (Date.of_string "2013-01-09");
          owner=People.lpw25;
          status=`Complete;
          refs= [ Reference.github "lpw25" "ocaml-open" ] 
        };
        { task_name="Record disambiguation";
          start=Date.of_string "2012-09-03";
          finish=Some (Date.of_string "2012-12-02");
          owner=People.lpw25;
          status=`Complete;
          refs= [ Reference.webpage ~name:"Mantis" "http://caml.inria.fr/mantis/view.php?id=5759" ]
        };
        { task_name="Camlp4 redesign";
          start=Date.of_string "2012-12-01";
          finish=Some (Date.of_string "2013-03-01");
          owner=People.lpw25;
          status=`Doing;
          refs= [ Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/02/05/camlp4-alternative-part-2.html"]
        };
 
        { task_name="Namespaces";
          start=Date.of_string "2013-02-01";
          finish=None;
          owner=People.lpw25;
          status=`Planning;
          refs= [ Reference.webpage ~name:"Blog" "http://www.lpw25.net/2013/03/10/ocaml-namespaces.html" ]
        };
        { task_name="Multicore";
          start=Date.of_string "2013-03-01";
          finish=None;
          owner=People.stedolan;
          status=`Planning;
          refs= [ ]
        };
 
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
    and tasks =
      [
        { task_name="Book review site";
          start=Date.of_string "2011-06-01";
          finish=Some (Date.of_string "2013-01-01");
          owner=People.avsm;
          status=`Complete;
          refs= [ Reference.webpage ~name:"Homepage" "http://realworldocaml.org" ]
        };
        { task_name="OCaml.org infrastructure";
          start=Date.of_string "2011-08-01";
          finish=Some (Date.of_string "2013-02-01");
          owner=People.avsm;
          status=`Complete;
          refs= [ Reference.webpage ~name:"Wiki" "" ]
        };
 
        { task_name="Real World OCaml";
          start=Date.of_string "2011-05-01";
          finish=Some (Date.of_string "2013-08-01");
          owner=People.avsm;
          status=`Doing;
          refs= [ Reference.webpage ~name:"Homepage" "http://realworldocaml.org" ]
        };
        { task_name="OCaml.org redesign";
          start=Date.of_string "2013-01-01";
          finish=Some (Date.of_string "2013-05-01");
          owner=People.amir;
          status=`Doing;
          refs= [ ]
        }
      ]
  end

  module Mirage = struct
    let project_owner = People.avsm
    let team = People.([ amir; djs ])

    let rec project = { 
      project_id="mirage";
      project_name="Mirage OS"; 
      team; project_owner; tasks 
    } and tasks =
      [
        { task_name="Xen.org incubation"; 
          start=Date.of_string "2012-12-01";
          finish=Some (Date.of_string "2013-04-01");
          owner=People.amir;
          status=`Doing;
          refs = [ Reference.webpage ~name:"Proposal" "http://wiki.xen.org/wiki/Mirage_Incubation_Project_Proposal" ]
        }; 
 
        { task_name="Mirari"; 
          start=Date.of_string "2013-02-02";
          finish=Some (Date.of_string "2013-05-01");
          owner=People.vb;
          status=`Doing;
          refs = [ Reference.github "mirage" "mirari" ]
        }; 
        { task_name="Mirage Developer Preview";
          start=Date.of_string "2013-02-26";
          finish=Some (Date.of_string "2013-07-26");
          owner=People.djs;
          status=`Planning;
          refs= [ Reference.github "mirage" "mirage-platform" ];
        };
        { task_name="Formalisms for packet processing";
          start=Date.of_string "2013-04-01";
          finish=Some (Date.of_string "2013-10-01");
          owner=People.balrajsingh;
          status=`Planning;
          refs= [ ];
        }
 
      ] 
  end

  let all = [ Platform.project; Mirage.project;
              Compiler.project; Outreach.project ]
end

