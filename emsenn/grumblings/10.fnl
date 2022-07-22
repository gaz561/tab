{:meta {:type :grumbling
        :author :emsenn
        :sequence 10
        :status [:unfinished]}
 :title "Looking at the GAZ computer (What is the GAZ, #3)"
 :contents "
In my last Grumbling I talked about how I see computers as a tool that's centered in our contemporary society, but also are a tool that is made up of layers of infrastructure behind what people actually use, and because of what computers are, that infrastructure is usually constructed out of abstractions, and those abstractions are based on the beliefs and values of the society that made them.

By looking at computers more as what they are, rather than what the layers of abstraction encourage us to see them as, we can start to use them as real tools for antagonism against kyriarchism. Well, to be clear, I'm still looking at abstractions, just, ones that have become the foundational.

I could ramble philosophically without end, I reckon, so instead, let me just dive into explaining what I've got, and maybe the 'why' can come through between the 'what'.

This is gonna be tough to explain, because I know y'all have different familiarity and backgrounds with computers, but I don't know exactly what it is.

Like I said, we're working with a set of abstractions that give us a sense of foundation. One of the abstractions I talked about in the last Grumbling is the method of interface: the REPL, Read Evaluate Print Loop. *(Another method of interface is editing text files in an editor like Notepad or Emacs, but that's only because I'm not clever enough to avoid it (yet).)*

Another abstraction is the programming language Fennel, which builds on another programming language, Lua. Both of these come with their own sets of abstractions over the core of how a computer works, but these abstractions add up to something that I find pretty useful as a foundation.

Before we go further I want to point out, that this might seem like a lot to learn - and it is. But so was how we habitually use computers today, it's just that a lot of invisible effort went into developing those habits. (And, a tremendous amount of money went into developing sophisiticated interfaces that limit what those habits can accomplish, simplifying things.) It's harder to learn to permaculture becaues it's not what's amplified in media and culture, but worth the effort. I think that this is the same way (though for a lot of folk perhaps more important than learning more about permaculture - how many hours, honestly, do you spend looking at a screen versus touching dirt?)

Anyway.

It's outside the scope of this document to explain exactly what programming languages are and how they relate to the physical machine of the computer, so I'll just say that by using what's called an *interpreter*, we can use the language Fennel to tell the computer to remember stuff, and ask it questions about that stuff later.

Here's an example. `>>` at the start of the line is the Fennel REPL's prompt; it's the computer telling us 'give me an instruction please'

```
>> (var x 2)
nil
>>
```

So in English, simple sentences are often `subject verb object` - Tom likes Dick, Alice flies kites. Complex sentences add in adjectives and subordinate clauses and all sorts of other stuff. In Fennel, every 'sentence' starts with a verb, with things like subjects, objects, adjectives, etc., coming after, in an order that is determined by what verb you use. Complex 'sentences' are used by nesting simple sentences inside each other, we'll come back to that. 

From the computer's perspective, the first word after a ( says what function to call (like in maths, if you've learned that), and the words that come after are arguments. `var` is a function that - well, let's use a different word to give the computer a different instruction:

```
>> (doc var)
(var name val)
  Introduce a new mutable local.
```

(`doc` for 'document', I reckon)

This time we got shown the function's syntax - what sort of words should come after it, and a brief description of what the function does: *Introduce a new mutable local.*

That means, take `name` and give it the value `val`, and make it so you can change the value later.

We can see that worked here:

```
>> x
2
>> 
```

Because `x` is 'mutable', we can change it with the `set` function. Let's `dec` `set` first to make sure we use it right. (See how these are kind of like sentences?)

```
>> (doc set)
(set name val)
  Set a local variable to a new value. Only works on locals using var.
>>
```

Hey, we have a local variable, that we made using var! The syntax for `set` and `var` is the same - you just need to make sure to actually introduce the variable first with `var`.

```
>> (set x 4)
nil
>> x
4
>>
```

`nil`, by the way, is Fennel's way of saying 'not something,' which in this context means there's nothing more to say. x got set.

There are all sorts of built-in functions (they're, conveniently, called built-ins), that let a person do math, mess about with strings - that's what sequences of characters like 'Howdy doody buckaroony` are called - and - this is important - muck around with tables.

Numbers and strings are how Fennel handles simple data, like... numbers and strings...

Tables are how Fennel handles complex data.

[I found trying to explain this concisely and contextually too difficult for the moment so will return late.]

"}
