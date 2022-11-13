;;;; East Kingsroad model

{:name "Kingsroad"
 :base [:teraum/eastlands/central-plains/kingsroad]
 :grammar {:article "the"}
 :description "This is the Kingsroad, toward the eastern border of the Central Plains. To the east are the Farsteppes, and to the west are the Central Plains, and beyond that the Green Delta."
 :exits {:east :teraum/eastlands/farsteppes/kingsroad
         :west :teraum/eastlands/central-plains/fort-kelly}}
