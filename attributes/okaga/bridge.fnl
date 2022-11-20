;;;; Okaga bridge model

{:name "bridge"
 :base :okaga/area
 :description "This the bridge aboard the Okaga. The room is circular, with a round table in the middle. The walls are lined, floor-to-ceiling, with dials, buttons, levers, and so on."
 :exits {:door :okaga/passageways}
 :noises [[2 "Something on one of the walls beeps."]
          [1 "A dial on the wall that had been slowly climbing drops back down suddenly."]]
 :lookables [{:name :table
              :description "The table in center of the room is made of a light gray metal. The top is a glazed glass, lit from beneath."
              :grammar {:nouns [:table]
                        :adjectives ["light gray" "gray" "metal"]}}
             {:name "tabletop"
              :description "The top of the table is a glazed glass, lit from beneath so that papers set on it are easier to read."
              :grammar {:nouns [:top]
                        :adjectives [:table :glass :glazed :lit]}}
             {:name "glass"
              :description "The glass that makes up the tabletop is glazed, and lit from below."
              :grammar {:nouns [:glass]
                        :adjectives [:glazed :lit]}}
             {:name "floor"
              :description "The floor here is some sort of blue-gray carpet."
              :grammar {:nouns [:floor]
                        :adjectives [:blue-gray :blue :gray]}}
             {:name "wall interface"
              :description "All along the walls are a variety of dials, in different sizes, along with levers, buttons, switches, and so on."
              :grammar {:nouns [:dial :dials :interface :interfaces :levers :lever :buttons :button :switches :switch]
                        :adjectives [:wall]}}
             {:name "walls"
              :description "The walls of the bridge are almost entirely covered with means of interfacing with the vast tool that is the Okaga."}
             {:name "metal"
              :description "The metal that composes the table in the center of the room is the same light gray as the walls."
              :grammar {:adjectives ["light gray" :gray]}}
             {:name "ceiling"
              :description "The ceiling here is a single panel that is lit up a soft whip."}]}
