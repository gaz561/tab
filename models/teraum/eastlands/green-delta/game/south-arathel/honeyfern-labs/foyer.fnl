;;;; foyer, Honeyfern Labs model

(local region :teraum/eastlands/green-delta/game/south-arathel/honeyfern-labs/)

{:name "foyer, Honeyfern Labs"
 :base (.. :area)
 :description "This is the foyer of Honeyfern Laboratories.  A door leads outside. Stairs lead upstairs, but they've been blocked. There is a hallway across the room from the door, and across from the stairs, an open door to a sitting room."
 :exits {:outside (.. :front-porch)
        ; :stairs (.. :second-floor)
         :hallway (.. :library)
         :door (.. :sitting-room)}}
