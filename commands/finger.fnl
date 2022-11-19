;;;; finger command

(local tab (require :tab))

(fn finger [client input]
  (if (> (length input) 0)
      (let [user (client.dimension.users:find-user input)]
        (if user
            (client:message
             (.. user.user-id "\n\n"
                 "Created on: " (tab.render-time (. (. user.history 1) :time))))
            (client:message "User not found.")))
      (client:message "Syntax: finger <user>")))
