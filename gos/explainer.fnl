{:title "Explaining the Groundhog Operation System"
 :content "
Computers are way more complicated than they need to be.

Often, all a person needs is some sort of spreadsheet, and some sort of way to poke around the data in the spreadsheet. Yet what we have, often makes that so complicated its basically impossible.

The Groundhog Operating System is my attempt to approach computers without all the metaphors and abstractions that seem to get in the way of actually using them.

It exists inside whatever operating system you normally use - Linux or Android or Windows or whatever - as a folder of different files. Broadly speaking, there's two things in the folder:

- Code files, at the top level, with pre-written functions for working with
- Data files, located in various subfolders.

Each folder of data files generally contains one sort of data - information on plants, or a list of books in someone's library.

And then there's a code file that matches up with that data file. (Or, a code file might rely on a few types of data file at once. I'm not sure yet.

This makes it fairly easy (I hope) for folk to add onto the system as they want - just add your own folder for a new sort of data, and then a code file for interpretting it.

Aside from these data and code files, there's the MUD - the system for hosting a telnet-accessible server that provides a (limited) interface for the other code files. This helps make the system more accessible to folk who aren't programmers, but more importantly, lets us set up abstractions as we want without them being a part of the core system or getting in the way of that interface."}
