(local util (require :util))

(util.merge-models
 (util.load-file :models/thing)
 {:name "Fortunes"
  :description "This is a service for storing and retrieving 'fortunes', short phrases that can be used to say, put inside a cookie, or add to the end of a newsletter."
  :behaviors [:fortunes]
  :data-file :data/fortunes
  :fortunes []})
