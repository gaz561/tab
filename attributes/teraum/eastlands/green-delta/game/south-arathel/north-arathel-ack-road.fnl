;;;; north Arathel-Ack Road, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "Arathel-Ack Road"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the northern end of the road from Ack toward Arathel County, where it forks to the northwest and east. Both forks ultimately lead further north into the County. The difference is in what one passes on the way. The road northwest leads past Honeyfern Laboratories, while the road east passes more inns. To the southeast, the road leads to Ack."
 :exits {:northeast (.. region :outside-crossed-candles-inn)
         :southwest (.. region :south-arathel-ack-road)
         :northwest (.. region :outside-broken-arrow-inn)}}
