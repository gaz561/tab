(local util (require :util))

(util.merge-models
 (util.load-file :models/thing)
 {:name "Project"
 :description "This a project. It's mostly made of a list of tasks."
 :tasks []}
