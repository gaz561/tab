;;;; area behaviors

(local tab (require :tab))

(fn search-area [area term ?matches]
  (let [matches (or ?matches [])]
    (tab.search-things-by-term area.contents term matches)
    (tab.search-things-by-term area.lookables term matches)
  matches))

{: search-area}
