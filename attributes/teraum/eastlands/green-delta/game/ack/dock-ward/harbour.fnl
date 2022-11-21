;;;; Ack Harbour (Teraum) attributes

{:name "Ack Harbour"
 :base :teraum/eastlands/green-delta/game/ack/area
 :description "This is the harbour of Ack, located at the mouth of the Green Delta where it spills into the Optic Ocean."
 :exits {:east :teraum/eastlands/green-delta/game/ack/dock-ward/main}
 :noises [[1 "A young Union clerk monitoring those disembarking from the ships turns to his superior and asks, \"What do we do with a drunken sailor?\""]]
 :contents [{:name "sailor"
             :base :teraum/npc
             :animations [:roam]
             :region-lock :teraum/eastlands/green-delta/game/ack/dock-ward
             :noises [[1 "The sailor picks at some lint on their uniform."]]}]}
