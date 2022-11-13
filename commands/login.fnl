;;;; login command

(fn [client input]
    (let [(name pass) (input:match "([^ ]+) ?(.*)")
          user (client.engine.users:find-user name)]
      (if user
          (if (= user.password pass)
              (client:login user)
              (client:message "Invalid password."))
          (client:message "Invalid user-name."))))
