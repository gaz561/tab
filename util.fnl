(local fennel (require :fennel))
(local util {})

(fn util.find-element [seq query]
  (let [matched []]
    (each [_ element (pairs seq)]
      (when (= element query)
        (table.insert matched element)))
    (if (> (length matched) 0) true nil)))

(lambda util.scan-directory [path ?recurse ?type ?strip-ext]
  (local matches {})
  (local A (util.make-string-appender))
  (A ["find \"" path "\""])
  (when (not ?recurse) (A " -maxdepth 1"))
  (when ?type (A [" -type " ?type]))
  (let [results (io.popen (A))]
    (each [result _ (results:lines)]
      (let [line (string.sub result (+ 2 (length path)))]
        (when (> (length line) 0)
          (table.insert matches (if ?strip-ext
                                    (: line :sub 0 -5)
                                    line))))))
  matches)

(fn util.load-file [path ?fallback]
  (local file (io.open (.. path ".fnl") :r))
  (if file
      (fennel.eval (file:read "*all"))
      (if ?fallback
          (do
            (util.save-file ?fallback path)
            (util.load-file path)))))

(fn util.save-file [data path]
  (local file (io.open (.. path ".fnl") :w))
  (file:write (fennel.view data))
  (file:close))

(fn util.load-folder [path]
  (local files-data {})
  (each [_ file-path (pairs (util.scan-directory path nil :f))]
    (local id (: file-path :sub 0 -5))
    (tset files-data id (util.load-file (.. path :/ id))))
  files-data)

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

(fn util.collect-keys [tbl]
  "Return a list of the keys in TBL."
  (icollect [key _ (pairs tbl)] key))

(fn util.add-values [tab vals]
  (each [k v (pairs vals)]
    (tset tab k v))
  tab)

(fn util.clone-table [tab ?new-values]
  (local clone {})
  (util.add-values clone tab)
  (when ?new-values (util.add-values clone ?new-values))
  clone)

(fn util.clone-sequence-without-nils [seq]
  (local stripped [])
  (each [key val (pairs seq)]
    (when val (table.insert stripped val)))
  stripped)

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

(lambda util.parse-time [str ?par]
  (let [p (or ?par
              "(%d%d%d%d)(%d%d)(%d%d):(%d%d)(%d%d)")
        (year month day hour min) (str:match p)
        offset (- (os.time)
                  (os.time (os.date :!*t)))
        sec 0]
    (+ (os.time
        {: day : month : year : hour : min : sec})
       offset)))

(lambda util.render-time [time]
  (os.date "%Y%m%d:%H%M%S" time))

util
