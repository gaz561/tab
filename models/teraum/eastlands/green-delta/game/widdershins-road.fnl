{:name "Widdershins Road"
 :base :teraum/eastlands/green-delta/game/area
 :description "This is the Widdershins Road, which runs from the coast north of Ack to the ssouthern coast, not-quite circling the city."
 :exits {:north :teraum/eastlands/green-delta/game/ack/poplar-gate
         :northeast :teraum/eastlands/green-delta/game/ack/piketown-gate
         :northwest :teraum/eastlands/green-delta/game/ack/garys-gate}
 :contents [{:name "Bill Hags"
             :base [:npc :teraum/eastlands/green-delta/game/gamer]
             :description "Bill Hags is one of many migrant human workers. He travels the world, doing whatever labour is available."
             :contents [{:name "a letter"
                         :base [:object]
                         :description "This is a piece of paper that's been folded over into thirds; some words are written on the inside."
                         :full-text "Susan,

I'm glad to hear my latest package got there safe. People here have a lot of bad to say about the Red Union, but I can't deny they've done a lot better with the post in recent months. I'm still not used to seeing those canvas ships floating past, though.

I wish you were here to try some of the food I've had recently. Reconstruction of Ack took folk from the fields in early summer, but the Union shipped in all sorts of fruits and veggies from Gnalens. There's one that has to be the work of a perverted wizard from before the Break. It's long and curved with a skin you peel back and a white fruit inside. And it's only ripe for about four hours!

It's been nice getting to try all these new foods, but it also makes me miss the mutton your mom would fix. Tickets to take an airship are getting cheaper - maybe I'll \"fly\" up for the holidays.

Especially if the work keeps up like this. You wrote back that you were worried I was sending too much. Don't! The Union hired us all to help rebuild the city, but now they're sending a bunch of us south to cut branches and timber from the forest, the \"Widewoods\". I'm kind of excited. Not about the work, but to see forests like the long-time workers describe.

I didn't forget what you said about your brother. I would happily find him work if he came out, but I don't know if it's the right decision. Tyjeer's still a boy, and this work isn't always safe. I don't want you to worry about me, but I'd hate for Ty to grow up without his father able to provide for him. Let me know what he needs, and I can send the money to get it for his Wintertyg. Try and convince him to stay in Dent.
Give my best to all,
Bill"}]}
