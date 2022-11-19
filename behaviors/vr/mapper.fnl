;;;; mapper system behaviors
(local tab (require :tab))

(fn ld [mapper dimension]
  (each [_ model (pairs mapper.area-list)]
    (tab.log :debug "Making area " model)
    (tset mapper.areas model (dimension:make-thing model))
    (let [area (. mapper.areas model)]
      (when area.lookables
        (each [num lookable-model (pairs area.lookables)]
          (let [lookable (dimension:make-thing :vr/lookable lookable-model)]
            (tset area.lookables num lookable))))
      (when area.contents
        (let [model-contents (tab.clone-table area.contents)]
          (set area.contents [])
          (each [_ model (pairs model-contents)]
          (let [object (dimension:make-thing :vr/object model)]
            (object:move area)))))))
  (set mapper.loaded? true))

(fn find-area [mapper id]
  (local matches [])
  (each [aid area (pairs mapper.areas)]
    (when (= aid id)
      (table.insert matches area)))
  (. matches 1))

{:load ld
 : find-area}
