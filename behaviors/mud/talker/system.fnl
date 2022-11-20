;;;; MUD talker system behaviors

(fn receive-message [talker client channel message]
  (each [_ listener (pairs talker.dimension.mud-server.clients)]
    (listener:message
     (.. "[" channel "] " client.name ": " message))))

(fn setup-client [talker client]
  (table.insert client.command-list :chat))

{: receive-message
 : setup-client}
