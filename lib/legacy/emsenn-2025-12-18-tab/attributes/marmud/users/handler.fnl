{:name "MarMUD users handler"
 :base :users/handler
 :users-folder :marmud/users/directory
 :default-system-relationships {:talker [:client]
                                :users [:user]}}
