;;;; make-user command

(local tab (require :tab))

(fn [client input]
  (if (> (length input) 0)
      (let [user (client.dimension.users:find-user input)]
        (if user
            (client:message "User with that ID exists.")
            (do
              (client.dimension.users:make-user input)
              (let [user (client.dimension.users:find-user input)]
                (client:message (.. "New user account made with passcode "
                                    user.user-passcode))))))
      (client:message "Syntax: make-user <id>")))
