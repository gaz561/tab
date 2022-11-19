;;;; front path, Honeyfern Labs model

(local region :teraum/eastlands/green-delta/game/south-arathel/honeyfern-labs/)

{:name "front path, Honeyfern Labs"
 :base (.. region :area)
 :description "This is the path to Honeyfern Laboratories. Grass grows nearly seven feet tall to either side of the narrow gravel path. It leads to an outside gate, and toward the building's porch."
 :exits {:gate (.. :outside-gate)
         :porch (.. :front-porch)}}
