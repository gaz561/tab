;;;; container behaviors

(local tab (require :tab))

(fn receive-object [container object]
  "Remove OBJECT from its current location and add it to CONTAINER's contents."
  (tab.log :debug (.. (container:fname) " receiving " (object:fname)
                      " into " container.grammar.pronouns.determiner
                      " contents"))
  (when object.location
    (object.location:remove-object object container))
  (table.insert container.contents object)
  (set object.location container))

(fn remove-object [container object ?destination]
  "Remove OBJECT from CONTAINER's contents, message other contents about the removal, naming ?DESTINATION if its given."
  (set container.contents (tab.remove-value container.contents object))
  (each [_ thing (pairs container.contents)]
    (when (. thing :message)
      (thing:message (.. object.name " moved "
                         (if ?destination (.. "to " ?destination.name)
                             "elsewhere")
                         :.))))
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

{: receive-object
 : remove-object
 : search-contents}
