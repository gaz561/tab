(local util (require :util))

{:receive-object
  (fn receive-object [container object]
    (when object.location
      (object.location:remove-object object container))
    (table.insert container.contents object)
    (set object.location container))
  :remove-object
  (fn [container object ?destination]
    (set container.contents (util.remove-value container.contents object))
    (each [_ thing (pairs container.contents)]
      (when (. thing :message)
        (thing:message (.. object.name " moved "
                           (if ?destination (.. "to " ?destination.name)
                               "elsewhere")
                           :.))))
    (set object.location nil))
  :search-contents
  (fn [container query ?matches]
    (local matches (or ?matches []))
    (lambda search [seq]
      (each [_ item (pairs seq)]
        (when (and item.name (= item.name query))
          (table.insert matches item))))
    (search container.contents)
    (search container.lookables)
    matches)}
