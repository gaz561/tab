{:name "TAB as a note-taking tool"
 :base :lib/doc
 :author :emsenn
 :history [{:time 1668528417
            :event "Started drafting"}
           {:time 1668530012
            :event "Finished drafting"}
           {:time 1668530058
            :event "Published to GAZ Forum"}]
 :docmeta {:type :grumbling
           :sequence 26
           :tags [:TAB :note-taking]}
 :contents "
In this grumbling I'm going to talk about TAB, our software for modeling information and its relationships, from the perspective of a note-taking tool.

It's not an arbitrary perspective; TAB was created in part out of a frustration with existing note-taking software not accommodating computers' capabilities for quantification and, well, computing.

For some context, and to set up our jargon, I'm gonna share some of what Wikipedia says about notes. Here's an explanation of what note-taking *is*:

> The person taking notes must acquire and filter the incoming sources, organize and restructure existing knowledge structures, comprehend and write down their explanation of the information, and ultimately store and integrate the freshly processed material. The result is a knowledge representation, and a memory storage.

There's lots of ways to do this with paper or computers, the way that's relevant to us here is what's known as a *card file*, or *Zettelkasten*:

> A card file consists of small items of information stored on paper slips or cards that may be linked to each other through subject headings or other metadata such as numbers and tags... In the 1980s, the card file began to be used a as metaphor in... personal knowledge base software... In the 1990s, such software inspired the invention of wikis.

So rather than notes taking the form of *Notes on Grasses* and being a linear description of different kinds of grasses, it would be a catalog of notes, each about a grass, and then the catalog itself would be a note that lists the reference ID of each grass.

I dunno how much sense this makes if you're not familiar with note-taking: it's the difference between using a spiral notebook and taking notes on a lecture and then those being your notes, and using a series of index cards that you can then rearrange or write meta-notes about.

If you just need the notes for a moment, the former is more than adequate, but if you are trying to integrate the note information into any sort of system, especially complex (compound) systems, breaking the info up into discrete chunks is helpful.

TAB is basically a card file note-taking system, where instead of notes living on index cards, each one lives in a computer file.

Each file - each note - is a table, an association of some *key* with some *value. A note about a new friend I've met might be:

| Key   | Value                       |
|-------|-----------------------------|
| name  | Sam                         |
| age   | 44                          |
| about | A fictional example person. |

The file itself actually looks like this, though:

```
{:name :Sam
 :base :info/person
 :age 44
 :about 'A fictional example person.'}
```

(Well, with double-quotes instead of single-.)

By storing our data in a table, under specific keys, we can work with it in various ways, and even build systems that automate certain parts of that work, i.e. looking for every person that's over the age of 40.

This adds a new work to taking notes: describing not just the information, but what the information means... and establishing the context to make that meaning, mean something.

Kind of lost steam for this explanation, but I just wanted to highlight that while TAB might seem like an impossibly complicated conglomeration of code that makes a MUD happen, at a more basic level, it's just a way to take some notes - and the MUD server is just a very specialized note that explains what a MUD server is in such clear terms that the computer can make one.
"}
