;;;; chat command

(fn chat [client input]
  (match input
    "" (client:message "Syntax: chat <message>")
    _ (client:chat :one input)))
