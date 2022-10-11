(local util (require :util))
(util.clone-table
 (util.load-file :models/thing)
 {:name "User Accountant"
  :behaviors [:users]
  :data-folder :data/users
  :user-data {}})
