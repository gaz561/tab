;;;; HTML builder behaviors

(local tab (require :tab))

(fn make-html [server content ?title]
  (string.format
   (.. "<!doctype html>"
       "<html>"
       "<title>" (or ?title
                     "MarMUD Web Document")
       "</title>"
       "<body>%s</body></html>")
   content))

(fn render-thing [server thing ?attributes]
  (let [A (tab.make-string-appender "<br/>")]
    (A (.. "<h3>" (thing:fname) "</h3>"))
    (A (thing:describe))
    (when ?attributes
      (each [_ attr (pairs ?attributes)]
        (when (. thing attr)
          (A (.. attr ": " (tab.view (. thing attr)))))))
    (A)))

(fn render-things [server things ?attributes]
  (let [A (tab.make-string-appender "<br/>")]
    (each [_ thing (pairs things)]
      (A (server:render-thing thing ?attributes)))
    (A)))

{: make-html
 : render-thing : render-things}
