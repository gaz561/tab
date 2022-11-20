;;;; TAB core functions

(local fennel (require :fennel))
(local conf (require :conf))

(local tab {:view fennel.view
            :eval fennel.eval
            :doc fennel.doc})

;;; Logging

(local log-levels {:critical 1 :error 2 :warning 3
                   :info 4 :debug 5 :spam 6})

(fn tab.log [level ...]
  {:fnl/docstring "Print MESSAGE (can be more than one string) if LEVEL is equal or greater to the configured log level."
   :fnl/arglist [level message]}
  (fn print-message [message]
    (print (.. (tab.render-time (os.time) true)
               "> " level
               (if (= level :error) ":    "
                   (if (= level :warning) ":  "
                       (if (= level :info) ":     "
                           (if (= level :debug) ":    "
                               (if (= level :spam) ":     "
                                   ": ")))))
               message)))
  (when (>= (. log-levels conf.log-level)
            (. log-levels level))
    (let [mtab (table.pack ...) ; message table
          A (tab.make-string-appender)]
      (set mtab.n nil)
      (each [_ str (pairs mtab)]
        (A str))
      (print-message (A)))))

;;; Strings

(fn tab.concat [...]
  (let [stab (table.pack ...)
        A (tab.make-string-appender)]
    (set stab.n nil)
    (each [_ str (pairs stab)]
      (A str))
    (A)))

(fn tab.make-string-appender [?sep]
  "Return a function that holds a string and accepts one atctional argument (string or list of strings). If provided, the argument is appended to the held string, with SEP appended (to each one, if its a list of strings.)"
  (var o "")
  (lambda [?a]
    (lambda q [r]
      (set o (.. o r (or ?sep ""))) o)
    (if ?a
        (if (or (= (type ?a) :string)
                (= (type ?a) :number))
            (q ?a)
            (each [_ v (pairs ?a)]
              (q v)))
        o)))

(fn tab.quibble-strings [strings ?resort ?oxfordize]
  "Return the sequence of STRINGS separated with commas and the conjunction 'and'. ?OXFORDIZE is currently irrelevant; strings are oxfordized by defualt."
  (let [oxfordize (or ?oxfordize true)
        o (tab.make-string-appender)]
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

(fn tab.split-string [string ?sep]
  (let [words []
        matcher (string.gmatch string (or ?sep "%S+"))]
    (var done? nil)
    (while (not done?)
      (let [word (matcher)]
        (if word
            (table.insert words word)
            (set done? true))))
    words))

(fn tab.make-id [?existing]
  (math.randomseed (os.time))
  (fn gen-id [x]
    (let [r (- (math.random 16) 1)
          p (or (and (= x :x) (+ r 1)) (+ (% r 4) 9))]
      (: :0123456789abcdef :sub p p)))
  (let [gen (: :xxxxxxxx :gsub "[xy]" gen-id)]
    (print "generated" gen)
    (if (tab.find-element (or ?existing []) gen)
        (tab.make-id ?existing)
        gen)))

;;; Time

(fn tab.render-time [time ?seconds]
  "Given a Lua timecode, renders it as YYYYMMDD:HHMM, appending ?SECONDS if true."
  (os.date (if ?seconds
               "%Y%m%d:%H%M%S"
               "%Y%m%d:%H%M")
           time))


;;; Files

(fn tab.scan-directory [path ?recurse ?type ?strip-ext]
  "Return a list of files & directories at PATH, ?RECURSE-ing if true, limited to Files or Directories if F or D are given as the TYPE, and ?STRIP-EXT if true removes the file extension from the file names in the returned list."
  (local matches {})
  (local A (tab.make-string-appender))
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

(fn tab.save-file [data path ?force]
  (tab.log :debug (.. "Saving data to " path))
  (match (io.open (.. path :.fnl) :w)
    sfile (do (sfile:write (fennel.view data))
              (sfile:close))
    (_ err) (if ?force
                (do (os.execute
                 (.. "mkdir "
                     (string.match path "(.*[/\\])")))
                    (tab.save-file data path))
                err)))

(fn tab.load-file [path ?fallback]
  "Return the evaluated contents at PATH, or the ?FALLBACK if there's no file at PATH. (Evaluated means, its been parsed by Fennel, i.e. if you load a file containing a table, load-file will return a table, not a string."
  (let [load-file (io.open (.. path ".fnl") :r)]
    (if load-file
        (let [loaded-data (load-file:read "*all")]
          (fennel.eval loaded-data))
        (if ?fallback
            (do
              (tab.save-file ?fallback path)
              (tab.load-file path))
            (print (.. "No file at " path
                       " and no fallback given. Failed to load."))))))

(fn tab.load-folder [path ?recurse]
  (local files-data {})
  (each [_ file-path (pairs (tab.scan-directory path ?recurse :f))]
    (local id (: file-path :sub 0 -5))
    (tset files-data id (tab.load-file (.. path :/ id))))
  files-data)

;;; Tables

(fn tab.collect-keys [tbl]
  "Return a list of the keys in TBL."
  (icollect [key _ (pairs tbl)] key))

(fn tab.list-values [tabs key]
  "Return a list of the values for KEY in each table in TABS."
  (let [lst []]
    (each [_ tab (pairs tabs)]
      (table.insert lst (. tab key)))
    (tab.drop-dupes lst)))

(fn tab.add-values [tab addn]
  (each [k v (pairs addn)]
    (tset tab k v)))

(fn tab.remove-value [tab val]
  (each [key value (pairs tab)]
    (when (= value val)
      (table.remove tab key)))
  tab)

(fn tab.clone-table [tab ?addn]
  (let [clone (collect [k v (pairs tab)] k v)]
    (when ?addn (tab.add-values clone ?addn))
    clone))

;;; Sequences

(fn tab.find-element [seq query]
  (let [matched []]
    (each [_ element (pairs seq)]
      (when (= element query)
        (table.insert matched element)))
    (if (> (length matched) 0) true nil)))

(fn tab.drop-dupes [seq]
  (local clean {})
  (each [key val (pairs seq)]
    (when (not (tab.find-element clean val))
      (table.insert clean val)))
  clean)

(fn tab.reverse-list [list]
  (let [rev []]
    (for [i (length list) 1 -1]
      (tset rev (+ (length rev) 1) (. list i)))
      rev))

(fn tab.find-by [tbl f ?i]
  (let [x (. tbl (or ?i 1))]
    (if (= nil x) nil
        (or (f x)
            (tab.find-by tbl f (+ 1 (or ?i 1)))))))

;;; Things

(fn tab.lookup-behavior [key behavior-name]
  (let [behavior-file (tab.load-file (.. :behaviors/ behavior-name))]
    (if behavior-file
        (. behavior-file key)
        (tab.log :error (.. "Failed to find behavior file" behavior-name)))))
(fn tab.lookup-behavior-method [thing key]
   (tab.find-by thing.behaviors (partial tab.lookup-behavior key)))

(fn tab.lookup-command [command]
  (tab.load-file (.. :commands/ command)))

(fn tab.load-attributes-file [attr-path]
  (tab.load-file (.. :attributes
                      :/ attr-path)))

(fn tab.clone-attributes-from-file [attr-path]
  (collect [k v (pairs (tab.load-attributes-file attr-path))] k v))

(fn tab.collect-bases [thing ?collection ?prefix]
  (let [collection (or ?collection [])]
    (when thing.base
      (if (= (type thing.base) :string)
          (let [model-name thing.base
                model (tab.load-attributes-file thing.base)]
            (when model.base
              (tab.collect-bases model collection true))
            (if ?prefix
                (table.insert collection 1 model-name)
                (table.insert collection model-name))
            (set thing.base nil))
          (= (type thing.base) :table)
          (for [i (length thing.base) 1 -1]
            (let [model-name (. thing.base i)
                  model (tab.load-attributes-file model-name)]
              (when model.base (tab.collect-bases model collection true))
              (if ?prefix
                  (table.insert collection 1 model-name)
                  (table.insert collection model-name)))
            (table.remove thing.base i)
            (when (= (length thing.base) 0) (set thing.base nil)))))
    collection))


(fn tab.merge-models [base addn]
  (fn merge-lists [start mergein]
    (each [_ item (pairs mergein)]
      (table.insert start item))
    (tab.drop-dupes start))
  (each [k v (pairs addn)]
    (if (or (and base.additive-attributes
                 (tab.find-element base.additive-attributes k))
            (and addn.additive-attributes
                 (tab.find-element addn.additive-attributes k)))
        (do (when (not (. base k)) (tset base k {}))
            (each [q p (pairs v)]
              (if (= (type q) :number)
                  (do (table.insert (. base k) p)
                      (tset base k (tab.drop-dupes (. base k))))
                  (tset (. base k) q p))))
        (= k :grammar)
        (do (when (not base.grammar) (set base.grammar {}))
            (each [q p (pairs v)]
              (when (or (= q :noun)
                        (= q :nouns))
                (when (not base.grammar.nouns) (set base.grammar.nouns [])))
              (if (= q :noun)
                  (table.insert base.grammar.nouns p)
                  (= q :nouns)
                  (set base.grammar.nouns (merge-lists base.grammar.nouns p))
                  (= q :adjectives)
                  (do (when (not base.grammar.adjectives) (set base.grammar.adjectives []))
                      (set base.grammar.adjectives (merge-lists base.grammar.adjectives p)))
                  (tset base.grammar q p))))
        (do (tset base k v))))
  base)


(fn tab.make-thing [attr-path ?addn ?dimension]
  {:fnl/docstring "Make the model found at MODEL-NAME, adding in the ?ADDITIONAL attributes if provided, and setting the made thing's ?DIMENSION if provided."
   :fnl/arglist [model-name ?additional ?dimension]}
  (let [made-thing {:additive-attributes [:additive-attributes :behaviors]}
        base-collection []
        model (if (= (type attr-path) :string)
                  (tab.clone-attributes-from-file attr-path)
                  attr-path)]
    (tab.collect-bases model base-collection)
    (when ?addn (tab.collect-bases ?addn base-collection))
    (let [clean-base-collection (tab.drop-dupes base-collection)]
      (tab.log :debug "Making a thing with this base collection: "
               (tab.quibble-strings clean-base-collection))
      (each [_ base-model-name (pairs clean-base-collection)]
        (tab.log :debug "Merging this model into the thing: " base-model-name)
        (tab.merge-models made-thing (tab.load-attributes-file base-model-name)))
      (tab.log :debug "Added base collection to thing."))
    (set model.base nil)
    (tab.merge-models made-thing model)
    (when ?addn
      (set ?addn.base nil)
      (tab.merge-models made-thing ?addn))
    (when (or (not made-thing.behaviors)
              (and made-thing.behaviors
                   (= (length made-thing.behaviors) 0)))
      (set made-thing.behaviors [:thing]))
    (set made-thing.behaviors (tab.drop-dupes made-thing.behaviors))
    (setmetatable made-thing {:__index tab.lookup-behavior-method})
    (when ?dimension (set made-thing.dimension ?dimension)
          (table.insert ?dimension.things made-thing))
    made-thing))

(fn tab.search-things-by-term [things term ?matches]
  "Search the list of THINGS by TERM, adding them to ?MATCHES (or a fresh list)."
  (let [matches (or ?matches [])]
    (each [_ item (pairs things)]
      (when (item:term=? term)
        (table.insert matches item)))
    matches))

(fn tab.filter-things [things filter-function ?matches]
  (let [matches (or ?matches [])]
    (each [_ thing (pairs things)]
      (when (filter-function thing)
        (table.insert matches thing)))
    matches))

tab
