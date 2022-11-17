{:name "street in Bellybrush"
 :base :teraum/eastlands/green-delta/game/bellybrush/area
 :description "This is a street in Bellybrush. The surface is covered in a nearly white sand, with gutters of crushed gray stone and sidewalks made of red brick pavers."
 :trivia ["The town of Bellybrush was settled in 701bB."
          "The town of Bellybrush was added to the Teraum MUD in rwOctober, 2020, and was the first region to receive much detail."]
 :lookables [{:name "street"
              :description "The street here is surfaced with white sand."
              :grammar {:nouns [:street :surface]
                        :adjectives [:white :sand]}}
             {:name "sand"
              :description "The sand that surfaces the street is white and sparkly, contrasting with the gray and red of the gutters and sidewalk."
              :grammar {:nouns [:sand]
                        :adjectives [:white :sparkly]}}
             {:name :gutters
              :description "The gutters here are about four to six inches of gray stones, serving as a buffer between the street and raised brick sidewalks."
              :grammar {:nouns [:gutters :gutter]
                        :adjectives [:stone]}}
             {:name "stones"
              :description "The stones in the gutter are some gray stone, probably granite. Most are between one and two inches across, with some being a little smaller."
              :grammar {:nouns [:stones :stone :gravel]
                        :adjectives [:gray :granite]}}
             {:name "sidewalk"
              :description "The sidewalk here is made of red bricks. Notably, the sand between the brick pavers is a buff beige, different than the white sand of the streets."
              :grammar {:nouns [:sidewalk :sidewalks]
                        :adjectives [:brick :paved :paver]}}
             {:name "sand"
              :description "The sand between the brick pavers used to make the sidewalk is a beige, buff color."
              :grammar {:nouns [:sand :joiner]
                        :adjectives [:beige :buff]}}]}
