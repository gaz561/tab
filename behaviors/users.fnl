(local util (require :util))

{  :load
  (fn [users engine]
    (engine:log :debug (.. "Loading " users.name))
    (set users.engine engine)
    (set users.user-data (util.load-folder users.data-folder))
    (users.engine:log :debug (.. "Loaded " users.name
                                 " with "
                                 (length (util.collect-keys users.user-data))
                                 " user accounts.")))
  :make-user
  (fn [users id]
    (let [pass (util.make-id)
          user {: id
              :passcode pass
                :relationships {}
                :history [{:event "created" :time (os.time)}]}]
      (users:save-user user)
      user))
  :save-user
  (fn [users user]
    (util.save-file user (.. users.data-folder :/ user.id)))
  :find-user
  (fn [users id]
    (local matches [])
    (each [uid user (pairs users.user-data)]
      (when (= uid id)
        (table.insert matches user)))
    (. matches 1))
  :setup-admin
  (fn [users client]
    (tset client.commands :register-user users.commands.register-user))
  :commands
  {:register-user
   (fn [client input]
     (if (client.engine.users:find-user input)
         (client:message "Failed to register new user; user exists with that id.")
         (let [new-user (client.engine.users:make-user input)]
           (client:message (.. "Registered new user, their passcode is "
                               new-user.passcode)))))}}
