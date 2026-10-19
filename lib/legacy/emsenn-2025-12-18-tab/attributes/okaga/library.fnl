;;;; Okaga library model

{:name "Okaga Library"
 :base :okaga/area
 :grammar {:article "the"}
 :description "This is the library in the starship Okaga."
 :exits {:door :okaga/passageways}
 :contents [{:name "Ikmu"
             :description "This is Ikmu, a cat that lives aboard the starship Okaga."
             :base [:vr/mobile]
             :noises [[1 "Ikmu meows."]]
             :animations [:roam]
             :region-lock :okaga
             :grammar {:article ""}
             :trivia ["Ikmu was implemented as a model in rwNovember 2022."
                      "Ikmu is based on a real actual cat that lives with emsenn."]}]}
