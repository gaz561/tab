;;;; whoami command

(fn whoami [client input]
  (client:message
   (.. "Your name is " (or client.name :unknown) :.)))
