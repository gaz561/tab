;;;; library HTML builder behaviors

(local tab (require :tab))

(fn render-library-item [library item]
  (let [A (tab.make-string-appender "<br/>")]
    (A (.. "<h3>" (item:fname) "</h3>"))
    (when item.author
      (A (.. "<strong>" item.author "</strong>")))
    (when item.description
      (A (.. "<em>" (item:describe) "</em>")))
    (when (and item.tags (> (length item.tags) 0))
      (A (.. "Tags: " (tab.quibble-strings item.tags true))))
    (when (and item.sources (> (length (tab.collect-keys item.sources)) 0))
        (let [t []]
          (each [anchor link (pairs item.sources)]
            (table.insert t (.. "<a href=\"" link
                                "\">" anchor "</a>")))
          (A (.. "Sources: " (tab.quibble-strings t true)))))
    (A)))

(fn render-library [library]
  (let [A (tab.make-string-appender "<br/>")]
    (each [_ item (pairs library.items)]
      (A (library:render-library-item item)))
    (A)))

{: render-library
 : render-library-item}
