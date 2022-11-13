;;;; who command

(fn who [client input]
  (client:message
   (.. "There are " (length client.server.clients)
       " clients currently connected.")))
