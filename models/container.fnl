(let [util (require :util)]
  (util.merge-models
   (util.load-file :models/thing)
   {:name :container
    :grammar {:article :a}
    :description "This is a container, a thing that can hold other things."
    :behaviors [:container]
    :contents []}))
