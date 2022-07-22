(local util (require :util))
(local plants {:catalog {}})

(fn plants.load [?folder]
  (util.load-folder (or ?folder :plants)))

plants
