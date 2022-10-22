(local util (require :util))
(util.merge-models
 (util.load-file :models/thing)
 {:name "MarMUD"
  :grammar {:article :the}
  :description "A command-and-response text interface for TABby, a computer system developed by and for the Groundhog Autonomous Zone."
  :behaviors [:server]
  :port 4242
  :timeout 0.001
  :clients []})
