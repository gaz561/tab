(local util (require :util))
(local area-mod (util.load-file :models/area))

{:load
 (fn [pm engine]
   (engine:log :debug (.. "Loading " pm.name))
   (set pm.engine engine)
   (set pm.beliefs (util.load-file pm.belief-file []))
   (set pm.goals (util.load-file pm.goal-file []))
   (set pm.projects (util.load-folder pm.project-folder))
   (pm.engine:log :debug (.. "Loaded " pm.name
                             " with "
                             (length (util.collect-keys pm.beliefs))
                             " beliefs, "
                             (length (util.collect-keys pm.goals))
                             " goals, and "
                             (length (util.collect-keys pm.projects))
                             " projects.")))}
