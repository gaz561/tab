;;;; road near Freke's grave, South Arathel (Teraum) model

(local green-delta :teraum/eastlands/green-delta/)

{:name "South Arathel"
 :base :teraum/eastlands/green-delta/game/south-arathel/rural-road
 :description "This is the western part of the road between Arathel and Pled Counties, itself in what would be considered eastern Arathel County. The road itself is well-packed dirt, with clear ruts from wagon wheels. Short stone walls border both sides of the road, marking the fields where local farmers graze their sheep. The road leads west toward Arathel County, and east toward Pled County."
 :exits {:east (.. green-delta :pled-county/west-arathel-pled-road)
         :west (.. green-delta :game/south-arathel/outside-dull-thorn-inn)}}
