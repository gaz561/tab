(local util (require :util))

(util.merge-models
 (util.load-file :models/thing)
 {:name "Task"
 :description "This is a thing to be done, usually as part of a project."})
