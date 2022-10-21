(local util (require :util))
(util.merge-models
 (util.load-file :models/thing)
 {:name "MarMUD"
  :description "This is the MarMUD server, a command-and-reponse text interface for Tabby, a computer system developed by and for the Groundhog Autonomous Zone."
  :behaviors [:server]
  :port 4242
  :timeout 0.001
  :clients []})
