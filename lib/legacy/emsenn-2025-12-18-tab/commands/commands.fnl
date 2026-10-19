;;;; commands command

(local tab (require :tab))

(fn commands [client input]
  (client:message
   (.. "You have access to the following commands: "
       (tab.quibble-strings client.command-list true))))
