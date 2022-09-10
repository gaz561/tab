(local data (require :data))
(local util (require :util))

(local library {:config {:id :durham-library}
                :id :lending-library})

(fn library.load []
  (data.read-file library.config.id))

(fn library.save [listing ?id]
  (data.write-file listing library.config.id))

(fn library.add-entry [name ?details]
  (local listing (library.load))
  (local entry (or ?details {}))
  (when (not entry.title) (set entry.title name))
  (when (not entry.status) (set entry.status :unknown))
  (when (not entry.queue) (set entry.queue []))
  (tset listing name entry)
  (library.save listing))

(fn library.remove-entry [name]
  (local listing (library.load))
  (tset listing name nil)
  (library.save listing))

(fn library.lend [name borrower]
  (local listing (library.load))
  (local entry (. listing name))
  (set entry.status :borrowed)
  (set entry.borrower borrower)
  (when entry.queue
    (each [count person (pairs entry.queue)]
      (when (= person borrower)
        (tset entry.queue count nil))))
  (library.save listing))

(fn library.reserve [name borrower]
  (local listing (library.load))
  (table.insert (. (. listing name) :queue borrower))
  (library.save listing))

(fn library.view-entry [entry ?status]
  (.. "### " entry.title
             (if ?status
                 ""
                 (.. " [" entry.status "]"))
             (if entry.genre
                 (.. " (" entry.genre ")")
                 "")
             "\n"
             (if entry.author
                 (.. "by " entry.author "\n")
                 "")
             (if entry.tags
                 (.. "Tags: " (util.quibble-strings entry.tags))
                 "")))

(fn library.view [?status ?tags]
  (local listing (library.load))
  (local names {})
  (var viewing (.. "# Library Listing\n"
                   "published " (util.render-time (os.time) "\n")
                   (if ?status
                       (.. "\nOnly " ?status " items are listed.\n")
                       "")))
  (each [name entry (pairs listing)]
    (when (or (and ?status
                   (or (= ?status :all)
                       (= ?status entry.status)))
              (not ?status))
      (table.insert names name)))
  (set viewing (.. viewing "There are " (length names) " entries.\n\n"))
  (table.sort names)
  (each [_ name (pairs names)]
    (set viewing (.. viewing (library.view-entry (. listing name) ?status) "\n\n")))
  viewing)

(fn library.publish [?status ?tags]
  (with-open [fout (io.open (.. "durham-library-"
                                (if ?status
                                    (.. ?status "-")
                                    "")
                                "listing.md") :w)]
    (fout:write (library.view ?status))))


library
