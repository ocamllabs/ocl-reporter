(* Output an almost-Gantt chart HTML from the data set *)

open Data

open Core.Std

let years = [2012;2013;2014;2015]
let start_date = Date.create_exn ~y:2012 ~m:Month.Aug ~d:1
let end_date   = Date.create_exn ~y:2015 ~m:Month.Dec ~d:1
let dates = 
  List.concat_map Month.all ~f:(fun m ->
    List.map years ~f:(fun y -> Date.create_exn ~y ~m ~d:1))
  |> List.filter ~f:(fun d -> Date.(d > start_date && d < end_date))
  |> List.sort ~cmp:Date.compare 
let last_date = List.last_exn dates

(* account for infinty column *)
let total_colspan = List.length dates + 1
let cells =
  List.map dates ~f:(fun d ->
    if Date.month d = Month.Jan then
      <:html<<td>$int:Date.year d$</td>&>> else
      <:html<<td>&nbsp;</td>&>>
  )
  @ [ <:html<<td>&infin;</td>&>> ]

let months_between d1 d2 =
  let round d = Date.create_exn ~y:(Date.year d) ~m:(Date.month d) ~d:1 in
  Date.dates_between d1 d2 
  |> List.map ~f:round
  |> List.dedup
  |> List.filter ~f:(fun d -> d <> (round d1))

let render_link link =
  let open Types.Reference in
  match link.link with
  |`Github (user,repo)->
    let href=sprintf "http://github.com/%s/%s" user repo in
    <:html<<a href=$str:href$>Code</a>&>>
  |`Webpage href ->
    <:html<<a href=$str:href$>$str:link.name$</a>&>>
  |_ ->
    <:html<$str:link.name$>>

(* Wrap an href around tag if present *)
let wrap_url targ content =
  match targ with
  |None -> content
  |Some u -> <:html<<a href=$str:u$>$content$</a>&>>

let draw_task ?(hrefbase="") task =
  let open Types.Project in
  (* Clamp task start to first date *)
  let task_start = Date.max task.start start_date in
  let task_end =
    match task.finish with
    |None -> last_date
    |Some f -> f
  in
  let padding ~cl d1 d2 c = 
    match List.length (months_between d1 d2) with
    |0 -> <:html<&>>
    |n -> <:html<<td class=$str:cl$ colspan=$str:string_of_int n$>$c$</td>&>>
  in
  let left = padding ~cl:"blank" start_date task_start <:html<&>> in
  let mugshot =
    let open Types.Person in
    let url = sprintf "../mugshots/%s" (Option.value ~default:"unknown.jpg" task.owner.mugshot) in
    let alt = task.owner.name in
    wrap_url task.owner.homepage
      <:html<<img class="mugshot" alt=$str:alt$ src=$str:url$ height="30px" />&>>
  in
  let task_href = hrefbase ^ "#" ^ task.task_name in
  let body = <:html<
               $mugshot$
               <a href=$str:task_href$>$str:task.task_name$</a><br />
             >> in
  let content = padding ~cl:(status_to_string task.status) task_start task_end body in
  let right = padding ~cl:"blank" task_end last_date <:html<&>> in
  let infinity = <:html<<td></td>&>> in
  <:html< <tr> $left$ $content$ $right$ $infinity$ </tr> >>

let tasks ?(hrefbase="") proj = List.map ~f:(draw_task ~hrefbase) proj

let css = <:html<
            <style type="text/css">
            table { 
            table-layout: fixed;
            border-spacing: 0px 2px;
            }
            .blank { background-color: #fefefe; }
            .planning { font-size: 80%; background-color: #bbccee; }
            .doing { font-size: 80%; background-color: #eeeebb; }
            .complete { font-size: 80%; background-color: #bbddbb; }
            img.mugshot { float:left; padding-right: 5px; }
            tr.dates {
            font-size: 0.75em;
            background-color: #dfdfdf;
            color: #111111;
            }
            </style>
          >>

let sort_by_finish_date a b =
  let open Types.Project in
  let finish_date t =
    match t.finish with
    | Some d -> d
    | None -> Date.of_string "3000-01-01"
  in
  Date.compare (finish_date b) (finish_date a)

(* Output the main projects page HTML *)
let to_project_html ?(moreinfo=true) projects = 
  let open Types.Project in
  let more proj =
    let proj_href = proj.project_id^".html" in
    let style = "border-bottom: 1px solid #cccccc; font-weight: bold" in
    if moreinfo then
      <:html<
       <h2 style=$str:style$ id=$str:proj.project_id$>
         <a href=$str:proj_href$>$str:proj.project_name$ &raquo;</a>
       </h2> >>
      else
        <:html<
         <h2 style=$str:style$ id=$str:proj.project_id$>$str:proj.project_name$</h2> >>
  in
  List.map projects
    ~f:(fun proj ->
      let proj_descr = Markdown.from_file_to_html (proj.project_id^"/descr") in
      let ts = tasks ~hrefbase:(proj.project_id^".html") (List.sort ~cmp:sort_by_finish_date proj.tasks) in
      <:html<
        $css$
        <div style="width:75%">
        $more proj$
        $proj_descr$
        </div>
        <table class="projects" width="85%">
        <tr class="dates">$list:cells$</tr>
        $list:ts$
        <tr><td colspan=$str:string_of_int total_colspan$>&nbsp;</td></tr>
        </table>
      >>)

let to_one_project_html teamlist proj =
  let open Types.Project in
  let proj_descr = Markdown.from_file_to_html (proj.project_id^"/descr") in
  let ts = tasks (List.sort ~cmp:sort_by_finish_date proj.tasks) in
  <:html<
    $css$
    <h1 id=$str:proj.project_id$>$str:proj.project_name$</h1>
    <div class="width:75%">$proj_descr$</div>
    <h2 id="Team">Team</h2>
    $teamlist$
    <h2 id="Tasks">Tasks</h2>
    <table class="projects" width="95%">
    <tr class="dates">$list:cells$</tr>
    $list:ts$
    <tr><td colspan=$str:string_of_int total_colspan$>&nbsp;</td></tr>
    </table>
  >>

(* Output the shortened version without descriptions, for the person page *)
let to_short_html person =
  let open Types.Project in
  (* Find projects for this person *)
  let projects = List.filter Data.Projects.all 
      ~f:(fun proj -> List.mem (people_in_project proj) person) in
  List.map projects ~f:(fun proj ->
    let task_list = List.sort ~cmp:sort_by_finish_date proj.tasks in
    let phref = sprintf "../tasks/%s.html" proj.project_id in
    <:html<
      $css$
      <div style="width:75%">
      <h3 style="font-weight: bold" id=$str:proj.project_id$><a href=$str:phref$>$str:proj.project_name$</a></h3>
      <p>$str:proj.project_elevator$</p>
      </div>
      <div style="width:90%">
      <table class="projects" width="95%">
        <tr class="dates">$list:cells$</tr>
        $list:tasks ~hrefbase:("../tasks/"^proj.project_id^".html") task_list$
        <tr><td colspan=$str:string_of_int total_colspan$>&nbsp;</td></tr>
      </table>
      </div>
    >>
  )
