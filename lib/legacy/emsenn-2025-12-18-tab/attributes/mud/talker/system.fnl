;;;; talker model

{:name "talker system"
 :base :sys/basic
 :behaviors [:mud/talker/system]
 :description "The talker is a system for letting MUD clients communicate with each other."
 :channels [:one :two]}
