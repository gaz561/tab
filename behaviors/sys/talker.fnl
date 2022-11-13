(local talker-behaviors {})

(fn talker-behaviors.load [talker engine]
  (set talker.engine engine))

(fn talker-behaviors.receive-message [talker client channel message]
  (each [_ listener (pairs talker.engine.server.clients)]
    (listener:message
     (.. "[" channel "] " client.name ": " message))))

talker-behaviors
