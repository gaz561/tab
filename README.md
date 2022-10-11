# MarMUD
*in midst of a million nightmares, a hold on one dream*

***MarMUD*** is the working name of the MUD engine being built by and for the GAZ.


## Use

### Client

#### Understanding the system

MarMUD is a Multi-User Dimension:

- Multi-User means that more than one person can use it at a time: rather than the system running on your own computer, it runs on a server, and you are a client.
- Dimension means rather than serve up documents like a Web server, it maintains a virtualized environment that you interface with.

Within the dimension, you yourself are a virtual object - a person, capable of looking around virtual areas, moving between them, and interacting in various ways.

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

###### Map

###### Server

###### Tester

###### Thing

###### Timer

###### Users

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
