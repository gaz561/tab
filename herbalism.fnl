(fn gos.herbs.setup-admin [client]
  (each [cmd func (pairs gos.herbs.commands)]
    (tset client.commands cmd func)))

(fn gos.herbs.commands.add-herb [client line]
  (let [(id botanical) (line:match "([^ ]+) ?(.*)")]
    (gos.data.set-entry :herbs id {:botanical-name botanical}))
  (client:message "Might've worked who knows"))

(fn gos.herbs.commands.set-herb-key [client line]
  (let [(id rest) (line:match "([^ ]+) ?(.*)")
        (key value) (rest:match "([^ ]+) ?(.*)")]
    (gos.data.set-entry-key :herbs id key value))
  (client:message "Might've worked who knows"))

(fn gos.herbs.commands.find-text [client id]
  (local ref (gos.data.find-entry :herbs id))
  (if ref
      (client:message (.. ref.botanical-name))
      (client:message "No matching ID in library.")))

(fn gos.herbs.commands.list-herbs-for-symptom [client line]
  (print line)
  (let [symptom line matches []]
    (each [id herb (pairs (. (gos.data.read :herbs) :components))]
      (each [_ indicator (pairs herb.indicators)]
        (print indicator)
        (when (= symptom indicator)
          (table.insert matches id))))
    (client:message (.. "Herbs indicated: "
                        (gos.util.quibble-strings matches)))))
