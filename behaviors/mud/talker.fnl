(fn receive-message [talker client channel message]
  (each [_ listener (pairs talker.dimension.mud-server.clients)]
    (listener:message
     (.. "[" channel "] " client.name ": " message))))

{: receive-message}
