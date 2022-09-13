(local mud (require :mud-server))
(mud:start)
(print "Started server on" mud.port)
(mud.timer:run)
