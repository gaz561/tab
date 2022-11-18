(local tab (require :tab))

(fn ld [handler dimension]
  "Load the users in HANDLER's users-folder as the users system for DIMENSION."
  (if handler.users-folder
      (do
        (tab.log :debug "Loading " (handler:fname))
        (set handler.users (tab.load-folder (.. :attributes/ handler.users-folder)))
        (tab.log :info "Loaded " (handler:fname)
                 " with " (length (tab.collect-keys handler.users)) " users")
        (set handler.loaded? true))
      (tab.log :error "Failed to load " (handler:fname)
               "; handler lacks users-folder attribute")))

(fn find-user [handler id]
  (local matches [])
  (each [uid user (pairs handler.users)]
    (when (= uid id)
      (table.insert matches user)))
  (. matches 1))

(fn make-user [handler id]
 (if handler.loaded?
     (do
       (if (handler:find-user id)
           (tab.log :error "Failed to make new user "
                    id "; there's already a user with that ID")
           (let [new-user {:base :users/user
                           :user-id id
                           :name id
                           :history [{:time (os.time)
                                      :event "Created as user account"}]
                           :user-passcode (tab.make-id)}]
             (tab.save-file new-user (.. :attributes/
                                         handler.users-folder :/ id))
             (tab.log :debug "Saved new user " id " with passcode "
                      new-user.user-passcode)
             (tset handler.users id (tab.make-thing new-user)))))
     (tab.log :error "Can't make a user until the handler system has been loaded.")))



{:load ld
 : find-user : make-user}
