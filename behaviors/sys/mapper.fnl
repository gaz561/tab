;;;; mapper system behaviors
(local tab (require :tab))

(fn ld [mapper dimension]
  (each [_ model (pairs dimension.conf.area-list)]
    (tset mapper.areas model (dimension:make-model model))
    (let [area (. mapper.areas model)]
      (when area.lookables
        (each [num lookable-model (pairs area.lookables)]
          (let [lookable (dimension:make-model :vr/lookable lookable-model)]
            (tset area.lookables num lookable))))))
  (set mapper.loaded? true))

(fn find-area [mapper id]
  (local matches [])
  (each [aid area (pairs mapper.areas)]
    (when (= aid id)
      (table.insert matches area)))
  (. matches 1))

{:load ld
 : find-area}
