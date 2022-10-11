(local util (require :util))
{:save
  (fn [area]
    (area.map:save-area area))
  :receive-object
  (fn [area object]
    (when object.location
      (object.location:remove-object object area))
    (table.insert area.contents object)
    (set object.location area))
  :remove-object
  (fn [area object ?destination]
    (set area.contents (util.remove-value area.contents object))
    (each [_ thing (pairs area.contents)]
      (when (. thing :message)
        (thing:message (.. object.name " moved "
                           (if ?destination (.. "to " ?destination.name)
                               "elsewhere")
                           :.))))
    (set object.location nil))
  :search-area
  (fn [area query ?matches]
    (local matches (or ?matches []))
    (lambda search [seq]
      (each [_ item (pairs seq)]
        (when (and item.name (= item.name query))
          (table.insert matches item))))
    (search area.contents)
    (search area.lookables)
    matches)}
