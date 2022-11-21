# TAB
*Things with Attributes and Behaviors*

> ***TAB*** is a system for structuring information to allow for computed analysis & manipulation.

TAB uses the Fennel programming language to establish a set of constructs to provide a framework for operations: A *thing* is *made* from a *model* defining the thing's *attributes* and *behaviors*.

***Note:*** TAB is currently in the earliest stages of development, and is created as a hobby-project. Code is incomplete, buggy, likely to change, and unlikely to ever be suitable for use by others.

## Getting Started

To use TAB, you'll need Lua & Git installed on your system.

	$ make tab-bin
	
Once that's done, you can start the Fennel REPL with the `fennel` command, and from there you can load in TAB and start making things:

```
>> (local tab (require :tab))
nil
>> (local apple (tab.make-thing :vr/object {:name :apple}))
nil
>> (local backpack (tab.make-thing :vr/container {:name :backpack}))
nil
>> backpack.contents
[]
>> (apple:move backpack)
nil
>> (tab.list-values backpack.contents :name)
["apple"]
```

## Map of Models

```mermaid
graph TD
    subgraph TAB
        thing
        subgraph Misc
            misc/history
        end
        subgraph MUD
            mud/client
            mud/server
            subgraph Talker
                mud/talker/client
                mud/talker/system
            end
        end
        subgraph Organization
            org/profile
        end
        subgraph Systems
            sys/basic
            sys/dimension
            sys/help
            sys/timer
        end
        subgraph Users
            users/handler
			users/user
            subgraph MUD
                users/mud/client
            end
        end
        subgraph Virtual Reality
            vr/animation
            vr/area
            vr/container
            vr/lookable
            vr/mapper
            vr/massive
            vr/mobile
            vr/noisemaker
            vr/notable
            vr/object
            vr/person
            vr/trivial
            subgraph MUD
                vr/mud/client
            end
        end
    end
    thing
    thing --> misc/history
    thing --> org/profile
    thing --> sys/basic
    thing --> vr/lookable
    thing --> vr/massive
    thing --> vr/notable
    thing --> vr/object
    thing --> vr/trivial
	misc/history --> users/user
    mud/client --> mud/talker/client
    mud/client --> users/mud/client
    mud/client --> vr/mud/client
    sys/basic --> mud/server
    sys/basic --> mud/talker/system
    sys/basic --> sys/dimension
    sys/basic --> sys/help
    sys/basic --> sys/timer
    sys/basic --> users/handler
    sys/basic --> vr/animation
    sys/basic --> vr/mapper
    sys/basic --> vr/noisemaker
    vr/container --> vr/area
    vr/mobile --> vr/person
    vr/object --> mud/client
    vr/object --> vr/mobile
    vr/object --> vr/mud/client
```
