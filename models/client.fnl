(local util (require :util))
(util.merge-models
 (util.load-file :models/thing)
 {:name :Anonymouse
  :behaviors [:client]
  :buffer ""
  :size 0})
