(local socket (require :socket))
(local timer {:count 0 :rate 0.2 :events []})

(fn timer.run [timer]
  (timer:tick)
  (socket.select nil nil (or timer.rate 0.2))
  (timer:run))
(fn timer.schedule [timer event]
  (table.insert timer.events event))
(fn timer.tick [timer]
  (set timer.count (+ timer.count 1))
  (let [current-events timer.events]
    (set timer.events [])
    (each [_ event (pairs current-events)] (event))))
timer
