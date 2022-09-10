(local data (require :data))
(local util (require :util))

(local projects {})

(fn projects.make-project [name ?details]
  (local project (or ?details {}))
  (set project.name name)
  (when (not project.id)
    (set project.id (util.make-id (util.scan-directory :projects nil :f true))))
  (when (not project.tasks)
    (set project.tasks {}))
  (projects.save-project project)
  project)

(fn projects.save-project [project]
  (data.write-file project (.. :projects/ project.id)))

(fn projects.load-project [id]
  (data.read-file (.. :projects/ id)))

(fn projects.list-projects [?projects]
  (local projects-data (or ?projects (data.read-folder :projects)))
  (each [_ project (pairs projects-data)]
    (print (.. project.id ": " project.name))))

(fn projects.add-task [project task]
  (table.insert project.tasks task))

(fn projects.list-tasks [project]
  (each [place task (pairs project.tasks)]
    (print (.. place ": " task.act
               (if task.deadline
                   (.. " [Deadline:  " (util.render-time task.deadline "]"))
                   "")))))

(fn projects.set-task-deadline [project task deadline]
  (tset (. project.tasks task) :deadline (util.parse-time deadline)))

projects
