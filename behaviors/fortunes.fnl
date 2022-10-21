(local util (require :util))

{:load
 (fn [fortunes engine]
   (engine:log :debug (.. "Loading " fortunes.name))
   (set fortunes.engine engine)
   (set fortunes.fortunes (util.load-file fortunes.data-file)))
 :get-fortune
 (fn [fortunes]
   (. fortunes.fortunes (math.random (length fortunes.fortunes))))}
