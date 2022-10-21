(local util (require :util))

(util.merge-models
 (util.load-file :models/thing)
 {:name "MUD engine"
  :description "This is a MUD engine"
  :behaviors [:engine]
  :grammar {:article :a}
  :services [:fortunes :map :server :users :timer]
  :log-level :spam
  :things []
  :log-levels {:critical 1 :error 2
               :warning 3 :info 4
               :debug 5 :spam 6}})
