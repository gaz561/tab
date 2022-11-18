# Installing TAB on Windows

We know of one way to get TAB working on Windows, but there might be others. This requires a fairly up-to-date version of Windows 10, but that's about all we know, lol.

The basic flow is:
1) Install Windows Subsystem for Linux
2) Install Lua within that Linux
3) Install Luarocks
4) Setup your system with Github
5) Setup TAB itself

Here's a play-by-play that *should* work if you follow it exactly. If it doesn't, please submit an issue!

- First, go into your BIOS and turn enable virtualization
  - This is different on different computers, but involves:
    - Shut down the system
	- Start it up
	- Interrupt the startup process (with some hotkey, for us it's ENTER)
	- Enter the BIOS Setup Menu (or whatever it's called)
	- Look for an option regarding CPU Virtualization
	- Enable those options
  - Again, sorry we can't give more specific instructions here.
  - Start the computer back up and log in and such
- Install Windows Subsystem for Linux
  - Open powershell as admin
  - `wsl --install`
- Setup your new Linux install
  - Start the "Ubuntu" app now installed on your computer
  - Configure it with a username and password
  - You'll now be looking at a *terminal*, where you can input commands and the computer will respond. (This is similar to how the MUD works, but with different commands.)
- Update your new Linux system
  - Enter the following commands:
    - `sudo apt update`
	- `sudo apt upgrade`
- Start installing necessary softwares:
  - First, the stuff to make Lua:
     - `sudo apt install build-essential libreadline-dev unzip`
  - Next, let's actually make Lua:
    - `mkdir lua-build`
    - `cd lua-build`
	- `curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz`
	- `tar zxf lua-5.4.4.tar.gz`
    - `cd lua-5.4.4`
	- `make linux test`
	- `sudo make install`
  - Next up, LuaRocks:
    - `cd ~`
	- `wget https://luarocks.org/releases/luarocks-3.9.1.tar.gz`
	- `tar zxf luarocks-3.9.1.tar.gz`
	- `cd luarocks-3.9.1`
	- `./configure --with-lua-include=/usr/local/include`
	- `make`
	- `sudo make install`
- next we gotta set up our ssh keys and import them into github
  - run this command:
	- `ssh-keygen -t ed25519 -C "your_email@example.com"`
      - (replace the email address)
  - Copy the text in the file at `~/.ssh/id_ed25519.pub` into the form at https://github.com/settings/ssh/new
- We should be good to grab the TAB code from github now - assuming you've been added to the repository:
  - `git clone git@github.com:gaz561/tab.git`
  - Move into that folder: `cd tab`
  - Set up our dependencies
    - `make tab-bin`
- You should be able to run a local copy of the MUD now with `make marmud`


We tend to use Emacs ourselves - check our Emacs guide for more info on that - but otherwise you might wanna use screen and nano or whatever - I hadn't realized before right now that there's a last-mile tech stack of actually running & changing the code, lol. One step at a time.
