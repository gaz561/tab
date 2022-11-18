;;;; animation system behavior

(local tab (require :tab))

(local fennel (require :fennel))

(fn start [noisemaker]
  (tab.log :info (.. "Starting " (noisemaker:fname)))
  (set noisemaker.noisey-things
       (tab.filter-things
        noisemaker.dimension.things
        (fn [thing] (. thing :noises))))
  (tab.log :info (.. "Started " (noisemaker:fname)
                     " with " (length noisemaker.noisey-things)
                     " noisey things.")))

(fn tick-noises [noisemaker]
  "Start the ANIMATION system: filter the system's dimension's things by those with an animations list, and then call each specified method in that list on the thing."
  (each [_ thing (pairs noisemaker.noisey-things)]
    (each [_ noise (pairs thing.noises)]
      (let [chance (if (= (type noise) :table)
                     (. noise 1)
                     1)
            sound (if (= (type noise) :table)
                      (. noise 2)
                      noise)]
        (when (<= (math.random 0 100) chance)
          (when (. thing :contents)
            (each [_ item (pairs thing.contents)]
              (when (. item :message)
                (item:message sound))))
          (when (. thing :location)
            (each [_ item (pairs thing.location.contents)]
              (when (. item :message)
                (item:message sound))))))))
  (noisemaker.dimension.timer:schedule
   (partial noisemaker.tick-noises noisemaker)
   5))

{: start : tick-noises}
