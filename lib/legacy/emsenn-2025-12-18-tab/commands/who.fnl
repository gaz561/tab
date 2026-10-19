;;;; who command

(local tab (require :tab))

(fn who [client input]
  (let [client-names []]
    (var anon-count 0)
    (each [_ client (pairs client.dimension.mud-server.clients)]
      (let [name client.name]
        (if (= name :Anonymouse)
            (set anon-count (+ anon-count 1))
            (table.insert client-names client.name))))
    (client:message
     (.. "There are " (length client.server.clients)
         " clients currently connected"
         (if (> anon-count 0)
             (.. "; including " anon-count " anonymice")
             "")
         ". Current users:\n"
         (tab.quibble-strings client-names)))))
