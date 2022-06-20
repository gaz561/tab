(local fennel (require :fennel))
(local util {})

(fn util.find-element [seq query]
  (let [matched []]
    (each [_ element (pairs seq)]
      (when (= element query)
        (table.insert matched element)))
    (if (> (length matched) 0) true nil)))

(fn util.load [path ?fallback]
  (local file (io.open (.. path ".fnl") :r))
  (if file
      (fennel.eval (file:read "*all"))
      (if ?fallback
          (do
            (util.save ?fallback path)
            (util.load path)))))
(fn util.save [data path]
  (local file (io.open (.. path ".fnl") :w))
  (file:write (fennel.view data))
  (file:close))

(fn util.make-id [?existing]
  (fn gen-id [x]
    (let [r (- (math.random 16) 1)
          p (or (and (= x :x) (+ r 1)) (+ (% r 4) 9))]
      (: :0123456789abcdef :sub p p)))
  (let [gen (: :xxxxxxxx :gsub "[xy]" gen-id)]
    (print "generated" gen)
    (if (util.find-element (or ?existing []) gen)
        (util.make-id ?existing)
        gen)))

(fn util.make-string-appender [?sep]
  "Return a function that holds a string and accepts one atctional argument (string or list of strings). If provided, the argument is appended to the held string, with SEP appended (to each one, if its a list of strings.)"
  (var o "")
  (lambda [?a]
    (lambda q [r]
      (set o (.. o r (or ?sep ""))) o)
    (if ?a
        (if (= (type ?a) :string)
              (q ?a)
              (each [_ v (pairs ?a)]
                (q v)))
        o)))

(fn util.add-values [tab vals]
  (each [k v (pairs vals)]
    (tset tab k v))
  tab)

(fn util.clone-table [tab ?new-values]
  (local clone {})
  (util.add-values clone tab)
  (when ?new-values (util.add-values clone ?new-values))
  clone)

(fn util.quibble-strings [strings ?resort ?oxfordize]
  "Return the sequence of STRINGS separated with commas and the conjunction 'and'. ?OXFORDIZE is currently irrelevant; strings are oxfordized by defualt."
  (let [oxfordize (or ?oxfordize true)
        o (util.make-string-appender)]
    (when ?resort (table.sort strings))
    (var join "")
    (for [count 1
          (length strings) 1]
      (if (= count (length strings))
          (set join "")
          (= count (- (length strings) 1))
          (set join
               (.. (if (and oxfordize
                            (> (length strings) 2))
                       ","
                       "")
                   " and "))
          (set join ", "))
      (o [(. strings count) join]))
    (o))) 

(lambda util.render-time [time]
  (os.date "%Y%m%d:%H%M%S" time))

util
