type t = {
  name : string;
  face : string option;
  face_height : int;
}

module M = Map.Make
            (struct
              type t = string
              let compare = Pervasives.compare
            end)

let mk_face ~name ?(face=None) ?(face_height=50) () =
  { name; face; face_height}

let srg_syslog =
  mk_face ~name:"SRG Syslog" ()

let anil =
  mk_face ~name:"Anil Madhavapeddy"
          ~face:(Some "../mugshots/avsm.jpg")
          ~face_height:70 ()

let amir =
  mk_face ~name:"Amir Chaudhry"
          ~face:(Some "../mugshots/amir.jpg") ()

let comp =
  mk_face ~name:"Compiler Hacking"
          ~face:(Some "../images/hax0ring.jpg") ()

let monthly_news =
  mk_face ~name:"OCL Monthly News" ()

let heidi =
  mk_face ~name:"Heidi Howard"
          ~face:(Some "../mugshots/heidi.jpg") ()

let mirage_os =
  mk_face ~name:"Mirage OS" ()

let tleonard =
  mk_face ~name:"Thomas Leonard"
          ~face:(Some "../mugshots/tleonard.jpg")
          ~face_height:70 ()

let mpreston =
  mk_face ~name:"Mindy Preston" ()

let lpw25 =
  mk_face ~name:"Leo White"
          ~face:(Some "../mugshots/lpw25.jpg") ()

let magnuss =
  mk_face ~name:"Magnus Skjegstad"
          ~face:(Some "../mugshots/magnus.jpg") ()

let all_faces = [ srg_syslog; anil; amir; comp; monthly_news; heidi;
                  mirage_os; tleonard; mpreston; lpw25; magnuss ]

let face_map = List.fold_right (fun {name; face; face_height} m ->
                 M.add name (face, face_height) m) all_faces M.empty
