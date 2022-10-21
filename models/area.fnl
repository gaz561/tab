(local util (require :util))
(util.merge-models
 (util.load-file :models/thing)
 {:name :area
  :description "This is an area"
  :contents []
  :exits {}})
