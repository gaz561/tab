;;;; MUDSocket client model

{:name "MUD client"
 :base :vr/object
 :behaviors [:mud/client]
 :additive-attributes [:command-list]
 :command-list [:chat :commands :help :login :quit :who :whoami]
 :buffer ""}
