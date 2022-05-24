;;;; Groundhog Operating System
(local gos {:conf {:log-level :spam}
            :dep {:socket (require :socket)}
            :util {}})

(set gos.last-log-print 0)
(set gos.log-levels {:critical 1 :error 2
                     :warning 3 :info 4
                     :debug 5 :spam 6})
(fn gos.log [level message]
  (local time (os.time))
  (fn print-msg []
    (when (not (= gos.last-log-print time))
      (set gos.last-log-print time)
      (print (gos.util.render-time time)))
    (print (.. level
               (if (= level :error) ":    "
                   (if (= level :warning) ":  "
                       (if (= level :info) ":     "
                           (if (= level :debug) ":    "
                               (if (= level :spam) ":     "
                                   ": ")))))
               message)))
  (when (>= (. gos.log-levels gos.conf.log-level)
            (. gos.log-levels level))
    (print-msg)))


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

(lambda gos.util.render-time [time]
  (os.date "%Y%m%d:%H%M%S" time))

(set gos.timer {:count 0 :rate 0.2 :events []})

(fn gos.timer.run [timer]
  (timer:tick)
  (gos.dep.socket.select nil nil (or timer.rate 0.2))
  (timer:run))
(fn gos.timer.schedule [timer event]
  (gos.log :debug "Scheduling an event.")
  (table.insert timer.events event))
(fn gos.timer.tick [timer]
  (set timer.count (+ timer.count 1))
  (gos.log :debug (.. "Processing tick #" timer.count))
  (let [current-events timer.events]
    (gos.log :debug (.. "There are " (length current-events)
                        " events this tick."))
    (set timer.events [])
    (each [_ event (pairs current-events)] (event))
    (gos.log :debug (.. "Finished processing tick #" timer.count))))

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
  (gos.log :debug (.. "Parsing the following line from client "
                      (or client.name :unknown) ": "
                      input))
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
  (gos.log :debug "Accepting a new connection.")
  (connection:settimeout server.timeout)
  (let [client (gos.util.clone-table gos.client)]
    (set client.connection connection)
    (set client.server server)
    (table.insert server.clients client)
    (server:send-new-client-message client)))
(fn gos.server.disconnect-client [server client]
  (gos.log :debug (.. "Disconnecting client " (or client.name :unknown)))
  (each [key value (pairs server.clients)]
    (when (= value client)
      (table.remove server.clients key))))
(fn gos.server.send-new-client-message [server client]
  (client:message
   (.. "You have connected to " (or server.name "a server") ".\n"
       "Interact by inputting commands and pressing ENTER.\n"
       "Use `commands` to see a list of your available commands.")))
(fn gos.server.start [server]
  (gos.log :debug "Starting the MUD server.")
  (set server.socket
       (assert (gos.dep.socket.bind "0.0.0.0"
                                    (or server.port 4242))))
  (server.socket:settimeout (or server.timeout 0.001))
  (gos.timer:schedule
   (partial server.tick server true)))
(fn gos.server.tick [server ?repeat]
  (gos.log :debug "Ticking the MUD server.")
  (let [new-conn (server.socket:accept)]
    (when new-conn (server:accept-connection new-conn)))
  (each [_ client (pairs server.clients)]
    (match (client.connection:receive)
      (_ "timeout") nil
      (_ err) (server:disconnect-client client)
      input (client:parse input)))
  (when ?repeat
    (gos.timer:schedule
     (partial server.tick server true))))

gos
