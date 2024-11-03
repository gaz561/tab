;;;; first floor hallway, Honeyfern Labs model

(local region :teraum/eastlands/green-delta/game/south-arathel/honeyfern-labs/)

{:name "hallway, Honeyfern Labs"
 :base (.. region :area)
 :description "This is the first-floor hallway of Honeyfern Laboratories. One end leads to the foyer, while a door on either side leads to the dining hall or library. There are shelves built into both sides of the wall. Most of the shelves contain old books. A few squashboard boxes are on the floor. Some are half-full of books. Others are closed, sealed with tape, and covered in soot."
 :exits {:foyer (.. :foyer)
         :hall (.. :dining-hall)
         :library (.. :library)}}
