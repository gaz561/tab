;;;; MUDSocket server model
;; ../../behaviors/mud/server.fnl
{:name "MUD server"
 :base :sys/basic
 :behaviors [:mud/server]
 :description "A command-and-response text interface for interacting with Tabby."
 :port 4242
 :timeout 0.001
 :clients []}
