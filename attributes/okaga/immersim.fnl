;;;; Okaga Immersim model

{:name "Immersim"
 :base :okaga/area
 :description "This the entryway to the Immersim aboard the starship Okaga. This area allows folk to move from the Okaga into various immersive simulations. Currently only one door is accessible; a label above it says it leads to Teraum."
 :exits {:door :okaga/passageways
         :teraum :teraum/eastlands/central-plains/fort-kelly}
 :trivia ["The Okaga Immersim was created to explain, in-fiction, why the environment of Teraum doesn't actually change: it's a simulation of a previous mission the Okaga was on."]}
