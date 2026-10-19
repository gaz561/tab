;;;; Okaga passageways model

{:name "passageways through the starship Okaga"
 :base [:okaga/area]
 :description "These passageways spread through the starship Okaga like a vascular system, leading to the various compartments."
 :exits {:library :okaga/library
         :immersim :okaga/immersim
         :bridge :okaga/bridge
         :galley :okaga/galley}
 :lookables [{:name "passageways"
              :description "The bulkheads are painted a matte gray, the deck is some sort of blue carpet, while the overhead matches the bulkheads, except for intermittent lights embedded in the ceiling."}
             {:name :bulkheads
              :description "Painted a matte gray, the bulkheads form the internal structure of each deck within the Okaga."
              :grammar {:adjectives [:matte :gray :painted]
                        :nouns [:walls]}}
             {:name :deck
              :description "The deck here is a low-pile blue carpet."
              :grammar {:adjectives [:low-pile :blue]
                        :nouns [:floor :carpet]}}
             {:name :overhead
              :description "The overhead matches the bulkheads."
              :grammar {:adjectives [:matte :gray :painted]
                        :nouns [:ceiling]}}]}
 
