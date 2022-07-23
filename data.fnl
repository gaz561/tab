(local util (require :util))

(local data {})

(fn data.read [file]
  (util.load-file file {}))
(fn data.write [file contents]
  (util.save-file contents file))
(fn data.set-entry [file id details]
  (local contents (data.read file))
  (tset contents id details)
  (data.write file contents))
(fn data.find-entry [file id]
  (. (data.read file) id))
(fn data.find-entry-by-key [file key query]
  (local contents (data.read file))
  (local matches [])
  (each [id entry (pairs contents)]
    (local val (. entry key))
    (when (and val (= val query))
      (tset matches id entry)))
  matches)
(fn data.set-entry-key [file id key value]
  (local entry (data.find-entry file id))
  (tset entry key value)
  (data.set-entry file id entry))

data
