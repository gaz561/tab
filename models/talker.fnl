(local util (require :util))
(util.merge-models
 (util.load-file :models/thing)
 {:name "Talker"
  :description "This is the Talker service for TABby. It's what lets clients talk to each other."
  :channels [:one :two]
  :behaviors [:talker]})
