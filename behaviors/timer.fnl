(local socket (require :socket))
{:schedule
 (fn [timer event]
   (table.insert timer.events event))
 :tick
 (fn [timer]
   (set timer.count (+ timer.count 1))
   (let [current-events timer.events]
     (set timer.events [])
     (each [_ event (pairs current-events)]
       (event))))
 :run
 (fn [timer]
   (timer:tick)
   (socket.select nil nil (or timer.rate 0.2))
   (timer:run))}
