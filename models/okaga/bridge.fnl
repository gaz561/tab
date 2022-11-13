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
                        :adjectives [:table :glass :glazed :lit]}}]}
