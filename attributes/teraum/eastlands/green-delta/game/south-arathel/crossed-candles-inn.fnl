;;;; Crossed Candles Inn, South Arathel (Teraum) model

{:name "Crossed Candles Inn"
 :base :teraum/eastlands/green-delta/game/south-arathel/area
 :description "This is the Crossed Candles Inn: a simple wooden shack with several shuttered windows. There are a few wooden cots in one corner, and a long table which serves as the bar in another. There are some people seated at the table. A door leads out to Arathel County."
 :exits {:out
         :teraum/eastlands/green-delta/game/south-arathel/outside-crossed-candles-inn}
 :contents [{:name "Alfric"
             :description "This is Alfric, a ghost that haunts Crossed Candles Inn."
             :actions [1 "Two yokels eye each other suspiciously."]
             :trivia ["Alfric the ghost died after slipping and hitting his head while trying to start a bar fight, after surviving many dangerous battles in the Great Wars."
                      "Alfric the ghost was the first \"NPC\" created within the MUD, because having physical existence (having mass) wasn't a feature yet."]}
            {:name "Lexandra Terr"
             :description "Lexandra Terr is a short feminine human. She is wearing a simple blue cotton dress."
             :actions [3 "Lexandra steps out the door carrying a few empty glass bottles and returns a moment later, empty-handed."]}]
 :lookables [{:name :cots
              :description "There are a few beds in one corner, more likely to be used when every other inn is full than as consistent board."
              :grammar {:nouns [:beds :bed :cot]}}
             {:name "Crossed Candles Inn"
              :description "The Crossed Candles Inn is a relatively simple building: four posts are sunk deep into the silty clay soil of Arathel County, some crossbeams were braced into place, and vertical slats were hammered on over those. The floor is still dirt, though it's been packed so hard it almost resembles stone."
              :grammar {:nouns [:building :inn :shack]}}
             {:name :posts
              :description "The four posts that provide the foundation of the building are a dark-coloured pine."
              :grammar {:nouns [:posts :post]
                        :adjectives [:four :pine :wood :wooden]}}
             {:name :slats
              :description "The siding of the Inn are vertical wooden slats, the ruddy colour of old pine."
              :grammar {:nouns [:siding :slats :slat]
                        :adjectives [:pine :ruddy :wood :wooden :vertical]}}
             {:name :windows
              :actions [[2 "The wind outside bangs the shutters in their frames.")
                        [2 "The wind outside carries in the faint smell of brine and turpentine."]]}
             {:name :yokels
              :description "The patrons of this bar are mostly local yokels, workers and farmers from around South Arathel."
              :grammar {:nouns [:yokels :yokel :farmers :farmer :patrons :patron
                                :people :workers :worker]}}]}
