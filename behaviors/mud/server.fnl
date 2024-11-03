;;;; MUDSocket server behaviors

(local tab (require :tab))
(local socket (require :socket))
(local fennel (require :fennel))

(local mud-server-behaviors {})

(fn mud-server-behaviors.accept-connection [server connection]
  (tab.log :debug (.. (server:fname) " accepting new connection"))
  (connection:settimeout server.timeout)
  (let [client (tab.make-thing server.mud-client-model
                               {: connection : server
                                :dimension server.dimension})]
    (table.insert server.clients client)
    (client:message
     (.. "Your connection to " (server:fname) " has been accepted.\n"
         (server:describe) "\n"
         (server.dimension:describe) "\n"))
    (client:parse "help")
    (when (and client.dimension.map
               client.dimension.map.start-area)
      (client:move
       (client.dimension.map:find-area client.dimension.map.start-area)))
    (set client.input-ready? true)))

(fn mud-server-behaviors.disconnect-client [server client]
  (tab.log :info (.. (server:fname) " disconnecting " (client:fname)))
  (client:message (.. "Disconnecting you now; goodbye!"))
  (client.connection:close)
  (tab.remove-value server.clients client))

(fn mud-server-behaviors.load [server dimension]
  (tab.log :debug (.. "Loading " server.name))
  (set server.dimension dimension)
  (set server.loaded true)
  (tab.log :debug (.. "Loaded " server.name)))

(fn mud-server-behaviors.start [server]
  (if server.loaded
      (do
        (local port (or server.port 4242))
        (tab.log :debug (.. "Starting " server.name
                                      " on port " port))
        (set server.socket (assert (socket.bind "0.0.0.0" port)))
        (server.socket:settimeout (or server.timeout 0.001))
        (server.dimension.timer:schedule
          (partial server.tick server true))
        (tab.log :info (.. "Started " server.name
                                     " on port " port)))
      (tab.log :error (.. "Failed to start " server.name
                                    "; load it first"))))

(fn mud-server-behaviors.tick [server ?repeat]
  (tab.log :spam "Beginning mud server tick.")
  (let [new-conn (server.socket:accept)]
    (when new-conn
      (server:accept-connection new-conn)))
  (each [_ client (pairs server.clients)]
    (var inputted? nil)
    (match (client.connection:receive)
      (_ "timeout") nil
      (_ err) (server:disconnect-client client err)
      input (do (client:parse input)
                (set client.input-ready? true)))
    (when (not (= (length client.buffer) 0))
      ;; strip extra newlines from the end of output here? seems better than trying to avoid them accruing lol
      (client.connection:send
       (.. client.buffer (if client.input-ready? "\n> " "")))
      (set client.buffer "")
       (set client.input-ready? nil)))
  (when ?repeat
    (server.dimension.timer:schedule
     (partial server.tick server true))))

mud-server-behaviors
