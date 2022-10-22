(local util (require :util))
{:chat
  (fn [client channel message]
    (client.engine.talker:receive-message client channel message))
  :login
  (fn [client user]
    (client:message (.. "Logging you in as " user.id))
    (set client.user user)
    (set client.size 3)
    (set client.name (or user.name user.id))
    (each [relation relations (pairs user.relationships)]
      (local mod (. client.engine relation))
      (each [_ relationship (pairs relations)]
        (: mod (.. :setup- relationship) client)))
    (tset client.user.history (os.time) {:event :login})
    (client.engine.users:save-user client.user)
    (tset client.commands :login nil))
  :look
  (fn [client thing]
    (client:message (.. "You look at " (thing:fname)))
    (local A (util.make-string-appender "\n"))
    (when thing.name (A thing.name))
    (when thing.description (A (.. "  " thing.description)))
    (when thing.contents
      (let [content-listing (util.quibble-strings
                             (icollect [_ item (pairs thing.contents)]
                               (when (and item.name item.size (> item.size 0))
                                 item.name)))]
        (when content-listing (A (.. "Contents: " content-listing)))))
    (when thing.exits
      (A (.. "Exits: "
             (util.quibble-strings (util.collect-keys thing.exits true)))))
    (if (not (= (A) ""))
        (client:message (A))
        (client:message (.. "Cannot see " (or thing.name "the thing" :.)))))
  :parser
  (fn [client input]
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
  :message
  (fn [client message]
    (set client.buffer (.. client.buffer message "\n")))
  :move
  (fn [client area]
    (client:message (.. "You move to " (area:fname)))
    (area:receive-object client))
  :parse
  (fn [client input]
    (client.engine:log :debug (.. "Parsing line from " client.name
                                  ": " input))
    (client:parser input))
  :commands
  {:chat
   (fn [client input]
     (client:chat :one input))
   :commands
   (fn [client input]
     (client:message
      (.. "You have access to the following commands: "
          (util.quibble-strings
           (icollect [command func (pairs client.commands)]
             command)
           true))))
   :help
   (fn [client input]
     (match input
       (where (or nil "")) (client:message "You are a client, a 'person' within the virtual reality created by TABby. You interact with the reality by inputting commands, which the computer interprets, reacts to, and then sends you back some sort of response. You can see a list of your available commands by inputting `commands` and pressing ENTER. To see a list of topics you can receive help with, try `help list`")
       "list" (client:message "You can receive help on the various topics: mud, tabby")
       "mud" (client:message "'MUD' stands for Multi-User Dimension, and is the name for this kind of computer software - a server where clients connect and send text commands and receive text responses.")
       "okaga" (client:message "The Okaga is a fake starship that serves as a space 'between' other virtualized areas.")
       "tabby" (client:message "TABby is the name of our MUD engine, the code that makes our MUD work. It stands for Things with Attributes and Behaviors.")
       _ (client:message "There's no help for that topic, sorry.")))
   :login
   (fn [client input]
     (let [(name pass) (input:match "([^ ]+) ?(.*)")
           user (client.engine.users:find-user name)]
       (if user
           (if (= user.password pass)
               (client:login user)
               (client:message "Invalid password."))
           (client:message "Invalid user-name."))))
   :look
   (fn [client input]
     (if (not (= input ""))
         (let [matches []]
           (client:message (.. "You attempt to look at '" input :.))
           (when client.location (client.location:search-area input matches))
           (if (= (length matches) 1)
               (client:look (. matches 1))
               (if (> (length matches) 1)
                   (client:message "Multiple matches.")
                   (client:message "No match."))))
         (if client.location
             (do
               (client:message "You look around the area.")
               (client:look client.location))
             (client:message "You aren't anyplace."))))
   :move
   (fn [client input]
     (if (not (= input ""))
         (let [exit (. client.location.exits input)]
           (if exit
               (do
                 (client:move (client.engine.map:find-area exit))
                 (client:look client.location))
               (client:message "Invalid exit.")))
         (client:message "Include exit name.")))
   :quit
   (fn [client input]
     (client:message
      (.. "Quitting now."))
     (client.engine.timer:schedule
      (partial client.server.disconnect-client
               client.server client)))
   :who
   (fn [client input]
     (client:message
      (.. "There are " (length client.server.clients)
          " clients currently connected.")))
   :whoami
   (fn [client input]
     (client:message
      (.. "Your name is " (or client.name :unknown) :.)))}}
