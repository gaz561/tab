(local util (require :util))

(local tasks {})

(fn tasks.make-task [act ?details]
  (local task (or ?details {}))
  (set task.act act)
  task)

tasks
