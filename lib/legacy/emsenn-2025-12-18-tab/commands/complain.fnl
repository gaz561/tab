;;;; commands command

(local tab (require :tab))

(fn complain [client input]
  (client:message
   (.. "This command *will* be to report issues with the MUD. "
       "For now, it does nothing. Sorry!")))
