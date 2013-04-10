(* When you add a paper, don't forget to append it to the `all` variable at the bottom! *)
open Core.Std
open Types.Paper

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


let all = [
  asplos_2013;
  hotcloud_2010;
  conext_pvtcp
]

let all_by_date =
  let cmp a b = Date.compare b.date a.date in
  List.sort ~cmp all
