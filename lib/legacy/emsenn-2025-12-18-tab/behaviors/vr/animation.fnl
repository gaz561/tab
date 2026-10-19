;;;; animation system behavior

(local tab (require :tab))

(fn start [animation]
  "Start the ANIMATION system: filter the system's dimension's things by those with an animations list, and then call each specified method in that list on the thing."
  (let [animate-things (tab.filter-things
                        animation.dimension.things
                        (fn [thing] (when (or (. thing :animation)
                                              (. thing :animations))
                                      thing)))]
    (tab.log :debug (.. (animation:fname) " found " (length animate-things)
                        " animate things when searching "
                        animation.grammar.pronouns.determiner
                        " dimension's things."))
    (each [_ thing (pairs animate-things)]
      (tab.log :debug (.. "Processing the animations for " (thing:fname)))
      (when thing.animation
        (when (not thing.animations) (set thing.animations []))
        (table.insert thing.animations thing.animation)
        (set thing.animation nil))
      (tab.log :debug (.. (thing:fname) " has " (length thing.animations)
                          " animations"))
      (each [_ animation (pairs thing.animations)]
        (if (. thing animation)
            (thing.dimension.timer:schedule
             (partial (. thing animation) thing))
            (tab.log :warning "Failed to trigger " animation
                     " for " (thing:fname) "; doesn't have that method."))))))


{: start}
