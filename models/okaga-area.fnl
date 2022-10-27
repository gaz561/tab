(local util (require :util))
(util.merge-models
 (util.load-file :models/area)
 {:name "random room of the Okaga starship"
  :grammar {:article :a}
  :description "This is a random room aboard the Okaga."
  :contents []
  :exits {}})
