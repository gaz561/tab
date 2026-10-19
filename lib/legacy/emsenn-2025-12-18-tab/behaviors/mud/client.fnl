;;;; mudsocket client behaviors

(local tab (require :tab))

(local client-behaviors {})

(fn client-behaviors.chat [client channel message]
  (client.dimension.talker:receive-message client channel message))
(fn client-behaviors.parser [client input]
  (let [(command line) (input:match "([^ ]+) ?(.*)")]
    (if (tab.find-element client.command-list command)
        ((tab.lookup-command command) client line)
        (client:message
         (.. "Invalid command. Input `commands` and press ENTER to "
             "see your available commands.")))))
(fn client-behaviors.message [client message]
  (set client.buffer (.. client.buffer message "\n")))
(fn client-behaviors.parse [client input]
  (tab.log :debug (.. "Parsing line from " client.name
                                ": " input))
  (client:parser input))

client-behaviors
