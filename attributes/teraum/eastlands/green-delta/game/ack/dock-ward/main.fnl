;;;; Dock Ward main area model

{:name "Dock Ward"
 :base :teraum/eastlands/green-delta/game/ack/area
 :description "This is the Dock Ward, the oldest district in the city of Ack. Originally settled by humans retiring from a life fishing the Optic Ocean, the district is a hub of import and export. The blocks are filled with warehouses, and the streets are nearly blocked by the workers tent camps. Around the district is an unusual wooden wall. It was constructed by rolling decommissioned ships on their side, helping to protect against the militant tribes that then roamed the Central Plains.\n\n\

A bridge from here lead north across the murky brown Green River toward the North Ward. The Kingsroad cuts east and west through the district, leading to the Copper Ward and the harbour, respectively. Heading south through the maze of tents and warehouses leads to the Squash Ward."
 :exits {:north :teraum/eastlands/green-delta/game/ack/north-ward
         :east :teraum/eastlands/green-delta/game/ack/copper-ward
         :south :teraum/eastlands/green-delta/game/ack/squash-ward
         :west :teraum/eastlands/green-delta/game/ack/dock-ward/harbour}
 :noises [[2 "At the harbour, a sailor argues with a representative from the Red Union."]
           [1 "A young woman pulls a roll of paper from her satchel, tacks it to a segment of the Ward's wall, and paints over it with a paintbrush quickly, before pulling down the paper. Whatever message she meant to leave is entirely illegible. At least she tried."]]
 :lookables [{:name "Ack"
              :description "This is the city of Ack, or at least, that of it visible from the Dock Ward. From here, you get the impression that the city is heavily-populated and busy with trade and industry."}
             {:name "blocks"
              :description "The city blocks here are not very block-y in shape. The streets instead yield to the footprint of the large warehouses, and are narrowed to paths by permanent tent encampments built throughout the Ward."
              :grammar {:nouns [:block :blocks]
                        :adjectives [:city]}}
             {:name "bridge"
              :description "A bridge to the north, made of iron, crosses the Green River and leads to the North Ward."
              :grammar {:adjectives [:iron :north :northern]}}
             {:name :clerks
              :description "There are a few bureaucrats from the Red Union walking around the Ward, doing inspections on various shops and warehouses."
              :grammar {:nouns [:bureaucrats :bureaucrat :clerk]}}
             {:name "Copper Ward"
              :description "The Copper Ward is the district east of here."}
             {:name :graffiti
              :description "The wall around the Dock Ward, separating it from the rest of the city, is covered in graffiti."}
             {:name :harbour
              :description "To the west is the harbour, where ships berth."}
             {:name "humans"
              :description "There are a lot of humans here in the Dock Ward, of various sorts. Many have darker complexions, revealing their time spent sailing the Optic Ocean. Others are dressed in red robes and have notably light complexions: the clerks of the Red Union, who rarely leave the towers of the Red Ward except on their bureaucratic assignments. One commonality is that most appear to be working class."
              :grammar {:nouns [:humans :human :workers :worker "working class"]}}
             {:name "Kingsroad"
              :description "The Kingsroad is the widest boulevard in the district, going directly from the harbour, to the west, along the Green River to the city's Eastgate and out into the Green Delta beyond."
              :grammar {:nouns [:road]}}
             {:name "North Ward"
              :description "The North Ward is well, north, across the Green River from here."}
             {:name "Optic Ocean"
              :description "The Optic Ocean isn't visible from here, but the tang of churning algae is heavy in the air."
              :grammar {:nouns [:ocean]}}
             {:name "Green River"
              :description "This is near the mouth of the Green River. Here, the river's waters are a murky brown, and creep by, carrying the sewage of nearly every settlement between here and the Worldkeeper Mountains, a few thousand miles east."
              :grammar {:nouns [:river "green river"]
                        :adjectives [:brown :murky]}}
             {:name :sailors
              :description "There are quite a few sailors here. This is the Dock Ward, after all: the harbour is just west of here."}
             {:name "sewage"
              :description "You don't need to have sewage described."}
             {:name "ships"
              :description "The ships that make up the wall around the Dock Ward are old and covered in graffiti. Many of the ships show signs of severe fire damage."
              :grammar {:adjectives [:decommissioned :old]
                        :nouns :ships}}
             {:name "stores"
              :description "Some of the ships that make up the Dock Ward's outer wall have small stores tucked inside them."}
             {:name "Squash Ward"
              :description "The Squash Ward is the district south of here."}
             {:name "tents"
              :description "The streets are filled with canvas tents: where the workers and various warehouses live."}
             {:name "warehouses"
              :description "The Dock Ward is mostly warehouses these days, housing the goods coming in and out of the harbour. Most of the warehouses look recently constructed."
              :grammar {:nouns [:warehouse]}}
             {:name "wall"
              :description "The wall around the Dock Ward is made from old ships, too damaged to repair, that were dragged on shore and laid on their sides. Many of the ships have stores tucked inside them."}]}
