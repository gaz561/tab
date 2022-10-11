(local util (require :util))
(util.clone-table
 (util.load-file :models/thing)
 {:name :area
  :description "This is an area"
  :behaviors [:area]
  :contents []
  :exits {}})
