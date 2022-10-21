(local util (require :util))
{:log
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
   (when (>= (. engine.log-levels engine.log-level)
             (. engine.log-levels level))
     (print-msg)))
 :make-thing
 (fn [engine thing ?attr]
   (util.make-thing thing ?attr engine))
 :load
 (fn [engine]
   (engine:log :debug (.. "Loading " engine.name))
   (each [_ mod (pairs engine.services)]
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
         (each [_ mod (pairs engine.services)]
           (when (. (. engine mod) :start)
             (: (. engine mod) :start)))
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
