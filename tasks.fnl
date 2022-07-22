(local util (require :util))

(fn add-task [task-list task ?details]
  (local deets (or ?details {}))
  (tset deets :task task)
  (table.insert task-list deets))
