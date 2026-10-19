;;; MarMUD dimension attributes

{:name "MarMUD"
 :base :sys/dimension
 :description "MarMUD is the command-and-reponse text interface for the Groundhog Autonomous Zone."
 :systems {:animation :vr/animation
           :map :marmud/vr/mapper
           :mud-server :marmud/mud/server
           :noisemaker :vr/noisemaker
           :users :marmud/users/handler
           :talker :mud/talker/system
           :timer :sys/timer}
 :grammar {:article ""}}
