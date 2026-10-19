;;;; library handler behaviors

(local tab (require :tab))

(fn ld [library]
  (let [make (if library.dimension
                 (partial library.dimension.make-thing library.dimension)
                 tab.make-thing)]
  (each [num item (pairs library.items)]
    (tset library.items num (make :library/item item)))))

(fn publish-library [library]
  (when (not library.loaded?) (library:load))
  (if library.library-publish-path
      (let [pub-file (assert (io.open (.. library.library-publish-path ".html") :w))
            content (library:render-library library.items)]
        (pub-file:write (library:make-html content library.name))
        (pub-file:flush))
      (tab.log :error "failed to publish library, no library-publish-path")))

{:load ld
 : publish-library}
