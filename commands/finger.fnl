;;;; finger command

(local tab (require :tab))

(fn finger [client input]
  (if (> (length input) 0)
      (let [user (client.dimension.users:find-user input)]
        (if user
            (let [A (tab.make-string-appender "\n")]
              (A (.. (tab.underline user.user-id) "\n"))
              (A (.. "Created on: "
                     (tab.render-time (. (. user.history 1) :time))))
              (when (> (length (tab.collect-keys user.system-relationships)) 0)
                (A "System relationships:")
                (each [system relations (pairs user.system-relationships)]
                  (A (.. "  " system ": " (tab.quibble-strings relations)))))
              (client:message (A)))
            (client:message "User not found.")))
      (client:message "Syntax: finger <user>")))
