;;;; login command

(fn [client input]
    (let [(name pass) (input:match "([^ ]+) ?(.*)")
          user (client.dimension.users:find-user name)]
      (if user
          (if (= user.user-passcode pass)
              (client:login user)
              (client:message "Invalid password."))
          (client:message "Invalid user-name."))))
