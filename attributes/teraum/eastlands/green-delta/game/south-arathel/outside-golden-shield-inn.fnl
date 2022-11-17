;;;; outside Golden Shield Inn, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "outside the Golden Shield Inn"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the road outside the Golden Shield Inn, in Arathel County. The road continues north into Arathel County and south toward the city of Ack."
 :exits {:north (.. region :outside-dull-thorn-inn)
         :east (.. region :golden-shield-inn)
         :south (.. region :outside-crossed-candles-inn)}}
