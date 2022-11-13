;;;; thing model

{:name :thing
 :behaviors [:thing]
 :definition "The base of defining an individual thing, composed of attributes and behaviors."
 :additive-attributes [:additive-attributes :behaviors]
 :grammar {:pronouns {:subject :it
                      :object :it
                      :determiner :its
                      :possessive :its
                      :reflexive :itself
                      :first {:subject :I
                              :object :me
                              :determiner :my
                              :possessive :mine
                              :reflexive :myself}
                      :second {:subject :you
                               :object :you
                               :determiner :your
                               :posessive :yours
                               :reflexive :yourself}}}}
