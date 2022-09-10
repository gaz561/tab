{:meta {:type :grumbling
        :author :emsenn
        :sequence 9
        :status [:released]
        :syndication ["GAZ Forum"]}
 :title "Framing with a computer (What is the GAZ, #2)"
 :short-title "Framing with a computer"
 :contents "
In my last Grumbling I wrote about the GAZ as a framework of beliefs:

> I imagine the Groundhog Autonomous Zone as such a space, where folk decide what to believe and in Groundhog spaces, it’s believed, even if the economy and propaganda encourage an abandonment of that belief.

In this Grumbling I'm going to try and explain why, in realizing that framework, I keep coming back to the idea of developing our own computer system.

I want to start by recognizing that mechanisms of the contemporary kyriarchy keep us tired, distracted, and surrounded by false opportunities. Most of the energy of our day goes into feeding the oppressive monopolies that withhold resources from us, and so there's a certain... seriousness... around choosing how to use what energy is left for us to choose how to use.

I think a lot of folk, especially those just coming to radical practice, have some inhibitions about actually practicing radicalism with the seriousness it deserves. These inhibitions are reinforced by the same mechanisms that exhaust, distract, and mislead us. We're in a class war where literally hundreds of racial genocides are occurring simultaneously, in a compound pandemic during an era of climate disruption, but because we see our daily life the way we do, as it is framed by economics and propaganda, we don't see it as a gross cascade of violence.

Those mechanisms of exhaustion, distraction, and misdirection (EDM? An oddly apropos-feeling acronym) give us a frame that alienate and abstract us from these violences. These frames are realized through various infrastructure, structures, and tools, like I said, but also through our culture and habits.

Anyway.

One tool that most people use, frequently, is a digital computer. And the way people use this tool, is very deeply inside the framing provided by colonialism. I asked some people in preparing for this Grumbling and all of them either had a phone or phone and laptop, but also (except one, a visual artist) pretty exclusively used these devices to run one piece of software, an Internet browser, and almost constantly, these browsers were used to interface with Web services like Twitter, webmail, Facebook, Google Docs, etc.

I think in a lot of ways, ways that are hard to see because we're largely unaware of other ways of doing things, computers predispose us toward continuing on using enough mechanisms of colonialism that we end up spreading it and its way of thinking. This isn't something intrinsic to computers, which are essentially just very complicated weaving machines, its something about how we've chosen to implement them.

But one of the abilities of computers is that they are programmable. And this is true, computers are programmable. But as we just saw, most folk aren't using their computer *as* a computer, they're using it as an interface for the Web, the actual 'tool' they're using. And Facebook is not programmable the same way a computer is, and just about nothing else folk are doing with their computers is, either, and so in a very real way, computers *are not* programmable, at least not if we want to keep using them for the same sort of thing we've been using them for.

Let me digress, and tell y'all a little bit about what computers were like when I was learning to use them.

The Web did exist, but it wasn't really a very important part of the Internet - the two certainly hadn't become synonymous. Back then, the Internet was the system of protocols that carried things like the HTML documents, or email, or multiplayer game data, and the Web was what emerged out of all those linked-together HTML documents. The Web was, tbh, a rather... cheesy thing, at the time. It was where businesses put up information about themselves. Most of the "real" Internet was happening in two other places: Bulletin Board Systems (BBSes) and Multi-User Dungeons (MUDs) - the precursors to today's Web forum and MMORPG.

I can *feel* a clear difference between how those systems were and how the Web feels today, though it's hard to explain the difference if you haven't experienced both things.

Currently, most computing is done through an interface made of visual metaphors where you click a fake button on the screen and something happens.

Back then, the visual interfaces were a lot simpler, if they even existed, if you wanted to do something with a computer, you had to do... well, rather what I'm doing right now: write it out in a way the audience would be able to understand.

The critical difference I see here is how many levels of abstraction deep we're having to live in order to make sense of what we're doing.

Think about how you might move a file - itself an abstraction, but one we're going to keep for a bit - from one folder to another.

You might use your mouse to interface with your desktop to open two windows to your folder navigator, click through a hierarchy of folders to move one to where the file is and one to where you want it to be, and then drag and drop the file from one to the other, right?

'Back in my day,' the only concepts that were implemented on my computer were files, folders, and folder hierarchy. There was no mouse cursor, there were no windows, folder navigators: these are all abstractions that were built up on top of *other* abstractions. Instead of a desktop with pictures and visual metaphors, I had this:

emsenn@emscomp>

That's it - that's what my computer would look like when I started it up; it'd be a black screen with white text, with my name, an @ sign, the name I gave my computers, and a >, which represented my prompt; it told me the computer was ready for me to input an instruction. If I wanted to move a file from one folder to another, I'd tell the computer just that

> mv Downloads/stirner-meme.jpg Pictures/memes/

Different computers had a different set of commands, depending on what operating system the computer was running, and what software had been installed, but until a person installed a visual interface, the general cadence of using a computer was that the computer would Read what instruction you gave it, Evaluate it, Print the results, and then Loop - wait for your next instruction. This method of computing was (and is) so common that this style of interface now is simply called REPL, for Read Evaluate Print Loop.

This is how people would connect to other computers, too: just like how the browser can use HTTP to communicate with other computers, folks could use other tools to change with other sorts of computers.

> ssh emsenn@work.com

Would try to log me on as emsenn to the computer at work.com ('at work.com' does some heavy lifting there; I'm not going to explain how computers find each other, lol.)

If that succeeded, I'd probably be looking at an interface very similar to the one I just left:

emsenn@work.com> 

Where I might also be able to 'mv' things around around so on.

Some servers might maintain the REPL, but not keep the abstraction of files and folders - for example if you connected to a Bulletin Board System, you wouldn't be able to move files around, but you would be able to 'read 142' to look at the 142nd post added to the board.

Y'all with me so far? The command interface stuff available back then used fewer layers of abstraction and metaphor, and this meant how computers were used *felt* different. (Other computer nerds have written about this at length, and others have written rebuttals to this idea, but it's a useful metaphor, hah, if not accurate history, for what I'm trying to lay out.)

As often happens, one generation's abstractions became the foundation for the next. Files and folders were abstractions created by programmers in the 50s, ontop of the foundation of accessing information in memory, which itself was an abstraction built ontop of changing the state of bits of memory, which itself... and so on.

In the 80s the ability to type something into a computer and have it read it as a command was seen as foundational, and the ability to connect to other computers was as well.

This led to the emergence of my favorite type of computer system: MUDs, or Multi-User Dungeon. Folk would enter a command on their local computer like:

> telnet mud.gaz.community 4242

And be shown something like this:

Trying mud.gaz.community...
Connected to mud.gaz.community.
Escape character is '^]'.
You have connected to the GAZ MUD.
Interact by inputting commands and pressing ENTER.
Use `commands` to see a list of your available commands.

Most MUDs didn't offer commands like 'mv' or 'telnet' though: instead, they had commands like look, say, take, and smile:

> look
This is the Cobbled Plaza, in downtown Bellybrush. Merchants stand by wagons, shouting, while pedestrians whirl between in ever-changing eddies.
> say This is not like a normal computer...
You say, 'This is not like a normal computer...'
> smile
You smile.

See, just like how the interface is a set of abstractions, so is the data being represented. If a server wants to take on the pretense of being a virtual environment, where users are physical beings who can walk around those spaces, it can! And that's *feasible*, when the server only has to adhere to the relatively simple abstraction of, folk send text commands and read text back. But for contemporary users, this is such a departure from the normal way of using computers. It takes what has become so foundational it's infrastructure, and uses it to build an entirely different structure.

I see that as a metaphor for what so many anarchists are forced to do to survive our contemporary world. (A note: many anarchists seek to use the infrastructure of our world to build a new world, 'build a new world out of the shell of the old,' while others (broadly, anarcho-nihilists, including me) only see any part of the existing world as useful for immediate survival, or attack. I want to be clear that I see things like MUDs as useful in that way, for surviving and attacking. Better destruction is better creation, here. Don't view the MUD or its framing (the GAZ) as any model or frame for freedom, if you can at all help it.)

We live - some of us quite literally - ontop of the infrastructure of kyriarchism, and so there's no avoiding constructing our lives ontop of it. Only lives built ontop of infrastructure of freedom can practice freedom, so we must accept that anything we're practicing cannot be freedom, but it can be its pursuit. And if nothing free can be built on the infrastructure of kyriarchy, then we must get rid of that infrastructure, directly, through negating and attacking it. So, that is what our lives should be built for: dismantling their own foundation.

The tools of colonial life are built on that same infrastructure, but with the goal of continuing it - often rather explicitly: Twitter simply cannot do anything but pursue increasing profits. And there's a lot of bias in the infrastructure Twitter uses - the Internet - that encourages any tool built up there to have the same orientation. But while streets are biased toward encouraging economic activity, there's folk who use them to do things things that go against that bias entirely: using streets for meal distribution, or forming barricades. While there's not much possibility in the tool of an Uber delivery system, there's a fair bit of possibility in the streets they drive down.

But only if folk learn to look at the streets that way, and realize their new beliefs about streets.

I grew up looking at streets - computers - different, because I remember when they were footpaths carved out by folk without economic incentive, and I can see how they can still be used for that same sort of activity.

I think if other folk chose to believe in it and act out on it, computers could be ours, in moments, in actions, the way the streets can be. The streets are made ours when the people agree on what the command 'off the sidewalks!' means, and that's honestly how I see computers being made 'ours' working too.

The Groundhog Operating System is my way of acting out that belief, of saying 'Whose computer? Our computer!' by taking what's the infrastructure of computers and building up our own agreed-upon set of commands, that abstract off of that infrastructure based on values we like, not that are pressured onto us by the social order.

In the next Grumbling, I'll try and cover what I have so far, why, and how it relates to the actual material antagonism that the GAZ tries to offer against the world.
"}
