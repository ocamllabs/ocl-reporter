(*
 * Copyright (c) 2012 Anil Madhavapeddy <anil@recoil.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

open Printf
open Core.Std

(* Helper function to generate link tags *)
let link ?cl href text =
  match cl with
  |None -> <:html<<a href="$str:href$">$str:text$</a>&>>
  |Some cl -> <:html<<a class="$str:cl$" href="$str:href$">$str:text$</a>&>>

let ref_to_html rf =
  let open Types.Reference in
  let l = <:html<$str:rf.name$>> in
  match rf.link with
  |`Pdf r -> <:html<<a class="icon-pdf" href=$str:r$>$l$</a>&>>
  |`Blog r |`Webpage r -> <:html<<a class="icon-cloud" href=$str:r$>$l$</a>&>>
  |`Video r|`Slideshare r -> <:html<<a class="icon-bullhorn" href=$str:r$>$l$</a>&>>
  |`Github (u,p) -> let r = sprintf "https://github.com/%s/%s" u p in <:html<<a class="icon-github" href=$str:r$>$l$</a>&>>
  |`Github_issue (u,p,i) -> let r = sprintf "https://github.com/%s/%s/issues/%d" u p i in <:html<<a class="icon-wrench" href=$str:r$>$l$</a>&>>
  |`Github_issues (u,p) -> let r = sprintf "https://github.com/%s/%s/issues" u p in <:html<<a class="icon-wrench" href=$str:r$>$l$</a>&>>
  |`Github_tag (u,p,t) -> let r = sprintf "https://github.com/%s/%s/archives/%s.tar.gz" u p t in <:html<<a class="icon-github" href=$str:r$>$l$</a>&>>
  |`Mantis id -> let r = sprintf "http://caml.inria.fr/mantis/view.php?id=%d" id in <:html<<a href=$str:r$>$l$</a>&>>
  |`Paper {Types.Paper.id} -> let r = sprintf "../papers/index.html#%s" id in <:html<<a class="icon-pdf" href=$str:r$>$l$</a>&>>

let refs_to_html rs =
  let x = List.map ~f:(fun x -> <:html<$ref_to_html x$ &nbsp; >>) rs in
  <:html<$list:x$>>

(* Convert a Date to a human-readable string.
 * TODO is there a nicer Core function for this? *)
let human_readable_date d =
  sprintf "%s %d" (Month.to_string (Date.month d)) (Date.year d)

let person_href p content =
  match p.Types.Person.homepage with
  | Some h -> <:html<<a href=$str:h$>$content$</a>&>>
  | None -> content

let mugshot p = sprintf "../mugshots/%s" (Option.value ~default:"unknown.jpg" p.Types.Person.mugshot)
let mugshot_img ?(float=true) ?(size=60) p =
  let size = sprintf "%dpx" size in
  let style = if float then "float:left; padding-right: 30px" else "" in
  let c = <:html<<img class="inline" style=$str:style$ height=$str:size$ src=$str:mugshot p$ />&>> in
  person_href p c

(* CSS style we include for each page.
 * Note that this style is specialised to the CUCL web page style *)
let style =
  <:html<
    <style>
    a.icon-github {
	background: url(../github.png) no-repeat 0 0;
	padding: 0 0 2px 2em;
    }
    a.icon-cloud {
	background: url(../cloud.png) no-repeat 0 0;
        background-size: 17px;
	padding: 0 0 2px 2em;
    }
    a.icon-bullhorn {
	background: url(../bullhorn.png) no-repeat 0 0;
        background-size: 17px;
	padding: 0 0 2px 2em;
    }
    a.icon-wrench {
	background: url(../wrench.png) no-repeat 0 0;
        background-size: 17px;
	padding: 0 0 2px 2em;
    }
    </style>
  >>

(* Output a single page as a HTML.t and the standard boilerplate HTML *)
let one_page ?(extra_head=[]) ~title ~body () =
  <:html<<head><title>$str:title$</title>$style$$extra_head$</head><body>$body$</body>&>>

(* Generate the overall people web pages *)
let people =
  let open Types.Person in
  let person_to_html p =
    let m = mugshot_img ~size:80 p in
   let phref = person_href p <:html<$str:p.name$&>> in
   <:html<
      <table style="float:left">
        <tr><td>$m$</td></tr>
        <tr><td width="130px">$phref$<br /><span style="font-size:90%">$str:p.role$</span></td></tr>
      </table>
    >>
  in
  let ext_people =
    List.map Data.People.of_other ~f:(fun (org,people) ->
      <:html<
        <p><b>$str:to_string org$</b></p>
        <div style="overflow:auto">$list:List.map ~f:person_to_html people$</div>
      >>)
  in
  (* Aggregate all the organisation info now *)
  let orgs = <:html<
    <h3>University of Cambridge Computer Laboratory</h3>
    <p><b>Core Members</b></p>
    <div style="overflow:auto">$list:List.map ~f:person_to_html Data.People.of_cucl$</div>
    <p><b>Internal Collaborators</b></p>
    <div style="overflow:auto">$list:List.map ~f:person_to_html Data.People.of_cuclx$</div>
    <h3>External Partners</h3>
    $list:ext_people$
  >> in
  (* And output the full people web page *)
  one_page ~title:"People" ~body:
  <:html<
  <h1 id="Members">Project Members</h1>
  <p>OCaml Labs is situated at the University of Cambridge Computer Laboratory, and collaborates with a wide variety of industrial partners, primarily <a href="#janestreet">Jane Street</a>, <a href="#horizon">Horizon</a> and <a href="#citrix">Citrix</a>.  We also work closely with <a href="#ocamlpro">OCamlPro</a> on community software projects, and maintain the <a href="http://ocaml.org">ocaml.org</a> infrastructure.</p>
   $orgs$
  <h2>Funding</h2>
  <a name="funding"></a>
  <p>OCaml Labs is primarily funded by <a href="http://janestreet.com">Jane Street</a> with a platform grant.  It is also supported by <a href="http://www.xen.org/products/cloudxen.html">Citrix Systems R&amp;D</a>.  There are also several research grants associated with OCamlLabs:</p><ul>
 <li>RCUK <a href="http://www.horizon.ac.uk">Horizon Digital Economy Research</a> Hub grant, <a class="icon-external" href="http://gow.epsrc.ac.uk/NGBOViewGrant.aspx?GrantRef=EP/G065802/1">EP/G065802/1</a>.</li>
 <li>EU FP7 <a href="http://trilogy2.eu">Trilogy2</a> project.</li>
  </ul>

  <p><img class="left" src="../images/janest.jpg" /><img width="150px" src="../images/citrix.gif"/></p>
>> ()

let projects =
  let sproj =
    let open Data.Projects in
    let open Types.Project in
    List.map all ~f:(fun p -> <:html<<li><a href=$str:"#"^p.project_id$><b>$str:p.project_name$</b></a>: $str:p.project_elevator$</li> >>)
  in
  let body = <:html<
    <div style="width:75%">
    <p>The OCaml Labs are organised around focussed projects summarised below.  Click on the heading for more information, and <a href="../contact.html">get in touch</a> with the project owner if you'd like to know more.  The projects are:</p>
    <ul>$list:sproj$</ul>
    </div>
    $list:Gantt.to_project_html ~moreinfo:true Data.Projects.all$ >> in
  one_page ~title:"Projects" ~body ()

let one_project proj =
  let open Types in
  let open Project in
  let tasks =
    List.map ~f:(fun t ->
      let descr =
        match t.task_descr with
        |None -> []
        |Some descr ->
          Markdown.from_file_to_html (sprintf "%s/%s" proj.project_id descr)
      in
      let status =
        let mode =
           match t.status with
           |`Planning -> <:html<<span class="planning">Planning</span>&>>
           |`Doing -> <:html<<span class="doing">In Progress</span>&>>
           |`Complete -> <:html<<span class="complete">Complete</span>&>>
        in
        let start = <:html<$str:human_readable_date t.start$>> in
        let finish =
          match t.finish with
          |None -> <:html<&>>
          |Some d -> <:html< $str:human_readable_date d$>>
        in
        let phref = sprintf "../people/%s.html" t.owner.Person.id in
        let pname = t.owner.Person.name in
        let n = <:html<<a href=$str:phref$>$str:pname$</a>&>> in
        <:html< $mode$ by $n$ ($start$ -$finish$) >>
      in
      let mugshots = mugshot_img ~size:40 t.owner in
      let related =
        let links = List.map
          ~f:(fun (desc, pid, tname) ->
            let url = pid ^ ".html#" ^ tname in
              <:html<<li><a href=$str:url$>$str:desc$</a></li>&>>)
          t.related
        in
        if links = [] then Cow.Html.nil
        else
          <:html<<h4><em>Related work</em></h4>
          <ul>$list:links$</ul>&>>
      in
      <:html<
         <div style="width:75%">
         <h3 style="border-bottom: thin solid #999999;" id=$str:t.task_name$>$str:t.task_name$</h3>
         <p>$mugshots$ $status$<br />$refs_to_html t.refs$</p>
         $descr$
         $related$<br /></div>
      >>
  ) (List.sort ~cmp:Gantt.sort_by_finish_date proj.tasks) in
  let team = List.map ~f:(mugshot_img ~float:false ~size:50) (people_in_project proj) in
  let teamlist = <:html<<p>$list:team$</p>&>> in
  let body = <:html<
    <div class="ucampas-toc right"/>
    $Gantt.to_one_project_html teamlist proj$
    $list:tasks$
  >> in
  one_page ~title:proj.project_name ~body ()

let outputs =
  let open Types.Paper in
  let pubs = List.map Data_papers.all_by_date
    ~f:(fun p ->
      let hrdate = sprintf "%s %d" (Month.to_string (Date.month p.date)) (Date.year p.date) in
      <:html<
       <p>
       <a name=$str:p.id$></a>
       <b>$str:p.title$</b>
       <br />
       <a class="icon-pdf" href=$str:p.url$>Download</a>
       <br />
       $str:p.authors$
       <br />
       in <a href=$str:p.conf_url$>$str:p.conf$</a>, $str:hrdate$
       </p>
      >>)
  in
  let body = <:html<
     <h1 id="Publications">Publications</h1>
     $list:pubs$
    >> in
  one_page ~title:"Papers" ~body ()

let news =
  let monthly = List.map Data_news.monthlies ~f:(fun (_,m) ->
     let hd = human_readable_date (Date.of_string m) in
     let body = Markdown.from_file_to_html (sprintf "news/%s" m) in
     <:html<
       <div style="width:75%">
       <h2 style="border-bottom: 1px solid #cccccc" id=$str:hd$>$str:hd$</h2>
        $body$</div>
     >>) in
  let body = <:html<
    <div class="ucampas-toc right"/>
    $list:monthly$ >> in
  let extra_head = <:xml<<link rel="alternate" type="application/atom+xml" href="http://www.cl.cam.ac.uk/projects/ocamllabs/news/atom.xml" title="OCaml Labs news" />&>> in
  one_page ~extra_head ~title:"News" ~body ()

let news_atom =
 (* let monthly = List.map Data_news.monthlies ~f:(fun m -> *)
  let open Cow.Atom in
  let entries = List.map Data_news.monthlies
    ~f:(fun (date, file) ->
       let yr,month,_,_,_ = date in
       let month_str = Month.to_string (Month.of_int_exn month) in
       let id = Uri.to_string (Vars.mk_uri (sprintf "news/%s" file)) in
       let title = sprintf "%s %d news update" month_str yr in
       let subtitle = None in
       let author = Some { name="Anil Madhavapeddy"; uri=Some "http://anil.recoil.org";
         email=Some "anil@recoil.org" } in
       let rights = Some "(c) Anil Madhavapeddy, all rights reserved" in
       let updated = date in
       let links = [ mk_link ~rel:`alternate ~typ:"text/html"
          (Vars.mk_uri (sprintf "news/index.html#%s %d" month_str yr)) ] in
       let entry = { id; title; subtitle; author; rights; updated; links } in
       let content = Markdown.from_file_to_html (sprintf "news/%s" file) in
       let base = Some (Uri.to_string (Vars.mk_uri (sprintf "news/"))) in
       { entry; summary=None; content; base }
    )
  in
  let links = [
    mk_link (Vars.mk_uri "/news/atom.xml");
    mk_link ~rel:`alternate ~typ:"text/html" (Vars.mk_uri "/news/")
  ] in
  let feed_meta = {
    id=(Uri.to_string (Vars.mk_uri "/news/"));
    title="OCaml Labs News";
    subtitle=Some "Real World Functional Programming";
    author=None;
    rights=None;
    updated=(List.hd_exn entries).entry.updated;
    links
  } in
  { feed = feed_meta; entries }

let write_html file html =
  let data = Cow.Html.to_string html in
  let fname = sprintf "pages/%s-b.html" file in
  eprintf "writing : %s\n" fname;
  Out_channel.write_all fname ~data

let write_xml file xml =
  let xml = Cow.Atom.xml_of_feed news_atom in
  let fname = sprintf "pages/%s.xml" file in
  let data = Cow.Xml.to_string ~decl:true xml in
  eprintf "writing : %s\n" fname;
  Out_channel.write_all fname ~data

(* The uconfig files are used by ucampas to generate the various
 * menus, so dynamically generate them from our generated pages. *)
let write_uconfig dir files =
  let dir = "pages/" ^ dir in
  Unix.mkdir_p dir;
  let fname = Filename.concat dir "uconfig.txt" in
  let buf = List.map files ~f:(fun x -> x^".html") |! String.concat ~sep:"," in
  Out_channel.write_all fname ("navstop=1,\n"^buf)

let write_blogs file =
  let in_file = "lib/data_blog.txt" in
  let out_file = sprintf "pages/%s-b.html" file in
  eprintf "writing : %s\n" out_file;
  eprintf "writing : pages/blogs/atom.xml\n";
  Blogs.write_posts ~num_posts:100 ~out_file:out_file
    ~out_atom:"pages/blogs/atom.xml" in_file

let _ =
  write_uconfig "people" [];
  write_html "people/index" people;
  write_uconfig "tasks" (List.map Data.Projects.all ~f:(fun p -> p.Types.Project.project_id));
  write_html "tasks/index" projects;
  List.iter Data.Projects.all ~f:(fun p ->
    write_html ("tasks/"^p.Types.Project.project_id) (one_project p));
  write_uconfig "papers" [];
  write_html "papers/index" outputs;
  write_uconfig "news" [];
  write_html "news/index" news;
  write_xml "news/atom" news_atom;
  write_blogs "blogs/index";
  ()
