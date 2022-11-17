{:name "Looking at the GAZ Computer (What's the GAZ, #3)"
 :base :lib/doc
 :author :emsenn
 :history [{:time "20220710:1049"
            :event "Published on https://forum.gaz.community"}
           {:time 1668527981
            :event "Imported into TAB based on lib/doc"}]
 :docmeta {:type :grumbling
           :sequence 10
           :tags [:TAB :GAZ]}
 :contents "
# Looking at the GAZ computer (What is the GAZ, #3)

In my last Grumbling I talked about how I see computers as a tool that's centered in our contemporary society, but also are a tool that is made up of layers of infrastructure behind what people actually use, and because of what computers are, that infrastructure is usually constructed out of abstractions, and those abstractions are based on the beliefs and values of the society that made them.

By looking at computers more as what they are, rather than what the layers of abstraction encourage us to see them as, we can start to use them as real tools for antagonism against kyriarchism. Well, to be clear, I'm still looking at abstractions, just, ones that have become the foundational.

I could ramble philosophically without end, I reckon, so instead, let me just dive into explaining what I've got, and maybe the "why" can come through between the "what".

This is gonna be tough to explain, because I know y'all have different familiarity and backgrounds with computers, but I don't know exactly what it is.

Like I said, we're working with a set of abstractions that give us a sense of foundation. One of the abstractions I talked about in the last Grumbling is the method of interface: the REPL, Read Evaluate Print Loop. *(Another method of interface is editing text files in an editor like Notepad or Emacs, but that's only because I'm not clever enough to avoid it (yet).)*

Another abstraction is the programming language Fennel, which builds on another programming language, Lua. Both of these come with their own sets of abstractions over the core of how a computer works, but these abstractions add up to something that I find pretty useful as a foundation.

Before we go further I want to point out, that this might seem like a lot to learn - and it is. But so was how we habitually use computers today, it's just that a lot of invisible effort went into developing those habits. (And, a tremendous amount of money went into developing sophisiticated interfaces that limit what those habits can accomplish, simplifying things.) It's harder to learn to permaculture becaues it's not what's amplified in media and culture, but worth the effort. I think that this is the same way (though for a lot of folk perhaps more important than learning more about permaculture - how many hours, honestly, do you spend looking at a screen versus touching dirt?)

Anyway.

It's outside the scope of this document to explain exactly what programming languages are and how they relate to the physical machine of the computer, so I'll just say that by using what's called an *interpreter*, we can use the language Fennel to tell the computer to remember stuff, and ask it questions about that stuff later.

Here's an example. `>>` at the start of the line is the Fennel REPL's prompt; it's the computer telling us "give me an instruction please"

```lisp
>> (var x 2)
nil
>>
```

So in English, simple sentences are often `subject verb object` - Tom likes Dick, Alice flies kites. Complex sentences add in adjectives and subordinate clauses and all sorts of other stuff. In Fennel, every "sentence" starts with a verb, with things like subjects, objects, adjectives, etc., coming after, in an order that is determined by what verb you use. Complex "sentences" are used by nesting simple sentences inside each other, we'll come back to that. 

From the computer's perspective, the first word after a ( says what function to call (like in maths, if you've learned that), and the words that come after are arguments. `var` is a function that - well, let's use a different word to give the computer a different instruction:

```lisp
>> (doc var)
(var name val)
  Introduce a new mutable local.
```

(`doc` for "document", I reckon)

This time we got shown the function's syntax - what sort of words should come after it, and a brief description of what the function does: *Introduce a new mutable local.*

That means, take `name` and give it the value `val`, and make it so you can change the value later.

We can see that worked here:

```lisp
>> x
2
>> 
```

Because `x` is "mutable", we can change it with the `set` function. Let's `dec` `set` first to make sure we use it right. (See how these are kind of like sentences?)

```lisp
>> (doc set)
(set name val)
  Set a local variable to a new value. Only works on locals using var.
>>
```

Hey, we have a local variable, that we made using var! The syntax for `set` and `var` is the same - you just need to make sure to actually introduce the variable first with `var`.

```lisp
>> (set x 4)
nil
>> x
4
>>
```

`nil`, by the way, is Fennel's way of saying "not something," which in this context means there's nothing more to say. x got set.

We're getting pretty deep in the weeds here, but I guess that's necessary sometimes if we want to get at the dirt that'll be our foundation. All this might seem really complicated, and it is, but so are ideas like browsers, tabs, pop-ups, softblocking, and a bunch of other ideas we hold as our operating foundation when we use computers. We're picking a new foundation here, so there's some new complication to learn, but in the end it'll both us a whole new set of capabilities with computers.

Anyway. So we can store numbers, but we can also store strings, which is what computers (or, I suppose, the folk who picked what to call computer-things) call sequences of characters - letters and numbers and so on, "Howdy doody buckaroony", "June 46th, 2978", and so on.

```lisp
>> (var name "Jack")
nil
>> name
"Jack"
>>
```

Unlike numbers, we've got to put strings inside `"` quotation marks - there's a lot of little rules like that with most programming languages. They're similar to rules in English about grammar and punctuation, only the computer is really strict about folk using them right. (A mantra of computer programming is that computers will do exactly what you tell them to, so a lot of emphasis is on providing clear instructions.)

...Can I just take a moment to say that it feels surreal to be typing out an explanation of basic computer programming in an era when, no metaphor, a zombification virus is ripping its way through our communities? Anyway.

So we've got a couple variables at this point - `x` and `Jack`. `x` feels a bit boring though.

```lisp
>> (var age x)
nil
>> age
4
```

`set` and `var` are functions that come with Fennel - they're built-in functions, and so are often called builtins. There are a lot of other functions too, like ones for doing arithmetic.

Let's learn to do addition:

```lisp
>> (doc +)
(+ a b ...)
  Arithmetic operator; works the same as Lua but accepts more arguments.

>> (+ 2 2)
4
>> (+ 2 2 2)
6
```

You might notice that here the `+` - the verb, the function - still goes at the front, even though it might be more common to put it between each number being added. Again - a lot of emphasis on providing clear instructions, and a consistent syntax helps make that easier, in some ways.

I mentioned a bit back that we can do "complex sentences" too - that's when we take one expression, the bit between `(` and `)`, and use aonther full expression inside it. Let's add one to the age. 

First, let's look at how we can use `age` in place of a number when our function is `+` - the computer looks up what `age` means and because it's a number, it uses that number. When we use expressions inside each other like this, they're called "nested"

```lisp
>> age
4
>> (+ age 1)
5
>> (set age (+ age 1))
nil
>> age
5
```

Congratulations, Jack! Happy birthday. Actually - we're just assuming that age and name are related. And things sure would get tricky if we wanted to start talking about a second person.

Luckily, Fennel comes with tables, which let us group data together in the same... table. Just like how data like `"Jack"` and `5` are associated with strings like `name` and `age`, a table holds different strings (keys) that are associated with different pieces of data. This is gonna be tricky to explain, or show, but here goes:

```lisp
>> (var jack {"age" 5 "name" "Jack"})
nil
>> jack
{:age 5 :name "Jack"}
>>
```

When a string is just one word, Fennel will sometimes put a `:` in front of it, rather than wrap it in `"`. It's a style thing, mostly; the more you work with Fennel the more sense it makes.

There are a lot of builtins for working with tables. A very important one is `.`

```lisp
>> (doc .)
(. tbl key1 ...)
  Look up key1 in tbl table. If more args are provided, do a nested lookup.
```

(...I was today years old when I could do nested lookups with this builtin. There's a lesson there: read the docs! But also, don't worry if you don't understand things like "nested lookup," just work with what you do understand and expand your understanding when you get stuck.)

```lisp
>> (. jack :age)
5
```

Conveniently, you can also just do this:

```lisp
>> jack.age
5
```

We can change Jack's age:

```lisp
>> (set jack.age (+ jack.age 1))
nil
>> jack.age
6
```

I'm not going to get into a deep coverage of what all you can do with tables, it'll come up as we go.

Let's move on to talking about how to write our own functions. Recording, querying, and changing data is useful - numbers, strings, tables, builtins, these exist as the foundation to the approach to computers I'm explaining here. Writing our own functions lets us set up our own infrastruction.

In our example we've created the idea of a `jack` with a `name` and an `age`, and we've shown how we can increment jack's age.

Let's write a function that increments jack age, whenever its called:

```lisp
>> (fn jacks-birthday [] (set jack.age (+ jack.age 1)))
#<function: 0x55fd2decb020>
```

That `#<function: 0x55fd2decb020>` is telling us where in memory the function is stored; it's not really important to know that as far as I've found; what matters is that you can call the function by putting it inside an expression:

```lisp
>> (jacks-birthday)
nil
>> jack.age
7
```

Little Jackie's growing up fast! One more thing in this little example: let's look at how we can generalize functions by using arguments. (I'm going to use a new builtin here, `tset`, which lets us manipulate tables when we don't know their specific name or keys.

```lisp
>> (fn birthday [who] (tset who :age (+ (. who :age) 1)))
#<function: 0x55fd2df2b6f0>
```

What we've done here is basically replace using Jack's age, with using the age of `who` we get told about:

```lisp
>> (birthday jack)
nil
>> jack.age
8
```

What if we miss a few birthdays and want to catch up? We can just replace the old function with a new one - 

```lisp
>> (fn birthday [who count] (tset who :age (+ (. who :age) (or count 1))))
#<function: 0x55fd2de871c0>
```

We've used a new builtin here - `or`. It's a tricky one to understand, but convenient: if the first argument (`count`, here) is anything but `nil`, use it. But if it's `nil`, use the second argument (`1`).

```lisp
>> (birthday jack 2)
nil
>> jack.age
10
>> (birthday jack)
nil
>> jack.age
11
```

This might all seem pretty useless in the abstract like this, but being able to work with data on computers this way, again, going to serve as the foundation as we build up a different way of interacting with these machines.

In the next Grumbling, now that I've gotten some sort of explanation out about syntax and functions and stuff, I'll give a try at explaining how I picture using this approach to being able to do something practical, like budget coffee consumption or look-up what herbs may be good for a symptom - and showing how these can be knitted together if that's what we want.

The general idea being, we can decide what sort of information we want to keep track of, decide how we want to keep track of it within tables, and then start writing the functions that let us work with that information in ways that are helpful to us.
"}
