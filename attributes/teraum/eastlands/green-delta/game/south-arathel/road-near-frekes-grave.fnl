;;;; road near Freke's grave, South Arathel (Teraum) model

(local region :teraum/eastlands/green-delta/game/south-arathel/)

{:name "a morbid stretch of country road"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is a length of rural road, cutting north to south through the countryside. There is grave marker set a ways back from the road, and closer, a man dressed in black is hanging by his wrists from a tree. There are some cokeberry bushes growing here."
 :exits {:north (.. region :outside-dull-thorn-inn)
         :east (.. region :golden-shield-inn)
         :south (.. region :outside-crossed-candles-inn)}
 :trivia ["This area is a reference to a session from the Brave Old Worlds campaign emsenn ran in rw2015"]}
