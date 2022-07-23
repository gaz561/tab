(local util (require :util))
(local users {:commands {}})
(fn users.read []
  (util.load :users {}))

(fn users.write [users]
  (util.save users :users))

(fn users.find-user [id]
  (local users (users.read))
  (local matches [])
  (each [uid user (pairs users)]
    (when (= uid id)
      (table.insert matches user)))
  (. matches 1))

(fn users.save-user [user]
  (local users (users.read))
  (tset users user.id user)
  (users.write users))

(fn users.make-user [id]
  (local pass (util.make-id))
  {: id
   :password pass
   :relationships {}
   :history [{:event "Created" :time (os.time)}]})

(fn users.modify-user-relationship [id other relation]
  (local user (users.find-user id))
  (when (not (. user.relationships other))
    (tset user.relationships other []))
  (table.insert (. user.relationships other) relation)
  (users.save-user user))

(fn users.find-user [id]
  (local users (users.read))
  (. users id))

(fn users.setup-admin [client]
  (tset client.commands :register-user users.commands.register-user))

(fn users.commands.register-user [client input]
  (if (users.find-user input)
      (client:message "Failed to register new user; user exists with that id.")
      (let [new-user (users.make-user input)]
        (users.save-user new-user)
        (client:message
         (.. "Saved new user; their password is " new-user.password)))))

users
