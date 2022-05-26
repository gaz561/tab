# Groundhog Operating System

This code is written for use by the Groundhog Autonomous Zone.

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