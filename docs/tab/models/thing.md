# The Thing

The ***thing*** is the foundational model in TAB; it's what every other model uses as a base.

## Attributes

Every *thing* has a ***name***, a bit of text that's what it normally is called; for **the** *thing*, it's name is "thing".

Every *thing* also come with two lists:

- A list of ***behaviors*** - when a *thing* goes from being a *model* to being an actual "made" *thing*, through TAB, it uses the behavior modules listed here to look for what it's capable of. Every *thing* comes with one item in that list: `thing` - every *thing* can behave like a *thing*.
- A list of ***additive attributes***. These are attributes that, when *models* are "merged" by TAB, get added together. Every *thing* starts with two items in this list: `additive-attributes` itself, and `behaviors`. This means that any *model* can add onto the list of *behaviors* or *additive attributes* just by setting them in that model.

Every *thing* also comes with a table of their *grammar*. Here's a rough specification of that table.

- ***article*** :: This one isn't actually included by default, but the behaviors of a thing that rely on it are capable of making some assumptions. Articles are typically "a", "an", or "the"; if you don't want the thing to have an article, like if it's a proper name, set it to a blank string, "". *(Don't set it to `nil`!)*