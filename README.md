# TAB
*Things with Attributes and Behaviors*

> ***TAB*** - short for *Things with Attributes and Behaviors* - is a way of modeling things (from blueberry bushes to weather systems) using digital computers, to help folk affiliated with the Groundhog Autonomous Zone coordinate their understanding of information.

## Getting Started

First, from the shell, get the source code & prep Fennel. *(You'll need Lua & Git installed before this.)*

	$ git clone https://github.com/gaz/tab.git
	$ make tab-bin
	$ fennel

Then, you'll be in the Fennel REPL, and can do:

	>> (local tab (require :tab))
	nil
	>> (tab.doc tab.make-model)
	"(nil model-name ?additional ?dimension)
	  Make the model found at MODEL-NAME, adding in the ?ADDITIONAL attributes if provided, and setting the made thing's ?DIMENSION if provided."
	>> (local something (tab.make-model :thing))
	nil
	>> something.name
	"thing"
	>> (something:fname) ; full name
	"a thing"

More README coming soon!
