;;;; users MUD client attributes

(local tab (require :tab))

(fn login [client user]
  (tab.log :debug (.. "Logging in a client as " user.user-id))
  (client:message (.. "Logging you in as " user.user-id))
  (set client.user user)
  (set client.name (or user.name user.user-id))
  (set client.grammar.article "")
  (table.insert client.user.history {:time (os.time)
                                     :event "Logged in"})
  (set client.command-list (tab.remove-value client.command-list :login))
  (when user.system-relationships
    (tab.log :debug "Setting up clients' system-relationships")
    (each [relation relations (pairs user.system-relationships)]
      (local system (. client.dimension relation))
      (if system
          (each [_ relationship (pairs relations)]
            (let [setup-func (. system (.. :setup- relationship))]
              (if setup-func
                  (setup-func system client)
                  (tab.log :warning "Failed to setup client's "
                           relationship " with the " relation
                           " system"))))
          (tab.log :warning "Failed to setup client with " relation
                   " system; not a part of the clients' dimension.")))))

 {: login}
