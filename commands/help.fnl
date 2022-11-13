;;;; help command

(fn help [client input]
  (print input)
    (match input
      (where (or nil "")) (client:message "You are a client, a 'person' within the virtual reality created by TABby. You interact with the reality by inputting commands, which the computer interprets, reacts to, and then sends you back some sort of response. You can see a list of your available commands by inputting `commands` and pressing ENTER. To see a list of topics you can receive help with, try `help list`")
      "list" (client:message
              (.. "You can receive help on the various topics:\n"
                  "System concepts: mud, tabby, users\n"
                  "Virtual regions: okaga\n"))
      "mud" (client:message "'MUD' stands for Multi-User Dimension, and is the name for this kind of computer software - a server where clients connect and send text commands and receive text responses.")
      "okaga" (client:message "The Okaga is a fake starship that serves as a space 'between' other virtualized areas.")
      "tabby" (client:message "TABby is the name of our MUD engine, the code that makes our MUD work. It stands for Things with Attributes and Behaviors.")
      "users" (client:message "In addition to anonymous clients, there are user accounts. You can login with the `login` command, i.e. `login sam landback`")
      _ (client:message "There's no help for that topic, sorry.")))
