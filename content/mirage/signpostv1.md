The defacto architecture of today's Internet services all but removes users'
ability to establish inter-device connectivity except through centrally
controlled "cloud" services. Whilst undeniably convenient, the centralised data
silos of the cloud remain opaque and an attractive target for attackers. A
range of mechanisms exist for establishing secure peer-to-peer connections, but
are inaccessible to most users due to the intricacy of their network
configuration assumptions. Users effectively give up security, privacy and
(when peers are both on the same LAN) low-latency simply to get something
useable.  We observe that existing Internet technologies suffice to support
efficient, secure and decentralized communication between users, even in the
face of the extreme diversity of edge connectivity and middlebox intervention.

Signpost is a Mirage-compatible system that explicitly represents individual
users in a network-wide architecture.  Signpost DNS servers create a “personal
CDN” for individuals, securely orchestrating the many different available
techniques for establishing device-to-device connectivity to automatically
select the most appropriate.  A DNS API gives application compatibility, and
DNSSEC and DNSCurve bootstraps secure connectivity
