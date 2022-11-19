;;;; vr/area model

{:name :area
 :base [:vr/container]
 :behaviors [:vr/area]
 :additive-attributes [:lookables :noises]
 :description "This is a place where things can be."
 :model-definition "An area is based on a container, adding quite a lot. Areas are usually made by a mapper system. Areas have additive lists of lookables and noises; each contain models of things that will be made when the room is made (and given a base of lookable or noise, respectively, if it isn't already specified.) Areas also have a table of exits, where the key is the name of the exit and the value is the ID of the area within the area's mapper system."
 :lookables [] :noises []
 :exits {}
 :grammar {:article ""
           :nouns [:area]}}
