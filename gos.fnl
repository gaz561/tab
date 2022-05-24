;;;; Groundhog Operating System
(local gos {:dep {:socket (require :socket)}
            :util {}})

(fn gos.util.make-string-appender [?sep]
  "Return a function that holds a string and accepts one atctional argument (string or list of strings). If provided, the argument is appended to the held string, with SEP appended (to each one, if its a list of strings.)"
  (var o "")
  (lambda [?a]
    (lambda q [r]
      (set o (.. o r (or ?sep ""))) o)
    (if ?a
        (if (= (type ?a) :string)
              (q ?a)
              (each [_ v (pairs ?a)]
                (q v)))
        o)))

(fn gos.util.add-values [tab vals]
  (each [k v (pairs vals)]
    (tset tab k v))
  tab)

(fn gos.util.clone-table [tab ?new-values]
  (local clone {})
  (gos.util.add-values clone tab)
  (when ?new-values (gos.util.add-values clone ?new-values))
  clone)

(fn gos.util.quibble-strings [strings ?resort ?oxfordize]
  "Return the sequence of STRINGS separated with commas and the conjunction 'and'. ?OXFORDIZE is currently irrelevant; strings are oxfordized by defualt."
  (let [oxfordize (or ?oxfordize true)
        o (gos.util.make-string-appender)]
    (when ?resort (table.sort strings))
    (var join "")
    (for [count 1
          (length strings) 1]
      (if (= count (length strings))
          (set join "")
          (= count (- (length strings) 1))
          (set join
               (.. (if (and oxfordize
                            (> (length strings) 2))
                       ","
                       "")
                   " and "))
          (set join ", "))
      (o [(. strings count) join]))
    (o))) 

(set gos.timer {:count 0 :rate 0.2 :events []})

(fn gos.timer.run [timer]
  (timer:tick)
  (gos.dep.socket.select nil nil (or timer.rate 0.2))
  (timer:run))
(fn gos.timer.schedule [timer event]
  (table.insert timer.events event))
(fn gos.timer.tick [timer]
  (set timer.count (+ timer.count 1))
  (let [current-events timer.events]
    (set timer.events [])
    (each [_ event (pairs current-events)] (event))))

(set gos.client {:name :Anonymouse :commands {}})

(fn gos.client.parser [client input]
  (let [(command line) (input:match "([^ ]+) ?(.*)")]
    (var matched? nil)
    (each [key func (pairs client.commands)]
      (when (= command key)
        (set matched? true)
        (func client line)))
    (when (not matched?)
      (client:message
       (.. "Invalid command. Input `commands` and press ENTER to "
           "see your available commands.")))))
(fn gos.client.message [client message]
  (gos.timer:schedule
   (fn [] (client.connection:send (.. message "\n")))))
(fn gos.client.parse [client input]
  (client:parser input))
(fn gos.client.commands.commands [client input]
  (client:message
   (.. "You have access to the following commands: "
       (gos.util.quibble-strings
        (icollect [command func (pairs client.commands)]
          command)
        true))))
(fn gos.client.commands.who [client input]
  (client:message
   (.. "There are " (length client.server.clients)
       " clients currently connected.")))
(fn gos.client.commands.whoami [client input]
  (client:message
   (.. "Your name is " (or client.name :unknown) ".")))
                 

(set gos.server {:port 4242 :timeout 0.001 :clients []})

(fn gos.server.accept-connection [server connection]
  (connection:settimeout server.timeout)
  (let [client (gos.util.clone-table gos.client)]
    (set client.connection connection)
    (set client.server server)
    (table.insert server.clients client)
    (server:send-new-client-message client)))
(fn gos.server.disconnect-client [server client]
  (each [key value (pairs server.clients)]
    (when (= value client.connection)
      (table.remove server.clients key))))
(fn gos.server.send-new-client-message [server client]
  (client:message
   (.. "You have connected to " (or server.name "a server") ".\n"
       "Interact by inputting commands and pressing ENTER.\n"
       "Use `commands` to see a list of your available commands.")))
(fn gos.server.start [server]
  (set server.socket
       (assert (gos.dep.socket.bind "0.0.0.0"
                                    (or server.port 4242))))
  (server.socket:settimeout (or server.timeout 0.001))
  (gos.timer:schedule
   (partial server.tick server true)))
(fn gos.server.tick [server ?repeat]
  (let [new-conn (server.socket:accept)]
    (when new-conn (server:accept-connection new-conn)))
  (each [_ client (pairs server.clients)]
    (match (client.connection:receive)
      (nil msg) (server:disconnect-client client)
      input (client:parse input)))
  (when ?repeat
    (gos.timer:schedule
     (partial server.tick server true))))

gos
