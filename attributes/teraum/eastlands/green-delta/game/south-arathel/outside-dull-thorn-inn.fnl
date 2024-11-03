;;;; outside Dull Thorn Inn, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "outside the Dull Thorn Inn"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the road outside the Dull Thorn Inn, where the road from Ack ends against the Arathel-Pled road."
 :exits {:north (.. region :dull-thorn-inn)
         :east (.. region :west-arathel-pled-road)
         :south (.. region :outside-golden-shield-inn)
         :west (.. region :outside-slow-lightning-inn)}}
