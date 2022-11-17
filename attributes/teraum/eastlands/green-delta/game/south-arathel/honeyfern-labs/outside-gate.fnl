;;;; outside gate, Honeyfern Labs model

(local region :teraum/eastlands/green-delta/game/south-arathel/honeyfern-labs/)

{:name "outside gate, Honeyfern Labs"
 :base (.. :area)
 :description "This is immediately outside the gate of Honeyfern Laboratories. The road leads southwest, elsewhere."
 :exits {:gate (.. :front-path)
         :southwest :teraum/eastlands/green-delta/game/south-arathel/road-to-honeyfern-labs}}
