;;; VR mobile behaviors

(local tab (require :tab))

(fn roam [object]
  (fn get-destination []
    (let [region-lock object.region-lock
          exit-keys (tab.collect-keys object.location.exits)
          destination (. object.location.exits
                         (. exit-keys (math.random
                                       (length exit-keys))))]
      (if (or (not region-lock)
              (= region-lock
                 (string.sub destination 1
                             (length region-lock))))
          destination
          (get-destination))))
  (let [roam-chance (or object.roam-chance 100)]
    (when (>= roam-chance (math.random 100))
      (let [dest-area (object.dimension.map:find-area
                       (get-destination))]
        (when dest-area (object:move dest-area)))))
  (object.dimension.timer:schedule
   (partial object.roam object)
   (or object.roam-frequency
       300)))

{: roam}
