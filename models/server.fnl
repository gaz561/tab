(local util (require :util))
(util.clone-table
 (util.load-file :models/thing)
 {:name "MUD Server"
  :behaviors [:server]
  :port 4242
  :timeout 0.001
  :clients []})
