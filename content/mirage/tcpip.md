The TCP/IP stack in Mirage 1.0 was functional, but lacked support for modern
TCP extensions.  We have now extended the TCP stack to include more congestion
controllers, better ACK handling, a more compete state machine, and extensions
such as window scaling.  These all contribute to making Mirage 2.0 unikernels
more robust Internet servers.
