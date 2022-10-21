{:fname
 (fn [thing]
   (.. (if (and thing.grammar
                thing.grammar.article)
           (.. thing.grammar.article " ")
           "")
       thing.name))}
