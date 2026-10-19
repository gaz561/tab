{:name "Minimal Models of TAB"
 :base :lib/doc
 :author :emsenn
 :history [{:time 1668535604
            :event "Started drafting"}]
 :docmeta {:type :grumbling
           :sequence 27
           :tags [:TAB]}
 :contents "
In my previous grumbling I talked about TAB as a note-taking tool; in this one I'm going to look over what models currently exist.

All of these models exist in the code repository under the `/models/` folder, if you wanna look along.

The most basic thing is, well, the thing, it's at `/models/thing. A thing has a `name`, a list of `behaviors`, a list of `additive-attributes`, and then a table of `grammar` information, which for now is just a list of pronouns.

From there, there's... I guess two, no, three generalized categories of models that the other models tend to be based on. (Is that a concept I've explained yet? Each model can specify a base (or a list of bases) that will be used as the foundations for that model.)
"}
