(local util (require :util))
(local socket (require :socket))

{:accept-connection
 (fn [server connection]
   (connection:settimeout server.timeout)
   (let [client (server.engine:make-thing
                 :client
                 {: connection : server
                  :engine server.engine})]
     (table.insert server.clients client)
      (when server.engine.map.start-area
        (client:move (server.engine.map:find-area
                      server.engine.map.start-area)))
      (server:greet-client client)))
 :disconnect-client
 (fn [server client]
   (client:message (.. "Disconnecting you now; goodbye!"))
   (client.connection:close)
   (util.remove-value server.clients client))
 :greet-client
 (fn [server client]
   (client:message
    (.. "You've connected to " (or server.engine.name "a MUD server")
        ".
MarMUD is an interactive virtual environment created by and for the Groundhog Autonomous Zone. You're connected as a guest account. Interact by inputting commands and pressing ENTER.

Use `commands` to see a list of your available commands.
  (If this is your first time, try `help`)")))
 :load
 (fn [server engine]
   (engine:log :debug (.. "Loading " server.name))
   (set server.engine engine)
   (set server.loaded true)
   (engine:log :debug (.. "Loaded " server.name)))
 :start
 (fn [server]
   (server.engine:log :debug (.. "Starting " server.name))
   (if server.loaded
       (do
         (local port (or server.engine.conf.mud-port
                         (or server.port 4242)))
         (server.engine:log :debug (.. "Starting " server.name
                                       " on port " port))
         (set server.socket (assert (socket.bind "0.0.0.0" port)))
         (server.socket:settimeout (or server.timeout 0.001))
         (server.engine.timer:schedule
          (partial server.tick server true))
         (server.engine:log :info (.. "Started " server.name
                                      " on port " port)))
       (server.engine:log :error (.. "Failed to start " server.name
                                     "; load it first"))))
 :tick
 (fn [server ?repeat]
   (let [new-conn (server.socket:accept)]
     (when new-conn
       (server.engine:log :debug (.. "Accepting new connection."))
       (server:accept-connection new-conn)))
   (each [_ client (pairs server.clients)]
     (var inputted? nil)
     (match (client.connection:receive)
       (_ "timeout") nil
       (_ err) (server:disconnect-client client err)
       input (do (client:parse input)
                 (set inputted? true)))
     (when (not (= (length client.buffer) 0))
       (server.engine:log :debug (.. "Sending message to "
                                     client.name ": "
                                     (: client.buffer :sub 0 32)
                                     (if (> (length client.buffer) 12)
                                         "..."
                                         "")))
       (client.connection:send
        (.. client.buffer (if inputted? "\n> " "")))
       (set client.buffer "")))
   (when ?repeat
     (server.engine.timer:schedule
      (partial server.tick server true))))}
