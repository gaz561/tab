;;;; North Ward, Ack (Teraum) model

{:name "North Ward"
 :base :teraum/eastlands/green-delta/game/ack/area
 :description "This is the North Ward, where Ack's first gentry moved to get away from the working class. To the north is the road to Arathel County. To the northeast is the Astar Ward. To the east is the Red Ward. To the south is the Dock Ward. To the northwest is the Wineglass."
 :exits {:northeast :teraum/eastlands/green-delta/game/ack/astar-ward
         :east :teraum/eastlands/green-delta/game/ack/red-ward
         :south :teraum/eastlands/green-delta/game/ack/dock-ward
         :northwest :teraum/eastlands/green-delta/game/ack/wineglass}}
