(local util (require :util))
(local area-model (util.load-file :models/area))

(util.merge-models
 (util.load-file :models/thing)
 {:name "Map"
  :description "This is the MUD map."
  :behaviors [:map]
  :data-folder :data/map
  :start-area :okaga-air-ducts
  :areas {}})
