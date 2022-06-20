(fn gos.data.read [file]
  (gos.util.load file {}))
(fn gos.data.write [file contents]
  (gos.util.save contents file))
(fn gos.data.set-entry [file id details]
  (local contents (gos.data.read file))
  (tset contents id details)
  (gos.data.write file contents))
(fn gos.data.find-entry [file id]
  (. (gos.data.read file) id))
(fn gos.data.find-entry-by-key [file key query]
  (local contents (gos.data.read file))
  (local matches [])
  (each [id entry (pairs contents)]
    (local val (. entry key))
    (when (and val (= val query))
      (tset matches id entry)))
  matches)
(fn gos.data.set-entry-key [file id key value]
  (local entry (gos.data.find-entry file id))
  (tset entry key value)
  (gos.data.set-entry file id entry))
