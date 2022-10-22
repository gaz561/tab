(local util (require :util))

{:load
 (fn [talker engine]
   (set talker.engine engine))
 :receive-message
 (fn [talker client channel message]
   (each [_ listener (pairs talker.engine.server.clients)]
     (listener:message
      (.. "[" channel "] " client.name ": " message))))}
