;;;; Web server behaviors

(local tab (require :tab))

(local socket (require :socket))

(fn ld [server]
  "Load the Web SERVER"
  (tab.log :debug (.. "Loading " (server:fname)))
  (tab.log :info (.. "Loaded " (server:fname) " - didn't actually do anything"))
  nil)

(fn start [server]
  "Start the Web SERVER. Binds to the port in its dimension's conf, or 8042."
  (let [web-port (or server.dimension.conf.web-port 8042)]
    (tab.log :debug (.. "Starting " (server:fname) " on port " web-port))
    (set server.socket (assert (socket.tcp)))
    (assert (server.socket:bind "*" web-port))
    (server.socket:listen 2)
    (server.socket:settimeout 0.001)
    (server.dimension.timer:schedule
     (partial server.tick server))
    (tab.log :info (.. "Started " (server:fname) " on port " web-port))))

(fn make-http [server content]
  (string.format
   (.. "HTTP/1.1 200 OK\r\n"
       "Content-Type: text/html; charset=UTF-8\r\n"
       "Content-Length: %d\r\n\r\n"
       "%s")
   (length content)
   content))

(fn make-html [server content]
  (string.format
   (.. "<!doctype html>"
       "<html>"
       "<title>MarMUD Web Document</title>"
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

(fn render-homepage [server]
  "BLOOOP")

(fn parse-request [server connection request]
  (fn send [response]
    (connection:send (server:make-http
                      (server:make-html response))))
  (let [sreq (tab.split-string request)
        req-type (. sreq 1)
        req-path (. sreq 2)
        req-form (. sreq 3)]
    (if (= req-path :/)
        (send (server:render-homepage))
        (= (string.sub req-path 1 8) :/things/)
        (if (= (string.sub req-path 9 14) :areas/)
            (if (= (length req-path) 14)
                (send (server:render-things
                       (tab.filter-things server.dimension.things
                                          (fn [thing] (. thing :exits)))
                       [:exits]))
                (let [area (server.dimension.map:find-area
                            (string.sub req-path 15))]
                  (if area
                      (send (server:render-thing area [:exits]))
                      (send "AREA *NOT* FOUND"))))
            (= (string.sub req-path 9 15) :groups/)
            (send "groups go here!")
            (if (= (length req-path) 8)
                (send (server:render-things
                       server.dimension.things))
                (send "things not found!")))
        (send (.. "TYPE: " req-type "<br/>"
                         "path: " req-path "<br/>"
                         "FORM: " req-form "<br/>"
                         )))))

(fn tick [server]
  (let [new-conn (server.socket:accept)]
    (when new-conn
      (tab.log :debug (server:fname) " is receiving a new connection")
      (match (new-conn:receive)
        (_ err) (tab.log :warning (.. "Error receiving new connection to "
                                      (server:fname) ": " err))
        request (server:parse-request new-conn request))))
  (when server.dimension
    (server.dimension.timer:schedule (partial server.tick server))))

{:load ld
 : start : tick
 : make-http : make-html
 : parse-request
 : render-homepage
 : render-thing : render-things}
