;;;; look command

(fn look [client input]
  (if (not (= input ""))
      (let [matches []]
        (client:message (.. "You attempt to look at '" input "'."))
        (when client.location
          (client.location:search-area input matches))
        (if (= (length matches) 1)
            (client:look (. matches 1))
            (if (> (length matches) 1)
                (client:message "Multiple matches.")
                (client:message "No match."))))
      (if client.location
          (do
            (client:message "You look around the area.")
            (client:look client.location))
          (client:message "You aren't anyplace."))))
