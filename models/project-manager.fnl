(local util (require :util))
(util.merge-models
 (util.load-file :models/service)
 {:name "Project Manager Service"
  :grammar {:article :the :pronouns :it}
  :description "It handles tasks and goals and such."
  :behaviors [:project-manager]
  :belief-file :data/beliefs
  :goal-file :data/goals
  :project-folder :data/projects
  :goals []
  :projects []})
