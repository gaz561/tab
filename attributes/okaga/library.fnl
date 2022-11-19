;;;; Okaga library model

{:name "Okaga Library"
 :base :okaga/area
 :grammar {:article "the"}
 :description "This is the library in the starship Okaga."
 :exits {:door :okaga/passageways}
 :contents [{:name "Ikmu"
             :description "This is Ikmu the cat."
             :base [:vr/mobile]
             :noises [[1 "Ikmu meows."]]
             :animations [:roam]
             :region-lock :okaga
             :roam-frequencey 3
             :grammar {:article ""}}]}
