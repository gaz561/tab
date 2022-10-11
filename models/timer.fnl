(local util (require :util))
(util.clone-table
 (util.load-file :models/thing)
 {:name "Timer"
  :behaviors [:timer]
  :events []
  :count 0
  :tick-rate 0.2})
