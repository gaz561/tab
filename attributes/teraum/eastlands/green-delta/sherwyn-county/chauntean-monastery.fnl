;;;; Chauntean Monastery, Sherwyn County (Teraum) model

;; So these four characters here are from the Red Team within the Brave Old World campaign I hosted a few years back. The idea was that the Red Union was gonna discover they were responsible for the Big Fire, and press them into hunting down formerly magic artifacts and bringing them back to the Union for "destruction"

{:name "Chauntean Monastery"
 :base :teraum/eastlands/green-delta/area
 :trivia ["The Chauntean Monastery in Sherwyn County was constructed around 1140bB"]
 :contents [{:name "Ilea"
             :base :teraum/npc
             :description "Ilea is a tall red-headed feminine human."
             :trivia ["Ilea was born on a human farm in the northwest part of Halfling Country in 53aB."
                      "Prior to migrating to Sherwyn County, Ilea worked as a hunter in the Elflands of the New World."
                      "Ilea moved from the Elflands to the Old World in 80pc."]}
            {:name "Brother Sun"
             :description "This is Brother Sun, an androgynous human wearing orange robes which have been often repaired by not-quite-matching orange thread."
             ;; more talkative than you'd expect for a monk
             :trivia ["Brother Sun was created by Jorge Landivar in 2016rw."]}
            {:name "Vagrant"
             ;; born in Gnalens as Stede Bonnet, last of the Bonnet family
             :trivia ["The Vagrant arrived in Sherwyn County suspiciously soon after the Fire of Ack, in the spring of 80pc."
              "The Vagrant was created by Brent Davis in 2016rw."]}]}

