;;;; Dual Thorn Inn, South Arathel (Teraum) model

{:name "Dull Thorn Inn"
 :base :teraum/eastlands/green-delta/game/south-arathel/area
 :description "This is the Dull Thorn Inn. The building is a two-storey timber and brick structure, furnished with well-made tables and chairs. A collection of weapons hangs on the wall to the right as one enters. Across from the entry, a door leads to the sleeping quarters. A woman named Benne stands behind the bar."
 :exits {:out
         :teraum/eastlands/green-delta/game/south-arathel/outside-dull-thorn-inn
         :quarters
         :teraum/eastlands/green-delta/game/south-arathel/dull-thorn-inn-quarters}
 :contents [{:name "Benne"
             :base :teraum/npc
             :description "This is Benne. She's a tall human woman, more timid than you'd expect, given her size."
             :noises [[2 "Benne looks toward the window as something makes a sound outside.."]]}]}
