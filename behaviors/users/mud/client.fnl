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
  (table.insert client.command-list :finger))

 {: login}
