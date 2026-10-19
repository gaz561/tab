{:title "Talking about TABby"
 :date "2022-10-23:2034"
 :meta {:type :grumbling
        :author :emsenn
        :sequence 24
        :status [:draft]}
 :contents "
Since the last time I wrote about our computer code, I've restructured the code and started calling it TABby - short for Things with Attributes and Behaviors.

Now that I have that framing for making stuff, it's become that tricky middle ground where I have to take those basic ideas - models, attributes, and behaviors, and specialize them into various constructs that knit together to make the system capable of what it is we want it to be capable of.

What we want it to be capable of... is broad. From helping suss out which herbs are currently harvestable and the right treatment for a given symptom to providing a forum for talking about various bits of theory.

These things rely on complex intersections between complex things - something we're pretty far from right now.

In the short term it probably is best to focus on setting up tools for allowing communication within the system - especially what I'll call 'accretive communication,' where the talking builds up some thing, like a plan for a project or knowledge of an herb.

I've made up some constructs and described them elsewhere but I think I want to maybe... restart? I mean not restart but restructure them.

Here's what I'd like:

- A dimension is a list of things, including a timer. (This is called an engine rn.)
  - I could see adding things to various specialty lists for quick reference, under a unique key, i.e. add the MUDSocket Server thing to the services list so one can do dimension.services.mudsocket.
- A timer is a thing that can schedule events in the future.
- Services are things that do some thing, like run a MUDSocket, or load and save data from folders, etc.

I imagine there being some services that there's only one of per dimension - like MUDSocket - but others where there might be multiple.

For example, there's gonna be users, but also I imagine them being able to create and manage affinity groups. Each user might have their own library - or even multiple - and then libraries within affinity groups...

So should each have their library service, or pass on requests to a 'central' library service at the heart of the dimension?

I lean toward the former since then folks' libraries behaviors/attributes can change more readily, I guess? I don't know if they can with the behaviors code I have going on, TBH.
"}
