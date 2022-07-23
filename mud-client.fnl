(local util (require :util))
(local users (require :users))
(local client {:name :Anonymouse
               :buffer ""
               :commands {}})

(fn client.parser [client input]
  (let [(command line) (input:match "([^ ]+) ?(.*)")]
    (var matched? nil)
    (each [key func (pairs client.commands)]
      (when (= command key)
        (set matched? true)
        (func client line)))
    (when (not matched?)
      (client:message
       (.. "Invalid command. Input `commands` and press ENTER to "
           "see your available commands.")))))
(fn client.login [client user]
  (client:message (.. "Logging you in as user " user.id))
  (set client.user user)
  (set client.name user.id)
  (each [relation relations (pairs user.relationships)]
    (each [_ relationship (pairs relations)]
      (local module (require relation))
      (print :AHHH)
      (print ((. (require :fennel) :view) module))
      ((. module (.. :setup- relationship)) client)))
  (tset client.commands :login nil))
(fn client.message [client message]
  (set client.buffer (.. client.buffer message "\n")))
(fn client.parse [client input]
  (client:parser input))
(fn client.commands.commands [client input]
  (client:message
   (.. "You have access to the following commands: "
       (util.quibble-strings
        (icollect [command func (pairs client.commands)]
          command)
        true))))
(fn client.commands.login [client input]
  (let [(name pass) (input:match "([^ ]+) ?(.*)")
        user (users.find-user name)]
    (if user
        (if (= user.password pass)
            (client.login client user)
            (client:message "Invalid password"))
        (client:message "Invalid user-name."))))
(fn client.commands.quit [client input]
  (client:message
   (.. "Goodbye!"))
  (client.server.timer:schedule
   (partial client.server.disconnect-client
            client.server client)))
(fn client.commands.who [client input]
  (client:message
   (.. "There are " (length client.server.clients)
       " clients currently connected.")))
(fn client.commands.whoami [client input]
  (client:message
   (.. "Your name is " (or client.name :unknown) ".")))

client
