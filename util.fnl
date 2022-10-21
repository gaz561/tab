(local util {:fennel (require :fennel)})

;;; Utilities used by other utilities

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

(fn util.find-element [seq query]
  (let [matched []]
    (each [_ element (pairs seq)]
      (when (= element query)
        (table.insert matched element)))
    (if (> (length matched) 0) true nil)))

(fn util.find-by [tbl f ?i]
  (let [x (. tbl (or ?i 1))]
    (if (= nil x) nil
        (or (f x)
            (util.find-by tbl f (+ 1 (or ?i 1)))))))

;;; Data

(fn util.scan-directory [path ?recurse ?type ?strip-ext]
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

(fn util.save-file [data path]
  (let [save-file (io.open (.. path ".fnl") :w)]
    (save-file:write (util.fennel.view data))
    (save-file:close)
    true))

(fn util.load-file [path ?fallback]
  (let [load-file (io.open (.. path ".fnl") :r)]
    (if load-file
        (let [loaded-data (load-file:read "*all")]
          (util.fennel.eval loaded-data))
        (if ?fallback
            (do
              (util.save-file ?fallback path)
              (util.load-file path))
            (print (.. "No file at " path
                       " and no fallback given. Failed to load."))))))
(fn util.load-folder [path]
  (local files-data {})
  (each [_ file-path (pairs (util.scan-directory path nil :f))]
    (local id (: file-path :sub 0 -5))
    (tset files-data id (util.load-file (.. path :/ id))))
  files-data)

;;; Tables

(fn util.collect-keys [tbl]
  "Return a list of the keys in TBL."
  (icollect [key _ (pairs tbl)] key))

(fn util.invert-table [tab]
  (local inv {})
  (each [k v (pairs tab)]
    (tset inv v k))
  tab)

(fn util.add-values [tab vals]
  (each [k v (pairs vals)]
    (tset tab k v))
  tab)

(fn util.remove-value [tab val]
  (each [key value (pairs tab)]
    (when (= value val)
      (table.remove tab key)))
  tab)

(fn util.drop-dupes [seq]
  (local clean {})
  (each [key val (pairs seq)]
    (when (not (util.find-element clean val))
      (table.insert clean val)))
  clean)

(fn util.clone-table [tab ?new-values]
  (local clone (collect [k v (pairs tab)] k v))
  (when ?new-values
    (util.add-values clone ?new-values))
  clone)

(fn util.merge-tables [base addn ?clone]
  (collect [k v (pairs addn)
            :into (if ?clone
                      (util.clone-table base)
                      base)]
    k v))

(fn util.merge-models [base addn]
  (when (not addn.behaviors) (set addn.behaviors []))
  (local merger (util.merge-tables base addn true))
  (each [_ beh (pairs base.behaviors)]
    (table.insert merger.behaviors beh))
  (set merger.behaviors (util.drop-dupes merger.behaviors))
  merger)

(fn util.clone-sequence-without-nils [seq]
  (local stripped [])
  (each [key val (pairs seq)]
    (when val (table.insert stripped val)))
  stripped)

;;; Strings

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

;;; Time stuff

(fn util.render-time [time]
  (os.date "%Y%m%d:%H%M" time))

;;; Things
(fn util.lookup-behavior [key behavior-name]
   (. (util.load-file (.. :behaviors/ behavior-name)) key))
(fn util.lookup-behavior-method [thing key]
   (util.find-by thing.behaviors (partial util.lookup-behavior key)))
(fn util.make-thing [model ?attributes ?engine]
   (local thing
          (util.clone-table
           (util.load-file (.. :models/ model) ?attributes)))
   (setmetatable thing {:__index util.lookup-behavior-method})
   (when ?attributes (each [key val (pairs ?attributes)] (tset thing key val)))
   (when ?engine (table.insert ?engine.things thing))
   thing)


util
