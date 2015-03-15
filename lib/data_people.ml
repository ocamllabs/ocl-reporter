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
    role="Principal Investigator";
    bio=None;
    homepage=Some "http://anil.recoil.org";
    mugshot=(Some "avsm.jpg");
  }
  let mycroft = {
    id="mycroft";
    name="Alan Mycroft";
    affiliation=`CL;
    role="Principal Investigator";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~am21";
    mugshot=(Some "mycroft.jpg");
  }
  let iml = {
    id="iml";
    name="Ian Leslie";
    affiliation=`CL;
    role="Principal Investigator";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~iml1";
    mugshot=(Some "iml.jpg");
  }
  let crowcroft = {
    id="crowcroft";
    name="Jon Crowcroft";
    affiliation=`CL;
    role="Principal Investigator";
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
    role="Senior RA";
    bio=None;
    homepage=None;
    mugshot=Some "yallop.jpeg";
  }
  let tg = {
    id="tg";
    name="Thomas Gazagnaire";
    affiliation=`CL;
    role="Senior RA";
    bio=None;
    homepage=Some "http://thomas.gazagnaire.org";
    mugshot=(Some "tg.png");
  }
  let pwang = {
    id="pwang";
    name="Philippe Wang";
    affiliation=`Past;
    role="Research Associate";
    bio=None;
    homepage=Some "http://philippewang.info/CL/";
    mugshot=Some "pwang.jpg";
  }
  let stedolan = {
    id="stedolan";
    name="Stephen Dolan";
    affiliation=`CL;
    role="PhD candidate";
    bio=None;
    homepage=Some "https://github.com/stedolan";
    mugshot=Some "stedolan.jpg";
  }
  let balrajsingh = {
    id="balrajsingh";
    name="Balraj Singh";
    affiliation=`CL;
    role="Visitor";
    bio=None;
    homepage=Some "https://github.com/balrajsingh";
    mugshot=Some "balraj.jpg";
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
    homepage=Some "http://www.cl.cam.ac.uk/~rp452/";
    mugshot=Some "raphael.jpg";
  }

  let haris = {
    id="haris";
    name="Haris Rotsos";
    affiliation=`CLx;
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
    name="Timothy G. Griffin";
    affiliation=`CLx;
    role="Reader";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~tgg22/";
    mugshot=Some "griffin.jpg";
  }
  let rwatson = {
    id="rwatson";
    name="Robert Watson";
    affiliation=`CLx;
    role="Lecturer";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~rnw24/";
    mugshot=Some "rwatson.jpg";
  }
  let alib = {
    id="alib";
    name="Alastair Beresford";
    affiliation=`CLx;
    role="Lecturer";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~arb33";
    mugshot=Some "alib.jpg";
  }
  let bogdan = {
    id="bogdan";
    name="Bogdan-Alexandru Matican";
    affiliation=`Past;
    role="ACS Student (2013)";
    bio=None;
    homepage=None;
    mugshot=Some "bogdan.jpg";
  }
  let sheets = {
    id="sheets";
    name="David Sheets";
    affiliation=`CL;
    role="Research Assistant";
    bio=None;
    homepage=Some "https://github.com/dsheets";
    mugshot=(Some "sheets.png");
  }
  let gparisis = {
    id="gparisis";
    name="George Parisis";
    affiliation=`Past;
    role="Research Associate";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~gp349/";
    mugshot=Some "gparisis.jpg";
  }  
  let hannes = {
    id="hannes";
    name="Hannes Mehnert";
    affiliation=`CLx;
    role="Intern";
    bio=None;
    homepage=Some "https://github.com/hannesm";
    mugshot=Some "hannes.jpg";
  }
  let greg = {
    id="greg";
    name="Gregory Tsipenyuk";
    affiliation=`CL;
    role="PhD Student";
    bio=None;
    homepage=None;
    mugshot=Some "greg.jpg";
  }
  let benjamin = {
    id="benjamin";
    name="Benjamin Farinier";
    affiliation=`CLx;
    role="Summer visitor";
    bio=None;
    homepage=None;
    mugshot=Some "benjamin.jpg";
  }
  let matthieu = {
    id="matthieu";
    name="Matthieu Journault";
    affiliation=`CLx;
    role="Summer visitor";
    bio=None;
    homepage=None;
    mugshot=Some "matthieu.jpg";
  }
  let frederic = {
    id="frederic";
    name="Frederic Bour";
    affiliation=`CLx;
    role="Summer visitor";
    bio=None;
    homepage=None;
    mugshot=Some "frederic.jpg";
  }
  let magnus = {
    id="magnus";
    name="Magnus Skjegstad";
    affiliation=`CL;
    role="Research Associate";
    bio=None;
    homepage=Some "http://www.skjegstad.com";
    mugshot=Some "magnus.jpg";
  }
  let nicolas = {
    id="nicolas";
    name="Nicolas Ojeda Bar";
    affiliation=`CLx;
    role="Research Associate";
    bio=None;
    homepage=Some "https://github.com/nojb";
    mugshot=Some "nicolas.jpg";
  }
  let sebastian = {
    id="sebastian";
    name="Sebastian Funk";
    affiliation=`Past;
    role="Student";
    bio=None;
    homepage=None;
    mugshot=Some "sebastian.jpg";
  }
  let stekell = {
    id="stekell";
    name="Stephen Kell";
    affiliation=`CLx;
    role="Student";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~srk31";
    mugshot=Some "stekell.jpg";
  }
  let tleonard = {
    id="tleonard";
    name="Thomas Leonard";
    affiliation=`CL;
    role="Senior RA";
    bio=None;
    homepage=Some "http://roscidus.com/blog";
    mugshot=Some "tleonard.jpg";
  }
  let mpreston = {
    id="mpreston";
    name="Mindy Preston";
    affiliation=`CLx;
    role="Visitor";
    bio=None;
    homepage=Some "http://somerandomidiot.com";
    mugshot=None;
  }
  let aray = {
    id="aray";
    name="Andy Ray";
    affiliation=`Past;
    role="Visitor";
    bio=None;
    homepage=Some "http://www.ujamjar.com";
    mugshot=None;
  }
  let yans = {
    id="yans";
    name="Yan Shvartzshnaider";
    affiliation=`Past;
    role="Research Associate";
    bio=None;
    homepage=Some "http://yansnotes.blogspot.co.uk";
    mugshot=None;
  }
  let cmolina = {
    id="cmolina";
    name="Carlos Molina-Jimenez";
    affiliation=`CLx;
    role="Research Associate";
    bio=None;
    homepage=None;
    mugshot=None;
  }
  let mnasr = {
    id="mnasr";
    name="Mounir Nasr Allah";
    affiliation=`CLx;
    role="Summer visitor";
    bio=None;
    homepage=Some "http://mounirnasrallah.com";
    mugshot=None;
  }
  let kchandras = {
    id="kchandras";
    name="KC Sivaramakrishnan";
    affiliation=`CL;
    role="Research Associate";
    bio=None;
    homepage=Some "http://kcsrk.info";
    mugshot=Some "kc.jpg";
  }
  let mort = {
    id="mort";
    name="Richard Mortier";
    affiliation=`CL;
    role="Lecturer";
    bio=None;
    homepage=Some "http://mort.io";
    mugshot=Some "mort.png";
  }
(*  let gpotron = {
    id="gpotron";
    name="Guillain Potron";
    affiliation=`CLx;
    role="Summer visitor";
    bio=None;
    homepage=None;
    mugshot=None;
  }*)
(*  let qli = {
    id="qli";
    name="Qi Li";
    affiliation=`CLx;
    role="Summer visitor";
    bio=None;
    homepage=None;
    mugshot=None;
    }*)

  (* 
    Citrix people
  *)
  let euan = {
    id="euan";
    name="Euan Harris";
    affiliation=`Citrix;
    role="Visitor";
    bio=None;
    homepage=None;
    mugshot=Some "euan.jpg";
  } 
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
    affiliation=`Past;
    role="Research Intern (2013)";
    bio=None;
    homepage=Some "https://github.com/vbmithr";
    mugshot=Some "vb.jpg";
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
    homepage=None;
    mugshot=Some "yaron.jpg";
  }
  let shinwell = {
    id="shinwell";
    name="Mark Shinwell";
    affiliation=`JSC;
    role="Quantitative Researcher";
    bio=None;
    homepage=Some "http://www.three-tuns.net/mark";
    mugshot=Some "shinwell.jpg";
  }
  (* 
    OCamlPro people
  *)
  let pierre = {
    id="pierre";
    name="Pierre Chambart";
    affiliation=`OCP;
    role="";
    bio=None;
    homepage=Some "http://www.lsv.ens-cachan.fr/~chambart";
    mugshot=(Some "pierre.jpg");
  }
  let gesbert = {
    id="louis";
    name="Louis Gesbert";
    affiliation=`OCP;
    role="";
    bio=None;
    homepage=Some "http://louis.gesbert.fr/";
    mugshot=Some "gesbert.jpg";
  }

  (* INRIA *)
  let fabrice = {
    id="fabrice";
    name="Fabrice Le Fessant";
    affiliation=`INRIA;
    role="Scientist";
    bio=None;
    homepage=Some "http://www.lefessant.net";
    mugshot=(Some "fabrice.jpg");
  }
  let xleroy = {
    id="xleroy";
    name="Xavier Leroy";
    affiliation=`INRIA;
    role="Galium team leader";
    bio=None;
    homepage=Some "http://pauillac.inria.fr/~xleroy/";
    mugshot=(Some "xleroy.jpg");
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
    affiliation=`CLx;
    role="Summer visitor (2012,2013)";
    bio=None;
    homepage=Some "http://people.freebsd.org/~pgj";
    mugshot=Some "gabor.jpg";
  }
(*
  let prashanth = {
    id="prashanth";
    name="Prashanth Mundkur";
    affiliation=`SRI;
    role="Senior Research Scientist";
    bio=None;
    homepage=Some "https://github.com/pmundkur";
    mugshot=Some "prashanth.jpg";
  }
*)
  let jhickey = {
    id="jhickey";
    name="Jason Hickey";
    affiliation=`Google;
    role="Software Engineer";
    bio=None;
    homepage=Some "http://main.metaprl.org/jyh";
    mugshot=Some "jhickey.jpg";
  }

  let xclerc = {
    id="xclerc";
    name="Xavier Clerc";
    affiliation=`INRIA;
    role="Researcher";
    bio=None;
    homepage=Some "http://www.x9c.fr";
    mugshot=Some "xavierclerc.jpg";
  }

  let dbunzli = {
    id="dbunzli";
    name="Daniel Bünzli";
    affiliation=`CLx;
    role="Software Engineer";
    bio=None;
    homepage=Some "http://erratique.ch";
    mugshot=Some "dbuenzli.jpg";
  }

   let vbotbol = {
    id="vbotbol";
    name="Vincent Botbol";
    affiliation=`Past;
    role="Masters Student";
    bio=None;
    homepage=Some "https://github.com/vincent-botbol";
    mugshot=Some "botbol.png";
  }
  let smh = {
    id="smh";
    name="Steven Hand";
    affiliation=`Past;
    role="Reader";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~smh22";
    mugshot=Some "smh.jpg";
  }
  let kaloper = {
    id="kaloper";
    name="David Kaloper";
    affiliation=`Horizon;
    role="Intern";
    bio=None;
    homepage=Some "https://github.com/pqwy";
    mugshot=Some "kaloper.jpg";
  }

  let all = [
    avsm; mycroft; iml; crowcroft; amir; lpw25; yallop; pwang;
    stedolan; balrajsingh; heidi; raphael; smh; haris;  vsevolod;
    griffin; rwatson; alib; bogdan; sheets; gparisis; euan;
    djs; vb; jludlam; lars; yaron; shinwell; tg; pierre; gesbert; fabrice;
    xleroy; mac; mort; ashish; christophe; gabor;
    (* prashanth; *) jhickey; xclerc; dbunzli; vbotbol; kaloper;
    hannes; greg; benjamin; matthieu; frederic; magnus; nicolas;
    sebastian; stekell; tleonard; mpreston; aray; yans; cmolina; mnasr;
    (* gpotron; *)(* qli; *) kchandras ]

  (* Split out the CUCL from the org list *)
  let of_cucl, of_cuclx, of_other =
    let l = by_affiliation all in
    let cucl = List.Assoc.find_exn l `CL |> List.rev in
    let cuclx = List.Assoc.find_exn l `CLx |> List.rev in
    let other =
      List.Assoc.remove l `CL
      |> fun l -> List.Assoc.remove l `CLx
      |> List.sort ~cmp:(fun a b -> cmp (fst a) (fst b))
      |> List.map ~f:(fun (a,b) -> (a, List.rev b))
    in
    cucl, cuclx, other
end

