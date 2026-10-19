;;;; quit command

(fn quit [client input]
  (client:message
   (.. "Quitting now."))
  (client.dimension.timer:schedule
   (partial client.server.disconnect-client
            client.server client)))
