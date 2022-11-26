;;;; container behaviors

(local tab (require :tab))

(fn message-contents [container ...]
  (let [message (tab.concat ...)]
    (each [_ thing (pairs container.contents)]
      (when (. thing :message)
        (thing:message message)))))

(fn receive-object [container object]
  "Remove OBJECT from its current location and add it to CONTAINER's contents."
  (tab.log :spam (.. (container:fname) " receiving " (object:fname)
                      " into " container.grammar.pronouns.determiner
                      " contents"))
  (let [obloc object.location]
    (when obloc
      (object.location:remove-object object container))
    (container:message-contents
     (object:fname) " arrives"
     (if obloc (.. " from " (obloc:fname))
         "") ".")
    (table.insert container.contents object)
    (set object.location container)))

(fn remove-object [container object ?destination]
  "Remove OBJECT from CONTAINER's contents, message other contents about the removal, naming ?DESTINATION if its given."
  (container:message-contents
   (object:fname) " moves " (if ?destination (.. "to " (?destination:fname))
                                "elsewhere")
   ".")
  (set container.contents (tab.remove-value container.contents object))
  (set object.location nil))
(fn search-contents [container term ?matches]
  "Return a list of items in CONTAINER's contents to which the term is a valid reference."
  (tab.search-things-by-term container.contents term ?matches)
  (local matches (or ?matches []))
  (fn search [seq]
    (each [_ item (pairs seq)]
      (when (item:term=? term) (table.insert matches item))))
  (search container.contents)
  matches)

{: message-contents
 : receive-object
 : remove-object
 : search-contents}
