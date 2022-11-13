;;;; road near Freke's grave, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "South Arathel"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the road toward Honeyfern Laboratories, in Arathel County. Tall pines scatter the area. To the northeast is Honeyfern Laboratories, and to the southwest is a road leading elsewhere."
 :exits {:northeast (.. region :honeyfern-labs/outside-gate)
         :southwest (.. region :fork-toward-honeyfern-labs)}}
