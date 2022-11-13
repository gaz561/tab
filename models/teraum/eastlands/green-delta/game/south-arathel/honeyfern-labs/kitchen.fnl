;;;; kitchen, Honeyfern Labs model

(local region :teraum/eastlands/green-delta/game/south-arathel/honeyfern-labs/)

{:name "kitchen, Honeyfern Labs"
 :base (.. :area)
 :description "This is the kitchen of Honeyfern Laboratories. A door leads to the pantry, and another to the dining hall. The door to the backyard has been painted shut."
 :exits {:pantry (.. :pantry)
         :hall (.. :dining-hall)}}
