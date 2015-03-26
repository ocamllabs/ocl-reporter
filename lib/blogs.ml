open River
open Nethtml
open Printf

open Data_face
open Bootstrap

module Atom = Syndic.Atom

type html = Nethtml.document list

let encode_document html = Nethtml.encode ~enc:`Enc_utf8 html

let date_of_post p =
  match p.date with
  | None -> "<Date Unknown>"
  | Some d ->
       let open Syndic.Date in
       sprintf "%s %02d, %d" (string_of_month(month d)) (day d) (year d)

let rec length_html html =
  List.fold_left (fun l h -> l + length_html_el h) 0 html
and length_html_el = function
  | Element(_, _, content) -> length_html content
  | Data d -> String.length d

let new_id =
  let id = ref 0 in
  fun () -> incr id; sprintf "ocamlorg-post%i" !id

(* [toggle html1 html2] return some piece of html with buttons to pass
   from [html1] to [html2] and vice versa. *)
let toggle ?(anchor="") html1 html2 =
  let button id1 id2 text =
    Element("a", ["onclick", sprintf "switchContent('%s','%s')" id1 id2;
                  "class", "btn planet-toggle";
                  "href", "#" ^ anchor ^ "-link"],
            [Data text])
  in
  let id1 = new_id() and id2 = new_id() in
  [Element("div", ["id", id1],
           html1 @ [button id1 id2 "Read more..."]);
   Element("div", ["id", id2; "style", "display: none"],
           html2 @ [button id2 id1 "Hide"])]

let write_atom posts out_atom =
  let open Syndic.Atom in
  let entries = mk_entries posts in
  let feed =
    let authors = [ author "OCaml Labs" ] in
    let id = "http://ocaml.io/blogs/atom.xml" in
    let links = [ link ~rel:Self @@ Uri.of_string id ] in
    let title : text_construct = Text "OCaml Labs Blogs" in
    let subtitle : text_construct = Text "Real World Functional Programming" in
    let updated = CalendarLib.Calendar.now () in
    feed ~authors ~links ~id ~title ~subtitle ~updated entries in
  let out_channel = open_out out_atom in
  output feed (`Channel out_channel);
  close_out out_channel

let write_posts ?num_posts ?ofs ~out_file ~out_atom in_file =
  let posts = get_posts ?n:num_posts ?ofs in_file in
  let recentList = List.map (fun p ->
                     let date = date_of_post p in
                     let title = p.title in
                     let url = match p.link with
                       | Some u -> Uri.to_string u
                       | None -> Digest.to_hex (Digest.string (p.title)) in
                     let author = p.author in
                     mk_recent date url author title) posts in
  let postList = List.map (fun p ->
                   let title = p.title in
                   let date = date_of_post p in
                   let url = match p.link with
                     | Some u -> Uri.to_string u
                     | None -> Digest.to_hex (Digest.string (p.title)) in
                   let author = p.author in
                   let blog_name = p.contributor.name in
                   let blog_title = p.contributor.title in
                   let blog_url = p.contributor.url in
                   (* Write contents *)
                   let buffer = Buffer.create 0 in
                   let channel = new Netchannels.output_buffer buffer in
                   let desc = if length_html p.desc < 1000 then p.desc
                              else toggle (prefix_of_html p.desc 1000) p.desc ~anchor:url in
                   let _ = Nethtml.write channel @@ encode_document desc in
                   let content = Buffer.contents buffer in
                   try
                     let (face, face_height) = M.find p.author face_map in
                     match face with
                       | None -> mk_post url title blog_url blog_title blog_name
                                         author date content
                       | Some face -> mk_post_with_face url title blog_url
                                         blog_title blog_name author date
                                          content face face_height
                   with _ -> mk_post url title blog_url blog_title blog_name
                                     author date content)
                  posts in
  let body = mk_body (String.concat "\n" recentList)
                     (String.concat "\n<br/><br/><br/>\n" postList) in
  (* write to file *)
  let f = open_out out_file in
  let () = output_string f body in
  close_out f;
  (* Write atom feed *)
  write_atom posts out_atom
