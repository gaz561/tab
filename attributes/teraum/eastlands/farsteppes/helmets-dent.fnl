;;;; Helmet's Dent Model

{:name "Helmet's Dent"
 :base [:teraum/eastlands/farsteppes/area]
 :description "This is the town of Helmet's Dent. It is the largest town in the Farsteppes, existing around a large market where traders from the local nomadic tribes do business with merchants from the Central Plains and Green Delta. The buildings of the town reflect the diverse population, highlighting architectural styles from around the world."
 :exits {:northeast :teraum/eastlands/farsteppes/helmets-dent
         :southeast :teraum/eastlands/farsteppes/road-to-culver-estate
         :west :teraum/eastlands/farsteppes/kingsroad}
 :contents [{:name "Susan Baff"
             :base [:teraum/npc :teraum/eastlands/farsteppes/stepper]
             :description "Susan Baff is a feminine human who lives in Helmet's Dent, wokring as a cleaner and clerk for various businesses in town."}
            {:name "Tyjeer Baff"
             :base [:teraum/npc :teraum/eastlands/farsteppes/stepper]
             :description "This is Tyjeer Baff, a masculine human around 12 or 13 years old."}
            {:name "Nash Celson"
             :base [:teraum/npc :teraum/eastlands/farsteppes/stepper]
             :description "Nash Celson is a non-descript masculine adult human."
             :trivia ["Nash Celson is named after a former artistic accomplice of emsenn's."]}
            {:name "ragar"
             :description "This is a clay bottle filled with ragar: fermented mares milk. It was made by the Lazy Mare Tribe of the Farsteppes."
             :trivia ["The Lazy Mare Tribe was created by David Vallner in 2016rw."
                      "The Lazy Mare Tribe discovered ragar, fermented mares milk, around 3400bB."]}]}
