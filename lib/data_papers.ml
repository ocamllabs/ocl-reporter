(* When you add a paper, don't forget to append it to the `all` variable at the bottom! *)
open Core.Std
open Types.Paper

let jitsu_2015 =
  mk ~id:"jitsu-nsdi-2015"
     ~title:"Jitsu: Just-In-Time Summoning of Unikernels"
     ~url:"http://anil.recoil.org/papers/2015-nsdi-jitsu.pdf"
     ~authors:"Anil Madhavapeddy, Thomas Leonard, Magnus Skjegstad, Thomas Gazagnaire, David Sheets, Dave Scott, Richard Mortier, Amir Chaudhry, Balraj Singh, Jon Ludlam, Jon Crowcroft and Ian Leslie"
     ~date:"2015-05-04"
     ~conf:"12th USENIX Symposium on Networked System Design and Implementation"
     ~conf_url:"https://www.usenix.org/conference/nsdi15/technical-sessions/presentation/madhavapeddy"

let databox_2015 =
  mk ~id:"databox-2015"
     ~title:"Personal Data: Thinking Inside the Box"
     ~url:"http://arxiv.org/pdf/1501.04737v1.pdf"
     ~authors:"Hamed Haddadi, Heidi Howard, Amir Chaudhry, Jon Crowcroft, Anil Madhavapeddy, Richard Mortier"
     ~date:"2015-01-20"
     ~conf:"arXiv:1501.04737"
     ~conf_url:"http://arxiv.org/abs/1501.04737"

let raft_2015 =
  mk ~id:"raft-osr-2015"
     ~title:"Raft Refloated: Do We Have Consensus?"
     ~url:"http://anil.recoil.org/papers/2014-sigops-raft.pdf"
     ~authors:"Heidi Howard, Malte Schwarzkopf, Anil Madhavapeddy and Jon Crowcroft"
     ~date:"2015-01-10"
     ~conf:"ACM SIGOPS Operating System Review special issue on Repeatability and Sharing of Experimental Artifacts"
     ~conf_url:"http://dl.acm.org/citation.cfm?doid=2723872.2723876"
 
let irmin_jfla_2015 =
  mk ~id:"irmin-jfla-2015"
     ~title:"Mergeable Persistent Data Structures"
     ~url:"http://anil.recoil.org/papers/2015-jfla-irmin.pdf"
     ~authors:"Benjamin Farinier, Thomas Gazagnaire and Anil Madhavapeddy"
     ~date:"2015-01-07"
     ~conf:"Les vingt-sixième Journées Francophones des Langages Applicatifs"
     ~conf_url:"http://jfla.inria.fr/2015/"

let kadupul_2014 =
  mk ~id:"kadupul-2014"
     ~title:"Kadupul: Livin' on the Edge with Virtual Currencies and Time-Locked Puzzles"
     ~url:"http://arxiv.org/pdf/1412.4638v1.pdf"
     ~authors:"Magnus Skjegstad, Anil Madhavapeddy and Jon Crowcroft"
     ~date:"2014-12-15"
     ~conf:"arXiv:1412.4638"
     ~conf_url:"http://arxiv.org/abs/1412.4638"

let regional_clouds_2014 =
  mk ~id:"regional-clouds-2014"
     ~title:"Regional Clouds: Technical Considerations"
     ~url:"http://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-863.pdf"
     ~authors:"Jatinder Singh, Jean Bacon, Jon Crowcroft, Anil Madhavapeddy, Thomas Pasquier, W. Kuan Hon, and Christopher Millard"
     ~date:"2014-11-01"
     ~conf:"University of Cambridge Computer Laboratory Technical Report"
     ~conf_url:"http://www.cl.cam.ac.uk/techreports"

let cufp_2013 =
  mk ~id:"cufp-jfp-2013"
     ~title:"Commercial Users of Functional Programming 2013 Scribe's Report"
     ~url:"http://anil.recoil.org/papers/2013-cufp-scribe-preprint.pdf"
     ~authors:"Marius Eriksen, Michael Sperber and Anil Madhavapeddy"
     ~date:"2014-09-01"
     ~conf:"Journal of Functional Programming"
     ~conf_url:"http://mc.manuscriptcentral.com/jfp_submit"

let cacm_2014 =
   mk ~id:"cacm-unikernels-2013"
     ~title:"Unikernels: the Rise of the Virtual Library Operating System"
     ~url:"http://cacm.acm.org/magazines/2014/1/170866-unikernels/abstract"
     ~authors:"Anil Madhavapeddy and Dave Scott"
     ~date:"2014-01-04"
     ~conf:"Communications of the ACM"
     ~conf_url:"http://cacm.acm.org/"

let rwo_2013 =
  mk ~id:"rwo-2013"
     ~title:"Real World OCaml: Functional Programming for the Masses"
     ~url:"https://realworldocaml.org"
     ~authors:"Yaron Minsky, Anil Madhavapeddy and Jason Hickey"
     ~date:"2013-11-22"
     ~conf:"O'Reilly Associated"
     ~conf_url:"http://oreilly.com"

let cufp_2012 =
  mk ~id:"cufp-jfp-2012"
     ~title:"Commercial Users of Functional Programming 2012 Workshop Report"
     ~url:"http://anil.recoil.org/papers/drafts/2012-cufp-scribe-DRAFT.pdf"
     ~authors:"Michael Sperber and Anil Madhavapeddy"
     ~date:"2013-11-01"
     ~conf:"Journal of Functional Programming"
     ~conf_url:"http://mc.manuscriptcentral.com/jfp_submit"

let trevi_hotnets_2013 =
  mk ~id:"hotnets-trevi-2013"
     ~title:"Trevi: Watering Down Storage Hotspots with Cool Fountain Codes"
     ~url:"http://anil.recoil.org/papers/2013-hotnets-trevi.pdf"
     ~authors:"George Parisis, Toby Moncaster, Anil Madhavapeddy and Jon Crowcroft"
     ~date:"2013-11-21"
     ~conf:"Twelfth ACM Workshop on Hot Topics in Networks (HotNets-XII)"
     ~conf_url:"http://conferences.sigcomm.org/hotnets/2013/cfp.shtml"

let usenix_foci_2013 =
  mk ~id:"foci-2013-signposts"
     ~title:"Lost In the Edge: Finding Your Way With Signposts"
     ~url:"http://anil.recoil.org/papers/2013-foci-signposts.pdf"
     ~authors:"Charalampos Rotsos, Heidi Howard, David Sheets, Richard Mortier, Anil Madhavapeddy, Amir Chaudhry and Jon Crowcroft"
     ~date:"2013-08-01"
     ~conf:"USENIX FOCI 2013"
     ~conf_url:"https://www.usenix.org/conference/foci13"

let asplos_2013 =
  mk ~id:"asplos-2013-unikernels"
     ~title:"Unikernels: Library Operating Systems for the Cloud"
     ~url:"http://anil.recoil.org/papers/2013-asplos-mirage.pdf"
     ~authors:"Anil Madhavapeddy, Richard Mortier, Charalampos Rotsos, David Scott, Balraj Singh, Thomas Gazagnaire, Steven Smith, Steven Hand and Jon Crowcroft"
     ~date:"2013-03-01"
     ~conf:"ASPLOS 2013"
     ~conf_url:"http://asplos13.rice.edu"

let hotcloud_2010 =
  mk ~id:"hotcloud-2010-mirage"
     ~title:"Turning down the LAMP: Software Specialisation for the Cloud"
     ~url:"http://anil.recoil.org/papers/2010-hotcloud-lamp.pdf"
     ~authors:"Anil Madhavapeddy, Richard Mortier, Ripduman Sohan, Thomas Gazagnaire, Steven Hand, Tim Deegan, Derek McAuley and Jon Crowcroft"
     ~date:"2010-06-22"
     ~conf:"HotCloud 2010" 
     ~conf_url:"http://static.usenix.org/events/hotcloud10/index.html"

let conext_pvtcp =
  mk ~id:"conext-2012-pvtcp"
     ~title:"Evolving TCP. How hard can it be?"
     ~url:"http://anil.recoil.org/papers/2012-conext-pvtcp-position.pdf"
     ~authors:"Zubair Nabi, Toby Moncaster, Anil Madhavapeddy, Steven Hand, Jon Crowcroft"
     ~date:"2012-12-02"
     ~conf:"ACM CoNEXT 2012 Student Workshop"
     ~conf_url:"http://conferences.sigcomm.org/co-next/2012/"

let sas_2013 =
  mk ~id:"sas-2013"
     ~title:"Concise analysis using implication algebras for task-local memory optimization"
     ~url:"http://www.cl.cam.ac.uk/~lpw25/papers/sas2013.pdf"
     ~authors:"Leo White and Alan Mycroft"
     ~date:"2013-04-06"
     ~conf:"Static Analysis Symposium 2013"
     ~conf_url:"http://research.microsoft.com/en-us/events/sas2013/"

let all = [
  databox_2015;
  kadupul_2014;
  jitsu_2015;
  raft_2015;
  regional_clouds_2014;
  irmin_jfla_2015;
  cufp_2013;
  cacm_2014;
  rwo_2013;
  cufp_2012;
  trevi_hotnets_2013;
  usenix_foci_2013;
  asplos_2013;
  hotcloud_2010;
  conext_pvtcp;
  sas_2013
]

let all_by_date =
  let cmp a b = Date.compare b.date a.date in
  List.sort ~cmp all
