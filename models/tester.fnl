(local util (require :util))
(util.clone-table
 (util.load-file :models/thing)
 {:name :tester
  :behaviors [:tester]})
