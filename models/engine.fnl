(local util (require :util))

(util.merge-models
 (util.load-file :models/thing)
 {:name "TABby"
  :description "TABby, short for Things with Attributes and Behaviors, is a computer system for virtualizing various types of information. If that doesn't mean anything, that's fine."
  :behaviors [:engine]
  :grammar {:article :a}
  :services [:fortunes :map :project-manager :server :users :talker :timer]
  :log-level :spam
  :things []
  :log-levels {:critical 1 :error 2
               :warning 3 :info 4
               :debug 5 :spam 6}})
