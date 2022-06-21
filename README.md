# Groundhog Operating System

**WARNING** This code exists for use by the Groundhog Autonomous Zone. It contains information on herbal treatments that can be *dangerous* or ***fatal***. Do not act on any information found in this repository without understanding that risk.

*Another, less important warning* This code is written by, and for, folk who aren't professional computer users. This affects things in many ways; one way is that the best (and perhaps only) way to understand what is here is by talking to the actual people who've been involved in making it. So if something is unclear, or you don't know how to do something, ask someone who might! That said, an attempt will be made below to explain how to do some common tasks:

## Using the System

### First Steps

Connect by asking an administrator for the current public address of the server, then do something like `telnet 192.168.0.11 4242` from your computer's console.

### Requesting an Account

Ask an administrator!

## Running the System

```lisp
(local mud (require :mud-server))
(mud:start) (mud.timer:run)
```

## Building the System

There's no documentation for how to build the system yet.