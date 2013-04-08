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
    role="Principle Investigator";
    bio=None;
    homepage=Some "http://anil.recoil.org";
    mugshot=(Some "avsm.jpg");
  }
  let mycroft = {
    id="mycroft";
    name="Alan Mycroft";
    affiliation=`CL;
    role="Principle Investigator";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~am21";
    mugshot=(Some "mycroft.jpg");
  }
  let iml = {
    id="iml";
    name="Ian Leslie";
    affiliation=`CL;
    role="Principle Investigator";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~iml1]";
    mugshot=(Some "iml.jpg");
  }
  let crowcroft = {
    id="crowcroft";
    name="Jon Crowcroft";
    affiliation=`CL;
    role="Principle Investigator";
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
    mugshot=None;
  }
  let pwang = {
    id="pwang";
    name="Phillipe Wang";
    affiliation=`CL;
    role="Research Associate";
    bio=None;
    homepage=Some "http://philippewang.info";
    mugshot=Some "pwang.jpg";
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
    affiliation=`CLx;
    role="Reader";
    bio=None;
    homepage=Some "http://www.cl.cam.ac.uk/~smh22";
    mugshot=Some "smh.jpg";
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
  let stephend = {
    id="stephand";
    name="Stephen Dolan";
    affiliation=`CL;
    role="PhD Student";
    bio=None;
    homepage=Some "https://github.com/stedolan";
    mugshot=None;
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
    role="Senior RA";
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
    affiliation=`CL;
    role="ACS Student (2013)";
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
    mugshot=Some "yaron.jpg";
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
  let pierre = {
    id="pierre";
    name="Pierre Chambart";
    affiliation=`OCP;
    role="";
    bio=None;
    homepage=Some "http://www.lsv.ens-cachan.fr/~chambart";
    mugshot=(Some "pierre.jpg");
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
  let mort = {
    id="mort";
    name="Richard Mortier";
    affiliation=`Horizon;
    role="Lecturer";
    bio=None;
    homepage=Some "http://www.cs.nott.ac.uk/~rmm";
    mugshot=Some "mort.png";
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
    role="Summer visitor (2012)";
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

  let all = [
    avsm; mycroft; iml; crowcroft; amir; lpw25; yallop; pwang;
    stedolan; balrajsingh; heidi; raphael; smh; haris; griffin;
    vsevolod; stephend; rwatson; alib; bogdan;
    djs; vb; jludlam; lars; yaron; shinwell; tg; fabrice; xleroy;
    pierre; mac; mort; ashish; christophe; gabor;
    (* prashanth; *) jhickey ]

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

