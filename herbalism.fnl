(local data (require :data))
(local util (require :util))

(local herbalism
       {:commands {}
        :data {}
        :roles {:admin {:commands [:add-herb :set-herb-key]}
                :user {:commands [:find-herb :list-herbs-for-symptom]}}})

(fn herbalism.setup-admin [client]
  (each [cmd func (pairs herbalism.commands)]
    (tset client.commands cmd func)))

(fn herbalism.commands.add-herb [client line]
  (let [(id botanical) (line:match "([^ ]+) ?(.*)")]
    (data.set-entry :herbs id {:botanical-name botanical}))
  (client:message "Might've worked who knows"))

(fn herbalism.commands.set-herb-key [client line]
  (let [(id rest) (line:match "([^ ]+) ?(.*)")
        (key value) (rest:match "([^ ]+) ?(.*)")]
    (data.set-entry-key :herbs id key value))
  (client:message "Might've worked who knows"))

(fn herbalism.commands.find-herb [client id]
  (local ref (data.find-entry :herbs id))
  (if ref
      (client:message (.. ref.botanical-name))
      (client:message "No matching ID in library.")))

(fn herbalism.commands.list-herbs-for-symptom [client line]
  (print line)
  (let [symptom line matches []]
    (each [id herb (pairs (. (data.read :herbs) :components))]
      (each [_ indicator (pairs herb.indicators)]
        (print indicator)
        (when (= symptom indicator)
          (table.insert matches id))))
    (client:message (.. "Herbs indicated: "
                        (util.quibble-strings matches)))))

herbalism
