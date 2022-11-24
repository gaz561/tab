;;;; Eridrin, Marby County (Teraum) attributes

(local green-delta :teraum/eastlands/green-delta/)

{:name "Eridin"
 :base :teraum/eastlands/green-delta/area
 :mud-commands [:forage]
 :forage-chance {"blue pebble" 1}
 :forage-items [{:name "blue pebble"
                 :base :vr/object}]
 :description "This is the town of Eridrin. It consists of about a dozen wattle cottages erected near the gravel banks of the Marlbreen River, grey with silt. A well-worn road reveals sandy loam under thin topsoil. The road leads northwest to the large town of Bellybrush, and southeast through Marby County."
 :lookables [{:name "wattle cottages"
              :description "There are about a dozen wattle cottages arranged near the road."
              :noises ["Sun glints off the smooth facade of a cottage."
                       "A sound of conversation briefly rolls out of a cottage."]
              :grammar {:nouns [:cottages :cottage :houses :house]
                        :adjectives [:wattle]}}
             {:name "gravel riverbanks"
              :description "The banks of the Marlbreen River are composed of small round pebbles. Most are an unremarkable beige, but there are a few bright blue pebbles."
              :noises ["A soft sound rises from the Marlbreen's banks as gravel shifts around."]
              :grammar {:nouns [:riverbanks :riverbank :banks :bank]
                        :adjectives [:gravel :river]}}
             {:name "bright blue pebbles"
              :description "There are a few bright blue pebbles mixed in with the gravel forming the banks of the Marlbreen River."
              :grammar {:nouns [:pebbles :pebble]
                        :adjectives [:bright :blue :magic]}}
             {:name "beige gravel"
              :description "Most of the Marlbreen's banks and floor are covered in beige gravel."
              :grammar {:nouns [:gravel :pebbles :pebble]
                        :adjective [:beige]}}

             {:name "gray silt"
              :description "Grey silt is suspended in the water of the Marlbreen River, obfuscating its bottom."
              :grammar {:nouns [:silt]
                        :adjectives [:gray]}}
             {:name "goat"
              :description "This is a goat."
              :noises ["The goat bleats."]}]}
