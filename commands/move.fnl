;;;; move command

(local tab (require :tab))

(fn move [client input]
  (if (not (= input ""))
      (let [exit (. client.location.exits input)]
        (if exit
            (do
              (tab.log :debug (.. (client:fname) " attempting to move to " exit))
              (let [exit-area (client.dimension.map:find-area exit)]
                (if exit-area
                    (do
                      (client:move exit-area)
                      (client:look client.location))
                    (client:message (.. "That exit doesn't actually work; go complain.")))))
            (client:message "Invalid exit.")))
      (client:message "Include exit name.")))
