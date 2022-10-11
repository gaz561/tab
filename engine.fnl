(local util (require :util))

{:name "MarMUD"
  :conf (require :conf)
  :things []
  :log-levels {:critical 1 :error 2
               :warning 3 :info 4
               :debug 5 :spam 6}
  :log
  (fn [engine level message]
    (local time (os.time))
    (fn print-msg []
      (when (not (= engine.last-log-print time))
        (set engine.last-log-print time)
        (print (util.render-time time)))
      (print (.. level
                 (if (= level :error) ":    "
                     (if (= level :warning) ":  "
                         (if (= level :info) ":     "
                             (if (= level :debug) ":    "
                                 (if (= level :spam) ":     "
                                     ": ")))))
                 message)))
    (when (>= (. engine.log-levels engine.conf.log-level)
              (. engine.log-levels level))
      (print-msg)))
  :lookup-behavior
  (fn [engine key behavior-name]
    (. (util.load-file (.. :behaviors/ behavior-name)) key))
  :lookup-behavior-method
  (fn [engine thing key]
    (util.find-by thing.behaviors (partial engine.lookup-behavior engine key)))
  :make-thing
  (fn [engine model ?attributes]
    (local thing
           (util.clone-table
            (util.load-file (.. :models/ model) ?attributes)))
    (setmetatable thing {:__index (partial engine.lookup-behavior-method engine)})
    (when ?attributes (each [key val (pairs ?attributes)] (tset thing key val)))
    (table.insert engine.things thing)
    thing)
  :load
  (fn [engine]
    (set engine.name (or engine.conf.name "engine"))
    (engine:log :debug (.. "Loading " engine.name))
    (each [_ mod (pairs [:map :server :users :timer])]
      (tset engine mod (engine:make-thing mod))
      (let [m (. engine mod)]
        (when m.load
          (m:load engine))))
    (set engine.loaded true)
    (engine:log :info (.. "Loaded " engine.name)))
  :start
  (fn [engine]
    (if engine.loaded
        (do
          (engine:log :debug (.. "Starting " engine.name))
          (each [_ mod (pairs [:map :server])]
            (: (. engine mod) :start))
          (set engine.started true)
          (engine:log :info (.. "Started " engine.name)))
        (do
          (engine:log :error (.. "Failed to start " engine.name
                                 "; load it first")))))
  :run
  (fn [engine]
    (if engine.started
        (do
          (engine:log :debug (.. "Running " engine.name))
          (engine.timer:run))
        (do
          (engine:log :error (.. "Failed to run " engine.name
                                 "; start it first")))))
  :lsr
  (fn [engine]
    (engine:load)
    (engine:start)
    (engine:run))}
