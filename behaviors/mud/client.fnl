;;;; mudsocket client behaviors

(local tab (require :tab))

(local client-behaviors {})

(fn client-behaviors.chat [client channel message]
  (client.engine.talker:receive-message client channel message))
(fn client-behaviors.login [client user]
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
(fn client-behaviors.look [client thing]
  (client:message (.. "You look at " (thing:fname)))
  (local A (tab.make-string-appender "\n"))
  (A (thing:fname))
  (A (.. "  " (thing:describe)))
  (when thing.contents
    (let [content-listing (tab.quibble-strings
                           (icollect [_ item (pairs thing.contents)]
                             (when item.notable (item:fname))))]
      (when content-listing (A (.. "Contents: " content-listing)))))
  (when thing.exits
    (A (.. "Exits: "
           (tab.quibble-strings (tab.collect-keys thing.exits true)))))
  (if (not (= (A) ""))
      (client:message (A))
      (client:message (.. "Cannot see " (or thing.name "the thing" :.)))))
(fn client-behaviors.parser [client input]
  (let [(command line) (input:match "([^ ]+) ?(.*)")]
    (if (tab.find-element client.command-list command)
        ((tab.lookup-command command) client line)
        (client:message
         (.. "Invalid command. Input `commands` and press ENTER to "
             "see your available commands.")))))
(fn client-behaviors.message [client message]
  (set client.buffer (.. client.buffer message "\n")))
(fn client-behaviors.move [client area]
  (client:message (.. "You move to " (area:fname)))
  (area:receive-object client))
(fn client-behaviors.parse [client input]
  (tab.log :debug (.. "Parsing line from " client.name
                                ": " input))
  (client:parser input))

client-behaviors
