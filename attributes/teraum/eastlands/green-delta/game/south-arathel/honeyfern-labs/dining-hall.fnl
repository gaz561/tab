;;;; dining hall, Honeyfern Labs model

(local region :teraum/eastlands/green-delta/game/south-arathel/honeyfern-labs/)

{:name "dining hall, Honeyfern Labs"
 :base (.. :area)
 :description "This is the dining hall of Honeyfern Laboratories. A door leads to a hallway, while another leads to the kitchen."
 :exits {:hallway (.. :first-floor-hallway)
         :kitchen (.. :kitchen)}}
