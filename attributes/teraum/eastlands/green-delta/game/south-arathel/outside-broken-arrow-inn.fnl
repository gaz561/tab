;;;; outside Broken Arrow Inn, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "outside the Broken Arrow Inn"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is a dirt road outside the Broken Arrow Inn, in Arathel County. The road leads southeast toward the Arathel-Ack road, and northwest into Arathel County."
 :exits {:north (.. region :broken-arrow-inn)
         :southeast (.. region :north-arathel-ack-road)
         :northwest (.. region :fork-toward-honeyfern-labs)}}
