(local util (require :util))
(util.clone-table
 (util.load-file :models/thing)
 {:name :Anonymouse
  :behaviors [:client]
  :buffer ""
  :size 0})
