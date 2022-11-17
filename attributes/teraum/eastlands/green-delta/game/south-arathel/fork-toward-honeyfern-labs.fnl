;;;; fork toward Honeyfern Labs, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "intersection of two roads"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the intersection of two dirt roads in Arathel County. One road leads off to the northeast, toward Honeyfern Laboratories. The other runs southeast, toward Ack, or north, into Arathel County."
 :exits {:northeast (.. region :road-to-honeyfern-labs)
         :east (.. region :outside-broken-arrow-inn)
         :north (.. region :road-near-frekes-grave)}}
