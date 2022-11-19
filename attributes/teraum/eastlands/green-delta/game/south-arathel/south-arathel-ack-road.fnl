;;;; road near Freke's grave, South Arathel (Teraum) model

(local game :teraum/eastlands/green-delta/game/)

{:name "South Arathel"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the road between the city of Ack and Arathel County, its northern neighbor. The road leads southwest to Ack and northeast toward Arathel County. Near the road is a blacksmith."
 :exits {:northeast (.. game :south-arathel/north-arathel-ack-road)
         :south (.. game :ack/astar-ward)
         :west (.. game :south-arathel/belys-blades)}}
