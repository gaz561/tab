# MarMUD
*in midst of a million nightmares, a hold on one dream*

***MarMUD*** is the working name of the MUD engine being built by and for the GAZ.


## Use

### Client

#### Understanding the system

MarMUD is a Multi-User Dimension:

- Multi-User means that more than one person can use it at a time: rather than running on your own computer, it runs on a server on the Internet.
- Dimension means rather than serve up documents like a Web server, it maintains a virtualized environment that you interface with.

Within the dimension, you yourself are a virtual object - a person, capable of looking around virtual areas, moving between them, and interacting in various ways.

    > look
	You look around.
	561 Garden, entrance
	  Mulch paths lead south to the rock
	garden and west to where fig trees grow surrounded by perennial herbs.
	What: irises, Virginia spiderwort, sedum
	Who: emsenn and Iris
	Exits: south and west

#### Connecting

	$ telnet localhost 4242

### Admin

#### Running the System

    $ make lsr

#### Building the System

    $ make gos-bin

#### Understanding the System

There's a central engine, that spawns "things", which are based on models that specify one or more sets of behavior. Models basically set up the schema for a given type of information, and behaviors determine how that info, when vitualized as a thing, can act.

##### Models

This section is a list of the various models we've already set up.

###### Area

An area is like, a bit of space, like a back porch or a street block. Areas have Area behaviors, as well as:

- contents, a list of things that are considered "in" the area.
- exits, a table of the directions one might move, and the area they would move to.

###### Client

When someone connects to the Server, a Client thing is made and associated with the connection.

###### Map

A Map is a collection of Areas.

###### Server

The Server is what handles accepting TELNET connections, sending them text, accepting their commands, etc.

###### Tester

The Tester thing is for testing out new stuff.

###### Thing

The Thing is the basic thing, that others base themselves on.

Things have:

- a `name`, a string that is how to refer to them
- a `description`, a longer description of what the thing is.

###### Timer

A Timer handles the scheduling of "events", functions that get called at some point in the future. I.e., a Server schedules a "tick" event every tick, when a Client moves to a new Area, the movement is scheduled.

###### Users

The Users thing handles user accounts.

##### Behaviors

###### Area

###### Client

###### Map

###### Server

###### Tester

###### Timer

###### Users

## Plans
### Soon
- [ ] Add a talker (chat channels)
- [ ] Add a reference library
- [ ] Add user profiles
  - [ ] Add `finger` command (lol, but its tradish)
### Later
- [ ] Add colours to the MUD output
### Someday
- [ ] Add MXP, MSSP, etc., support
