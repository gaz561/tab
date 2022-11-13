;;;; Chandlers Guild Office (Belcaer) model


;; Abeth should give a question: go collect taxes from King Brag, in Jacob's Folly.

{:name "Chandlers Guild Office"
 :base [:teraum/eastlands/gloaming/belcaer/area]
 :description "This is the office of the Chandlers Guild, in Belcaer."
 :contents [{:name "Abeth Harbrook"
             :base [:npc :teraum/eastlands/gloaming/belcaer/belkite]
             :description "Abeth Harbrook is a feminine human. She is the representative of the Chandlers Guild in Belcaer, helping the casino fill its paper and office supply needs."
            :actions [[2 "Abeth Harbrook says, \"Most people don't think about how far the paper they use has come.\""]
                      [1 "Abeth Harbrook says, \"I tried suggesting the casino move to paper instead of coins.\""]]}]
 :exits {:out :teraum/eastlands/gloaming/belcaer/offices}}
