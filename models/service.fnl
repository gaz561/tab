(local util (require :util))
(util.merge-models
 (util.load-file :models/thing)
 {:name "TABby service"
  :grammar {:article :a}})
