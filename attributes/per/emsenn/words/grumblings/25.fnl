{:title "Looking to implement Teraum"
 :date "2022-10-30:0948"
 :meta {:type :grumbling
        :author :emsenn
        :sequence 25
        :status [:draft]}
 :contents "
The other day I was playing a bit of Disco Elysium as a way to try and take a bit of a vacation, and while it's been very fun, it also has me wanting to really work on the game side of the MUD. It doesn't help that feeling that someone was telling me about the table-top role-play campaign they're doing with friends.

But there's a few practical things I need to do to improve areas, I think, before I can neatly start adding in what I've already written for Teraum.

Looking at an older implementation of the Crossed Candles Inn done up in Racket (its an old code, but it checks out), the Inn itself has, like areas in Tabby already do, a name, description, exists, and contents, but it also has trivia - a list of strings with additional information about the thing.

The contents is a list of what are there called lookables, which in addition to having names and descriptions, have nouns and adjectives. A few also have actions - which a list of pairs, an integer and a string. (The integer presumably sets the chance, the string the result.)

There's also an NPC - specifically, a ghost.

Each of the room's contents is listed as a pointer toward a function, which itself points to what I think I was calling model-makers at that time.

With Tabby, I think the right thing to do, as much as there is one, is to start having models specify their base - either a single string, *the* model they're based on, or a sequence of strings, models that are built onto each other to form this one's base.

This'll mean changing how the model-handling utility functions work, but I don't think will break the engine; the things involved there use the existing utility functions to build themselves up like I just described.

If it isn't clear; the change is so that data files can continue to be purely tables of strings and integers (and nested versions of those), for easy human handling.

Once I've got it working, I'll start to add in areas of Teraum I wrote in earlier times. It isn't important toward the winter goal of setting up Tabby to host a community of affinity groups, but it gives me a means of escapism that isn't into consumerist spectacle, which I think I'll need if I want to achieve the mentioned goal.
"}
