(local fennel (require :fennel))
(local tab (require :tab))

(local thing {})

(fn thing.fname [thing]
  (.. (if (and thing.grammar
               thing.grammar.article)
          (.. thing.grammar.article (if (> (length thing.grammar.article) 0)
                                        " "
                                        ""))
          (if (tab.find-element [:a :e :i :o :u] (string.lower
                                                  (string.sub thing.name 1 1)))
              "an "
              "a "))
      thing.name))

(fn thing.describe [thing]
  (if thing.description
      thing.description
      (.. "This is " (thing:fname) ".")))

(fn thing.name=? [thing term]
  (= thing.name term))

(fn thing.noun=? [thing term]
  (let [phrase (tab.split-string term)
        noun (. phrase (length phrase))]
    (when (and thing.grammar
               thing.grammar.nouns)
      (or (= noun thing.name)
          (tab.find-element thing.grammar.nouns noun)))))

(fn thing.adjectives=? [thing term]
  (var mismatch nil)
  (let [phrase (tab.split-string term)
        adjectives (if (> (length phrase) 1)
                       (do (table.remove phrase (length phrase))
                           phrase)
                       nil)]
    (when (and adjectives
               thing.grammar
               thing.grammar.adjectives)
      (each [_ adjective (pairs adjectives)]
        (when (not (tab.find-element adjectives adjective))
          (set mismatch true))))
    (not mismatch)))

(fn thing.term=? [thing term]
  (or (thing:name=? term)
      (and (thing:noun=? term)
           (thing:adjectives=? term))))

thing
