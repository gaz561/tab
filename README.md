# Groundhog Operating System


**WARNING** This code exists for use by the Groundhog Autonomous Zone. It contains information on herbal treatments that can be *dangerous* or ***fatal***. Do not act on any information found in this repository without understanding that risk.

## User Guide

### First Steps

Connect by asking an administrator for the current public address of the server, then do something like `telnet 192.168.0.11 4242` from your computer's console.

### Requesting an Account

Ask an administrator!

## Admin Guide

Administration is assumed to happen in the Fennel REPL: go to the directory with `gos.fnl` and type `fennel`

### First Steps

To do anything with GOS, you need to `require` it: `(local gos (require :gos))`

### Starting the server

`(gos.go)` (check the code to see how it works)

### Register an account

`(gos.users.save-user (gos.users.make-user <ID>))`, replace `<ID>` with their desired user-ID.

Or from the MUD, as a user with the admin relationship to users: `register-user <ID>`