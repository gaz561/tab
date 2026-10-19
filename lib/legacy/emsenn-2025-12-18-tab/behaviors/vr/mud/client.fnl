;;;; VR MUD client behaviors

(local tab (require :tab))

(fn look [client thing]
  (client:message (.. "You look at " (thing:fname)))
  (local A (tab.make-string-appender "\n"))
  (A (thing:fname))
  (A (.. "  " (thing:describe)))
  (when thing.contents
    (let [content-listing (tab.quibble-strings
                           (icollect [_ item (pairs thing.contents)]
                             (when item.notable (item:fname))))]
      (when content-listing (A (.. "Contents: " content-listing)))))
  (when thing.exits
    (A (.. "Exits: "
           (tab.quibble-strings (tab.collect-keys thing.exits true)))))
  (if (not (= (A) ""))
      (client:message (A))
      (client:message (.. "Cannot see " (or thing.name "the thing" :.)))))

(fn move [client area]
  (client:message (.. "You move to " (area:fname)))
  (area:receive-object client))

{: look : move}
