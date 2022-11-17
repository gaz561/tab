{:title "An overview of the GOS"
 :date "2022-09-13:1330"
 :meta {:type :grumbling
        :author :emsenn
        :sequence 23
        :status [:draft]}
 :contents "
Maybe you've heard me talk about the Groundhog Operating System (GOS) before, maybe you haven't: either way this'll be more detailed a look at what's going on than anyone has probably seen. 

There's gonna be a lot of jargon in this; I think its unavoidable.

There's a few systems that weave together to make the GOS - and surely more to come later. Each lives in its own file. A lot rely on data, that's stored in a folder alongside those code files. (The data in that folder is stored in folders and subfolders and files - it gets messy.)

Here's a rundown of the current systems:

Heres's a list of the current systems:
- data.fnl
  - read and write from the files in the data folder
- herbalism.fnl
  - interpet plant, symptom, and sometimes inventory data to present possible treatments
- inventory.fnl
  - interprets inventory data, which is a form of ledger
- ledger.fnl
  - interprets ledger data
- mud-client.fnl
  - creates a virtual thing that represents a user connected to the MUD server
- mud-server.fnl
  - creates and runs the MUD server, one of the interfaces to the system
- plants.fnl
  - interprets plant data
- projects.fnl
  - interpret project and task data
- symptoms.fnl
  - interpret symptom data
- tasks.fnl
  - interprets tasks
- timer.fnl
  - handles a timer, mostly for the MUD server
- users.fnl
  - handles user profiles

(There's also util.fnl that holds a bunch of utility functions used throughout the systems.)

This might all sound really complicated, but its just a bunch of specific ways of dealing with lists and tables: the herbalism system might look at our inventory to see what materials might be combined for a treatment, but that just means looking if items in the list of possible materials are in the list of available materials and discarding those that aren't. and the inventory system just provides some context for interpreting the answers a ledger system gives when it reads a ledger data file."}
