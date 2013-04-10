January's update is broken down into the three overall themes of OCaml Labs, 
specifically, Platform, Systems and Compiler projects with some additional 
points at the end.  In general, there seems to be more interest than 
expected in the work we're doing and the number of collaborative projects is 
increasing.  We need to do more work on the reporting structure but it would 
be useful to have some feedback on what you would find most useful. Please 
do get in touch if you have comments.

We held the first of the monthly meetings last Friday, in the Computer Lab.  
Anil provided an overview of the research work that OCaml Labs is involved 
with and the updates are also described below.  An interesting theme of the 
discussion that followed was related to undergraduate teaching and how 
things like the OCaml Platform and infrastructure would make it easier for 
students to get to grips with programming.  

For the evening after the meeting, [Amir](../people/achaudhry.html) set up 
an informal OCaml hacking/tutorial session in Cambridge.  Around 15 eager 
people attended the event in [Makespace](http://makespace.org) (a community 
workshop), with most of them being new to the language.  Anil introduced 
[Real World OCaml](../projects/rwo.html#output-book-website) and shared the 
introductory chapters while Thomas provided help with OPAM.  This turned out 
to be a great test of the installation process for newcomers to OCaml, as 
well as the book's instructions. A number of issues came to light, partly 
related to a perfect storm of package issues, which everyone is keen to 
improve.  Despite these problems, attendees were very positive and were keen 
to see more gatherings like this in future.  When Amir asked for feedback, 
pretty much everyone commented on how great the pizza was.

### Platform projects

OCaml Labs also hosted its first visitor this month.  
[Thomas Gazagnaire](../people/tgazagnaire.html), lead developer of the 
popular OPAM package manager and CTO of OCamlPro, spent three weeks in 
Cambridge.  Much effort was put into preparing Mirage for release, 
discussions about parallelism and the OCaml Platform.  In fact, anything 
where OPAM is a crucial component.  This was a great productivity boost and 
we look forward to future visits, both from Thomas and others.  An item 
worth noting is that (at time of writing) the 
[opam-repository](https://github.com/OCamlPro/opam-repository) has now 
become the 
[overall most forked OCaml project on Github](https://github.com/languages/OCaml).  
The [Platform mailing list](http://lists.ocaml.org/pipermail/platform/) 
has also been formed for discussion regarding the OCaml Platform.  Anyone 
interested in the discussions about the platform, which will include 
development on OPAM, should join this list.

Part of the Platform work involves creating a new 
[design for OCaml.org](../projects/infrastructure.html#output-web-design-content), which also 
[kicked-off this week](http://lists.ocaml.org/pipermail/infrastructure/2013-February/000194.html).  
Amir will keep people updated about progress via updates to the 
[OCL website](../projects/infrastructure.html#output-web-design-content), 
[Infrastructure mailing list](http://lists.ocaml.org/pipermail/infrastructure/) and also by posting things to the 
[OCaml.org Github wiki](https://github.com/ocaml/ocaml.org/wiki).  The 
current stage of work involves thinking of the types of pages OCaml.org 
requires, in order to refine the templates we need.  As part of this, we 
also commissioned a new logo for OCaml and although it's still under 
development, you can see the latest draft on the 
[OCaml.org wiki](https://github.com/ocaml/ocaml.org/wiki/Draft-OCaml-Logos).
  Please send any feedback directly to Amir.

The Real World OCaml book website was released as a 
[limited alpha](http://www.realworldocaml.org) earlier in the month, with 
the aim of getting early feedback and comments. Each paragraph of the online 
book has commenting functionality, using Github issues as a backend.  This 
means that each comment made on the book website creates a new issue on 
Github, which authors/commenters can track and discuss before editing the 
content.  So far there have been over 250 comments on the alpha, with half 
them being dealt with already.

A new EU project also kicked-off, called Trilogy 2, which builds on the 
previous, award-winning work from the original Trilogy project.  This is 
especially relevant for OCaml Labs as OnApp (a member of Trilogy 2), will be 
providing 
[Cloud Infrastructure for ocaml.org](http://lists.ocaml.org/pipermail/infrastructure/2013-February/000198.html).  We look forward to 
seeing this develop.

### Systems research

Mirage was formally proposed as an 
[incubated Xen.org project](../projects/mirage.html#output-xen-incubate-meeting) and the proposal was put forward for 
[community review](http://wiki.xen.org/wiki/Mirage_Incubation_Project_Proposal). There were many positive 
comments on the Xen mailing lists (along the lines of 
["Mirage is cool stuff"](http://lists.xen.org/archives/html/xen-devel/2013-01/msg01084.html)) and voting is currently underway by eligible members of 
the Xen community.  Assuming a positive outcome, incubation would give the 
Mirage project greater visibility and access to resources.  This would 
accelerate progress towards an alpha release in Q1/Q2 this year.  In 
addition to this, a proposal for an 
[OSCON talk](http://www.oscon.com/oscon2013) was also submitted and the camera-ready version of the ASPLOS paper is 
[now available](http://anil.recoil.org/papers/2013-asplos-mirage.pdf).  

A related research topic where Mirage could be useful is in embedded systems 
and the Internet of Things.  One specific use case is the 
[Illuminate Project](../projects/illuminate.html), where Mirage can be used 
to create appliances running on the ARM microcontrollers alongside an LED 
lighting network.  Such a lighting system is now deployed in large parts of 
the Computer Laboratory and will form an excellent test-bed to explore these 
ideas further.

Signpost is also achieving greater outreach with 
[Jon Crowcroft](../people/jcrowcroft.html) discussing such technologies at a 
meeting in Dagstul on [Decentralized Systems for Privacy Preservation](http://www.dagstuhl.de/en/program/calendar/semhp/?semnr=13062).  

### Compiler projects

Several mailing lists are in progress for various community-driven projects.
The first of these is a working group on the future of syntax extensions in 
OCaml, beyond camlp4 (
[wg-camlp4](http://lists.ocaml.org/pipermail/wg-camlp4)).  This group is 
chaired by [Alain Frisch](http://alain.frisch.fr) and Leo White and has 
generated a great deal of discussion in the last two weeks.  Leo is 
summarising his thoughts in a series of [blog posts](http://www.lpw25.net) 
as he goes.

Further working groups on parallelism in OCaml and build systems are under 
discussion and will be announced in due course.  


### One more thing ... (actually three)

As well as all the research and development activity we've also been 
recruiting.  We've had several rounds of interviews and made a number of 
offers so hopefully we'll be announcing new members of the OCaml Labs team 
in the coming months.  In addition, we'd also like to mention that Leo 
successfully defended his PhD Thesis in January.  Finally, we'd like to 
welcome a new honorary member of OCaml Labs, Nathan Scott, born on 30th 
January.  Congratulations Dave!
