;;;; made MUD

(local tab (require :tab))

(local marmud (tab.make-model :sys/dimension
                              {:name "MarMUD"
                               :description "MarMUD is a networked computer made by and for the Groundhog Autonomous Zone."
                               :conf (require :conf)
                               :systems {:animation :sys/animation
                                         :map :sys/mapper
                                         :mudserver :mud/server
                                         :noisemaker :sys/noisemaker
                                         :timer :sys/timer
                                         :webserver :web/server}}))

(set marmud.conf.mud-client-model :marmud/mud-client)

(set marmud.conf.area-list
     [:okaga/bridge
      :okaga/galley
      :okaga/immersim
      :okaga/library
      :okaga/passageways])
(set marmud.conf.start-area :okaga/bridge)

marmud
