(local object {})

(fn object.move [object destination]
  (destination:receive-object))
