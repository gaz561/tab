(local util (require :util))

(local area-mod (util.load-file :models/area))

{:load
 (fn [map engine]
   (engine:log :debug (.. "Loading " map.name))
   (set map.engine engine)
   (set map.areas (util.load-folder map.data-folder))
   (map.engine:log :debug (.. "Loaded " map.name
                              " with "
                              (length (util.collect-keys map.areas))
                               " areas.")))
 :start
 (fn [map]
   (each [id area-data (pairs map.areas)]
      (map:spawn-area area-data)))
 :save-area
 (fn [map area]
   (map.engine:log :debug (.. "Saving area " area.id))
   (let [fennel (require :fennel)]
     (print (fennel.view area)))
   
   (local area-data {:id area.id :name area.name
                     :description area.description
                     :exits area.exits
                     :contents []})
   (let [fennel (require :fennel)]
     (print (fennel.view area-data)))
   (util.save-file area-data (.. map.data-folder :/ area.id)))
 :make-area
 (fn [map ?name ?description ?id]
   (local id (or ?id (util.make-id (util.collect-keys map.areas))))
   (map.engine:log :info (.. "Making new area"
                             (if ?name
                                 (.. " named " ?name)
                                 "")
                             "; ID " id))
   (let [area {: id
               :name (or ?name (.. "Area #" id))
               :description (or ?description "This is an area.")
               :exits {}
               :contents []}]
     (map:spawn-area area)))
 :spawn-area
 (fn [map area]
   (let [real-area (map.engine:make-thing :area (util.clone-table area {: map}))]
     (tset map.areas real-area.id real-area)
     real-area))
 :old-spawn-area
 (fn [map area]
   (let [real-area (util.clone-table area-mod area)]
     (set real-area.map map)
     (tset map.areas real-area.id real-area)
     real-area))
 :find-area
 (fn [map id]
   (local matches [])
   (each [aid area (pairs map.areas)]
     (when (= aid id)
       (table.insert matches area)))
   (. matches 1))
 :setup-admin
 (fn [map client]
   (tset client.commands :change-area map.commands.change-area)
   (tset client.commands :make-area map.commands.make-area))
 :commands
 {:change-area
  (fn [client input]
    (fn change [attr val]
      (tset client.location attr val)
      (client.location:save)
      (client:message "Changed!"))
    (let [(attribute value) (input:match "([^ ]+) ?(.*)")]
      (match attribute
        :name (change :name value)
        :description (change :description value)
        _ (client:message "Can't change that attribute this way."))))
  :make-area
  (fn [client input]
    (local new-area (client.engine.map:make-area))
    (tset client.location.exits input new-area.id)
    (tset new-area.exits :back client.location.id)
    (client.location:save)
    (new-area:save)
    (client:message (.. "You made a new area, accessible through the "
                        input " exit. (id #" new-area.id ")")))}}
