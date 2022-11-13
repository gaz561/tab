;;;; timer system behaviors

(local socket (require :socket))
(local tab (require :tab))

(local fennel (require :fennel))
(fn view [what]
  (print (fennel.view what)))

(fn schedule [timer event ?delay]
  (let [delay (or ?delay 1)]
    (if (. timer.events delay)
        (table.insert (. timer.events delay) event)
        (tset timer.events delay [event]))))

(fn tick [timer]
  (set timer.count (+ timer.count 1))
  (let [current-events (. timer.events 1)]
    (tset timer.events 1 nil)
    (let [ old-schedule (tab.clone-table timer.events)]
      (each [moment events (pairs old-schedule)]
        (tset timer.events moment nil)
        (tset timer.events (- moment 1) events)))
    (when current-events
      (each [_ event (pairs current-events)]
        (event)))))

(fn run [timer]
  (timer:tick)
  (socket.select nil nil (or timer.rate 0.2))
  (timer:run))

{: schedule : tick : run}
