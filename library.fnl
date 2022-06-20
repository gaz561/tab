(fn gos.library.setup-admin [client]
  (each [cmd func (pairs gos.library.commands)]
    (tset client.commands cmd func)))

(fn gos.library.commands.add-text [client line]
  (let [(id rest) (line:match "([^ ]+) ?(.*)")
        (status title) (rest:match "([^ ]+) ?(.*)")]
    (gos.data.set-entry :library id {: status : title}))
  (client:message "Might've worked who knows"))

(fn gos.library.commands.set-text-key [client line]
  (let [(id rest) (line:match "([^ ]+) ?(.*)")
        (key value) (rest:match "([^ ]+) ?(.*)")]
    (gos.data.set-entry-key :library id key value))
  (client:message "Might've worked who knows"))

(fn gos.library.commands.find-text [client id]
  (local ref (gos.data.find-entry :library id))
  (if ref
      (client:message (.. ref.title
                          (if ref.status
                              (.. "\n [" ref.status "]")
                              "")
                          (if ref.brief
                              (.. "\n" ref.brief)
                              "")
                          (if ref.link
                              (.. "\n" ref.link)
                              "")))
      (client:message "No matching ID in library.")))
