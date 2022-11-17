;;;; Bellybrush Road, South Arathel (Teraum) model

(local game :teraum/eastlands/green-delta/game/

{:name "Bellybrush Road"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is Bellybrush Road, in Arathel County. It leads northwest further toward Arathel County, and southeast, toward Bellybrush."
 :exits {:southeast (.. game :bellybrush/arathel-road)
         :northwest (.. game :south-arathel/outside-crossed-candles-inn)}}
