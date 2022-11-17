;;; MarMUD dimension attributes

{:name "MarMUD"
 :base :sys/dimension
 :description "MarMUD is the command-and-reponse text interface for the Groundhog Autonomous Zone."
 :systems {:animation :sys/animation
           :map :marmud/mapper
           :mudserver :marmud/mud/server
           :noisemaker :sys/noisemaker
           :timer :sys/timer}
 :grammar {:article :the}}
