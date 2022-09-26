(local socket (require :socket))
(local util (require :util))
(local server {:timer (require :timer)
               :client (require :mud-client)
               :port 4242 :timeout 0.001 :clients []})

(fn server.accept-connection [server connection]
  (connection:settimeout server.timeout)
  (let [client (util.clone-table server.client)]
    (set client.commands (util.clone-table client.commands))
    (set client.connection connection)
    (set client.server server)
    (table.insert server.clients client)
    (server:send-new-client-message client)))
(fn server.disconnect-client [server client]
  (client.connection:close)
  (each [key value (pairs server.clients)]
    (when (= value client)
      (table.remove server.clients key))))
(fn server.send-new-client-message [server client]
  (client:message
   (.. "You have connected to " (or server.name "a server") ".\n"
       "Interact by inputting commands and pressing ENTER.\n"
       "Use `commands` to see a list of your available commands.") true)
  (set client.ready? true))
(fn server.start [server]
  (set server.socket
       (assert (socket.bind "0.0.0.0"
                                    (or server.port 4242))))
  (server.socket:settimeout (or server.timeout 0.001))
  (server.timer:schedule
   (partial server.tick server true)))
(fn server.tick [server ?repeat]
  (let [new-conn (server.socket:accept)]
    (when new-conn (server:accept-connection new-conn)))
  (each [_ client (pairs server.clients)]
    (match (client.connection:receive)
      (_ "timeout") nil
      (_ err) (server:disconnect-client client)
      input (do (client:parse input)
                (set client.ready? true)))
    (when (not (= (length client.buffer) 0))
      (client.connection:send client.buffer)
      (when client.ready?
        (client.connection:send "\n> "))
      (set client.buffer "")))
  (when ?repeat
    (server.timer:schedule
     (partial server.tick server true))))

server
