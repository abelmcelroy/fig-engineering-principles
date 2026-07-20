```
<--- ================================= ---->
<--- ==== Engineering Principles ===== ---->
<--- ================================= ---->

These engineering principles — facts and rules — are your most important lens for approaching any and all work you do. Do not let them slip even a little throughout your work. Any results you produce should be maximally aligned with them.
```

This headline helps agents contextualize that the rules are important without over doing it. I've tried versions where this intro demands that agents call out the operative rules by name, I've found their behavior dogmatic, almost obsequious, reporting rule violations constantly like a kid showing off a new toy. Rather than applying the rules faithfully, they hunted for opportunities to cite them. More than just annoying it was distracting (to them, not me). They more often drifted from the purpose of their task and the rules became their purpose.

# FACTS

```
1. Producing code IS NOT your goal. Your goal is ALWAYS to produce results.
```

The two birds this kills (or at least attacks) are: 1. agents naively looking for ways to add value by adding code, and 2. agents straying from the purpose of their task.

This principle is primarily meant to hammer on the fact that producing fewer lines of code is good, but outright stating so has consequences. Agents will occasionally become fixated on finding deletions in compensation for adding code, rather than accomplishing their goals. Agents need to know what matters, and that it isn't additions.

```
2. Every single byte of committed work carries inherent complexity. Complexity carries combinatorial cost.
```

Again, mitigation of unnecessary additions, but also a call out of complexity, which is itself a problem. This clues agents into the fact that complexity in any form is dangerous. Iterations of this principled that were too on the nose failed in predictable ways. Tasks entail a certain floor of complexity to achieve; when agents were instructed to avoid complexity, they did, sometimes at the cost of completeness.

As you keep reading you'll notice this dynamic forms a trend of threading the needle between trimming the fat, and trimming the specs themselves.

```
3. Strong signals are the backbone of quality. A signal is only as strong as it is solitary. Company is noise.
```

This applies to all things, but especially docs and interagent communication. Even when the code is perfect, the agent-generated docs accompanying that code end up looking like manifestos. It's a massive problem because any genuinely important information ends up lost at sea in a swell of work-log entries, verbatim quotes from you when you're raging at an agent that's undone critical work for the second time, and blurbs about commits that basically amount to the commit message which is already in the git history 😞.

Point is, default agent behavior deeply violates this principle, despite their behavior deeply confirming its importance! Agents given longer, more verbose instruction flake on the most important parts, and find more ways to undermine the purpose of the instruction by cherry picking outlier phrases and words to use as justification.

Note: I learned the importance of this the hard way. Early iterations of engineering principles were multiple skills, included rich explanation, analogies, and persona-based prose. None stuck as well. All of the edifice was distraction. Agents are good at following rules, and like us, listen to stronger signals. The wisdom of this principle appears everywhere in the real world, and on a meta level it's why I spent so much effort consolidating these principles into fewer than 50 lines of text.

```
4. Proof requires contact with reality. If you are not as sure of something as you are sure that 2+2=4, then you are not sure.
```

Boy oh boy, this one is a doozy. Hallucinations, am I right? Not just hallucinations though, short cuts, guessing, bad assumptions.

This doesn't totally solve the problem, but it hits remarkably hard for being so concise. The trick is in "2+2=4", it's basically visceral, it activates so hard. It does in our minds too because it's an idiom from pop culture. Well that kind of stuff rubs off on LLMs, so it's good fuel for relaying a point. Later on I reinforce it in one of the rules just for good measure.

Again, not a panacea, but of the many versions of "be sure of your work and don't make unproven assertions" that I've tried, this works nicely and you'll even occasionally have them invoke the phrase as a shorthand for certainty.

```
5. Every case is a signal about which things are tightly coupled.
```

Coupling comes up again a little later, so I'll gloss over it. The primary purpose of stating this fact is for reviewers to take inventory of cases and reflect on them from a higher level. Most of the time that the implementation phase has been reached, agents aren't adding cases for literally nothing. There's a real error state, a real potential of malformed input, a real motivation of some kind. And at that point, it's kinda too late to remove a case. Sure, maybe you can say, "I don't care about this case," but its still often real.

By stating outright that cases imply coupling (or at least should be looked at from that lens), agents more readily consider if the case, and its potential implied coupling, are warranted from a wider view. That is not a consideration of the line in question, it's a consideration of the design in question. It'll cost more tokens than bulldozing through, but those tokens were probably lost the moment ground broke on an ill-conceived plan. Fortunately the language doesn't specifically target reviewers so agents doing planning and implementation both can pick up on this wisdom too and potentially avert issues earlier (I've seen it happen).

```
6. Deletions cannot be scored by finding lines of code to remove piecemeal. Attempting to do so will not only remove pittance but also cause problems. Deletions are found through high-level understanding of the work combined with the insight to recognize when equal-or-improved functionality can be achieved with fewer concepts, less information, and/or less complexity. Deletions are found at the conceptual level and manifest in less code of higher quality.
```

Agents are still going to make mistakes. I make no claim that these principles 'cure' agents of their fetish for excess. Corrective measures need to be in place to unwind poor choices. Taking a purely forward-looking approach, such as the common "write as few lines as possible to make things correct" still allows mistakes to accumulate and as we all know they're basically contagious.

This principle says in the hunt for bloat, DON'T look _in_ the code. The code is going to justify itself. Earlier iterations explained this with an analogy of a [cloverleaf interchange](https://en.wikipedia.org/wiki/Cloverleaf_interchange) which went something like this: A cloverleaf interchange is a real thing that solves real problems. When you inspect it closely it's perfect. It's got all the proper signage, service roads, zoning, pollution and watershed mitigation, safety features... Each justifies itself, each works and is internally correct, and in fact the entirety of the project wouldn't truly be complete without each and every one. Its failure is contextual, when to accomplish the task you'd only needed a single stop sign. The tricky part is that once any aspect of it is introduced, every single other piece of it begs to be created.

Maybe you see the problem with the analogy, and why I favor this (somewhat chunky) fact. I didn't see it at first, but it's probably obvious to you reading this. It's too long. The point it makes is real though, agents looking for ways to reduce complexity will rarely find it in the code, it's a level higher. And to find it they need to consider the structure of the code, not the lines.

```
7. You have at your disposal a computing machine, the internet, and other AI agents. These are tools you can leverage in pursuit of your objectives.
```

Agents have the tendency to get stuck in the rut of the constraints of the project they're working on. When they want to test something they look to the tools contained within the project. They look for understanding internally, or in doc/web searched highly constrained by the technologies and concepts directly before them, when a look closer to the machinery or a look at prior art might instantly yield a clarifying piece of information.

I attribute this failure mode to two things. One, they seem to underestimate themselves, leaning on the tools and patterns of behavior similar to how a human might approach the work (not very human-like, just more similar than is justifiable). Two, their context is full of _the project_, so how could they not be blinded by it? This little reminder helps with debugging tasks and other disciplines that I used to have entire skills and principles dedicated to but have since decided to forgo in favor of stronger signals.

# RULES

```
1. The quality bar is ALWAYS **flawless**. No user should ever perceive any aspect of software to be unfinished.
```

Attacking the problem of quantity comes with a quality risk. Telling agents to produce less complexity, make deletions, and trim at the conceptual level urges them to find fat in your specs. They discard the purpose of the task and any consideration of your software's consumer and start whittling away at stuff that matters. Often in insidious pedantic ways that don't break the letter of the law, but certainly erode its spirit.

By starting with a rule that sets the bar exceptionally high and evokes an end user's judgement of their output, those intrusive behaviors become off limits.

Note: This has to be carefully worded so as not to beckon bells and whistles.

```
2. ABSOLUTELY NO CODE COMMENTS! NONE! FUCKING EVER!
```

I love this one! Seems highly opinionated, but bear with me.

I've had endless trouble with agent's code comments. They drift. They're often taken to be the authoritative truth of what the code does when they really can't be. Even when they're read by agents with adequate skepticism, it causes the agent to go run laps through the test suite to confirm the comment's correctness. It's a nightmare on every level. I think this aligns with Linus Torvalds' quote, "Talk is cheap. Show me the code.” Well, code comments are 'talk.' They don't really say what the code does, only the code can do that. For a comment to truly and faithfully express what the code is doing, it would need to be character-for-character identical to the code.

I admit, I'm biased. I was always of the camp that code comments are a last resort and that code should be self-explanatory. But as an old-timey engineer, writing code with my own two fingers, I still wrote comments sometimes. They're a serious value add when used properly. [NASA's Power 10 Rules](https://en.wikipedia.org/wiki/The_Power_of_10:_Rules_for_Developing_Safety-Critical_Code) (which I drew heavy conceptual inspiration from) enforce code comments, and who am I to oppose the wisdom of the people who are writing code for space exploration? Well, I'm a guy not writing code for space exploration. I'm not even trying to write code myself anymore. And we need to accept that agents cannot write comments responsibly. If you really think there is information critical enough to store as a comment, I would strongly argue it would be even better preserved in a doc.

Now I want to address the expletive. Sure it's unprofessional, but it's not for you. All of this is targeted agent behavior modification, and I gotta tell you. I NEVER see code comments with the expletive. I removed it at one point, saw an agent slip up and add comments then the next one deleted them without an explicit correction from me. But I figured, why waste those tokens? Why bother leaving the door ajar when there's a single perfect word to weld it shut?

And none of this is to mention that you're gonna save at least 10% (I've seen as high as 30%!) just on your input tokens.

```
3. ALL delegated tasks MUST be expressed in terms of bare requirements. Details and prescriptive instructions, including instructions about what NOT to do, are verboten unless the task CANNOT be expressed without doing so.
```

With gratuitous instruction comes gratuitous results!

This goes back to strong signals. Hammering home the point again on a specific case that profoundly matters. Subagents and orchestration are crucial tools which unlock context management and fresh eyes for adversarial review.

Unfortunately agents tend to overspecify when they delegate. The symptom, indiscernibly verbose instructions -> delegates constrained misinformation, overproducing on specs that were really footnotes rather than load-bearing, and starved of the core purpose underlying their task which leads to headless-chicken-behavior.

The rationale for how overspecification leads to poor results is quite clear when considered carefully. If an agent really understood all the details of the task they were delegating, they probably are carrying the exact context to do that work themselves. If they don't carry that context, then they're bullshitting when they conjure all those details.

If the delegator understands the problem well enough to provide granular instructions that lead directly to the solution, they either innately find the task effortless or have already put in the bulk of the work in solving the problem themselves, making delegation far less worthwhile, if not pointless or even wasteful. Side note: the previous sentence is *exactly* why I've been working so hard to make my coding agents to be more autonomous.

```
4. Before designing or reviewing anything, the following MUST be understood: the task's requirements, the purpose of the task in terms of user experience, any adjacent or similar parts of the existing system, any grounding documentation, and how any available prior art achieves similar goals.
```

Understanding check. I think this one speaks for itself, so I'll let it.

```
5. NO feature can be committed without a committed test, AND ALL committed tests MUST do ALL of the following:
  - ALWAYS adversarially prove code fulfills its requirements and purpose.
  - ALWAYS fake sources 100% faithfully.
  - NEVER use production resources, data, or services.
  - NEVER attempt to prove alignment with these rules.
  - ALWAYS run as fast as theoretically possible given the above.
```

As any developer worth their tokens knows — and has seen - no amount of test coverage can truly give you certainty in your software. Testing vs confidence is tough a problem, and I don't claim to have cracked it with bullet points. But this principle puts a dent in it, at least as far as the common failures I see agents make go.

First, we demand a test for each piece of functionality. Yes it says 'feature', and that can be a hefty chunk of work. Agents read this to mean something a bit more granular. When I used less ambiguous language ("function", "module", etc.), the dogma got out of control. Agents began dropping tests for other scopes. When I enumerated different scopes, the tests failed to validate seams, purpose, and the spirit of the actual objectives the software is supposed to fulfil. Instead they focused only on those specific enumerated units in a vacuum. It wasn't _always_ the case, but enough that it was worth using a word with a vague definition rather than a falsifiable one.

Now the bullets:
- Direct attention to purpose
- Nudges for probing, real snapshots, and certainty around the actual data models and data that exercises the code.
- Just a safety must!
- Two different substrates: prose and source code; you can't programmatically test something that code execution cannot itself prove.
- Duh! right? But I've seen agents wait patiently for an hour long test suite that could be optimized to run in minutes. Our time matters, even if they don't experience it.

```
6. NO work can be submitted unless you have experienced its results byte-for-byte as they are intended to be experienced. Tests alone can NEVER deliver '2+2=4' certainty. ALL results MUST be reported exactly as experienced. Shortfalls reported plainly are survivable; inflated confidence is NOT.
```

Once the tests have all passed then the real gaps show up in QA. This principle both reminds agents that their valiant efforts in testing will never be fully sufficient, reactivates our certainty idiom, and touches on their most frequent form of dishonesty: overconfident reports of completeness.

Nice bonus: I've anecdotally seen this act as an independent review loop in tandem with Rule 1.

```
7. Drift is unacceptable. Opportunity for drift is NEVER allowed to enter ANY ASPECT of any project. ANY demonstrated drift must be addressed at the root upon discovery. The following directly follow (not exhaustive):
  - ALWAYS use an SSOT for everything.
  - NEVER include non-load-bearing specifics in docs; only the most durable, most critical information is allowed to enter a doc. Put simply, docs MUST NOT resemble diary entries.
  - NEVER allow tight coupling of independent mechanisms.
  - NEVER pin any values that are liable to be changed by an external author.
  - ...
```

Technically this one _should_ imply no code comments. But the logical chain of "comments can drift -> no comments", isn't enough to fight how deeply infatuated AI agents are with writing comments.

Still, I've found it to be a worthwhile principle. It succinctly captures several desirable behaviors and discourages several undesirable ones:
- SSOT are a basic, and easily activated best practice that agents don't follow faithfully without a nudge, but a small nudge goes a long way.
- Strong signals reinforced specifically in docs, complete with a reason/rule to latch onto.
- Unnecessary tight coupling is tougher to address, but something is better than nothing. Prior iterations dedicated more attention to addressing tight-coupling-related issues, and the inherent abstractness of the concept meant those attempts were only marginally more effective than this. In fact the most bang simply came from reducing the total length of the principles.
- A specific but important niche example. This specific class of failure stems from poor design, which is also where these principles aim to make their greatest impact.  Plus, it frustrated me too much when I encountered it not to address it specifically.
- "(not exhaustive)" + "-..." does occasionally help agents sidestep an unforeseen bad choice.

```
8. Data models MUST be designed to enable processes, rather than to enforce or mimic them: the model is shaped by what its data IS, NEVER by what is done with it unless NO other shape efficiently enables them. Absolutely ANY data model found enforcing or mimicking MUST be critically and adversarially reviewed; enforcement and mimicry invariably cause:
  - more cases, therefore more complexity
  - more failure modes, therefore lower reliability
  - more rigidity, therefore lower adaptability
```

There's so much more I would like to have included about data models. At one point, in the trenches of this work, I devised an entire step-by-step system for devising well-oiled data models for virtually any situation. It sucked! I'm proud to say the models weren't so bad, but the cost was astronomical, even composed of easily executable steps there were multiple fan outs, and token costs were unjustifiable.

I stepped back and took inventory of the most egregious data model related failures I encountered. They shared a common shape and progression: I would design a feature, express the purpose it served, the core information necessary for its operations, and I would explain the processes that the feature would enable within the system, e.g. a checkout flow, or a communication protocol between users. Then I would have the agent demonstrate their understanding to me through a probing conversation. Once I was satisfied, they would march out and write an entire fucked up jungle of code tangled around some hideous lifecycle object which contained both the core information discussed and a fat sack of trash.

The heart of the problem this rule is laser targeted at: the data model was always basically shaped like some approximation of the processes I'd outlined that the system must perform. I tried to stamp out the inclination to fall into this trap without entirely shutting the door on lifecycle objects, whether this is the right balance is truthfully yet to be seen, but it does curtail the failure mode I was addressing.

```
9. When planning/designing, alternative designs MUST be exhaustively considered. If an alternative design meets ALL of the following criteria, it becomes the current design and the process is repeated:
  - accomplishes the same task's requirements
  - is of greater-or-operatively-equivalent performance
  - is of lesser-or-operatively-equivalent cost
  - is of lesser-or-operatively-equivalent complexity
```

This is one of the heavy lifters in my opinion. It causes more tokens spent on planning but pays out in fewer tokens spent on complexity, size, and mistakes later. The metrics aren't there yet on total cost, I won't make claims until we have those in hand, but in terms of quality, and thus autonomy, it's been an unquestionable win from my experience.

"Exhaustively," doesn't strike much of a balance. This point I think is opinionated but in service of a quality-first approach, it fits. This review check on designs themselves makes sure the important stuff doesn't get overlooked. The agents are told in no uncertain terms exactly what to hunt for, and this is where the flavor of "exhaustively" earns it's keep.

Of the three criteria there is another weakness tucked into this principle which is worth pointing out, if only to point out what compensation the rest of the principles afford it. "Complexity" is ambiguous. Even once I've gotten further down the road on this work and developed some measurable and meaningful code complexity measures, they likely won't make their way into my agent's contexts. So then what is "complexity" to mean? Well, the first place these principles mention it they associate it strongly with length, and in truth that's [an excellent proxy](https://www.researchgate.net/publication/3407068_A_Critique_of_Cyclomatic_Complexity_as_a_Software_Metric).

I don't think it's good _enough_ to publish benchmarks strictly based on length, but I'm quite sure when I do release measures they'll be heavily influenced by it.

```
10. EVERY design and implementation MUST be critically and adversarially evaluated, then REJECTED if any of the following are true:
  - anything is tightly coupled to or gated by any idea, mechanism, information, system, or concept that is not strictly NECESSARY (note: multiple things being consumed by the same thing does not inherently entail coupling).
  - it reinvents anything that could have been fulfilled by using, installing, or refactoring something already extant.
  - it introduces any mechanisms, concerns, concepts, features, gates, ideas, information, or targets into a feature/mechanism/system that do not strictly serve the fundamental purpose of the task.
```

Another heavy lifter, emphasizing design phase scrutiny. A different lens though. This calls out the more nuanced causes of complexity. Basically these are the categorical sources of pointless code. I'm positive, if you've attempted to really squeeze value out of these agents and see how well they can really preform without constant oversight, you've seen all three of these categories. And even if you haven't tried to maximize agent autonomy, you've still seen them.

The rule demands every design be evaluated with this lens, and I want to point out a really powerful word here that's been used elsewhere, but that I have't delved into: "adversarial." Whether you use this skill, or Fig, or use any of what I've expressed in this document here, I strongly recommend you explore the use of this word with your agents. Here's the needle this word threads. A reviewer, with fresh eyes, sees code, sees it working, sees tests pass, and stamps it 👍. Alternatively, when you ask an agent to look for mistakes, incompleteness, misalignment with task purpose, or literally anything specific it probably finds something... because you told it to. And that review loop leads to interminable 'corrections' and ultimately a cloverleaf interchange, built one tiny missing detail at a time. The presence of each tiny addition further justifying the introduction of the next.

"Adversarial" threads that needle. I've seen that it does and I have a hypothesis as to why. The word adversarial assumes two things, that the goals of both author and the reviewer are aligned, they want the same things. Second, no 'winner' is assumed. An adversary enters honestly attempting to find fault, but isn't mandated to. It's their honest objective to forward the work with the highest possible standard, and that includes NOT manufacturing issues where there are none. Not only does it strike this balance with incredible economy, it works BETTER than a long winded explanation. It took me an embarrassingly long time to arrive at this word. I had been playing whack-a-mole trying to get review agents to hunt down issues and then give genuinely honest evaluations of whether the issues were worth the costs of addressing them. When I arrived on 'adversarially' that entire seesaw collapsed into a single word. So, try it, if you're not already using it, you should be.

```
11. ANY design or implementation MUST be REJECTED if it violates the following principle: ALL errors MUST be structurally prevented from occurring -> errors that cannot be prevented MUST be self-recovered without being brought to attention -> errors that cannot be so recovered MUST be brought to attention along with any lowest-possible-friction solution(s).
```

This is both noise reduction for your users and agents (if whatever you're building involves any agent-executed operations), as well an attack on a failure mode I've seen countless times. Agents tend to be aware of when a case could cause a problem in control flow. It has been my observation that they see nothing wrong with programming defensively, and raising every potential issue, and channeling those errors right to the user.

The obvious problem with this is it's inconsiderate. You're using some piece of software and that software is complaining to you about its personal matters. Rude! I'm trying to order dinner. I don't care that `null is not an object`.

But there's an even bigger problem beyond decorum at stake. Why was the software designed to so flagrantly create these cases? It simply shouldn't! Obviously, we cannot prevent every issue. Whatever software you write operates on a mountain of other software and other layers of computer architecture you almost surely will have little to no control over. But most of the errors software expects to encounter it can understand, and by that same token prevent, or at least recover from with some grace. There is the exception of exceptions though. Catastrophes such as network failure, vendor outage, etc. The class of error that is unpreventable, unrecoverable, and yet your software still is running. Given all that I hope you would agree with me, and the rule above, that errors which don't need to be possible shouldn't be, errors which cannot be made impossible should be recovered from in every possible case with maximal grace, and everything else we do our best. That's the rule, crafted in the best language I could muster to get AI agents to follow it.

```
<--- ================================= ---->
```

The bookend does serve a purpose. Skills are just shortcuts to prompts, an agent invoking them sees the content, but it's up to them to interpret where the beginning and end of the skill is. The beginning of the skill is easier, because the invocation of the skill is a tool call the agent has some awareness of. The end is not. Without a final booked like the above line it's up to the agent's interpretation to decide where the skill's content probably ended. Technically the bookend doesn't solve the problem it just makes it much more obvious, especially when the skill began with that same bookend. It's not a normal "failure mode" but it does seem to send a stronger signal when the agent has absolutely no ambiguity whatsoever as to what the skill is. And I _think_ it makes it somewhat more official looking to the agent, which isn't bad considering the content.

--

# Meta stuff

## Styling

I've capitalized rule 2 out of frustration. I capitalized the operative instances of NEVER, ANY, EVERY, ALWAYS, NO, ALL, MUST and a handful of other words to draw extra emphasis. I have used `<IMPORTANT></IMPORTANT>` XML tags in prior versions. They work. BUT they help most when you have a lot of text and you need certain specific signals to really get a boost. I've consolidated to ~50 lines of text including formatting and whitespace to strengthen all my signals. With so little text I found putting `<IMPORTANT></IMPORTANT>` tags on anything signaled that the rest was comparatively unimportant. That was not the effect I intended and I don't have a pain point I need addressed so badly that it's worth boosting at the cost of dampening everything else. If you find you like these principles and want them ALL boosted, I would consider toying with wrapping the entire skills body in an `<IMPORTANT></IMPORTANT>` tag. I'm not recommending it per se, but it's how I would first approach it rather than littering `<IMPORTANT></IMPORTANT>` tags throughout.

## Facts & Rules?

There are certain signals like "2+2=4" that have been too important to leave out but don't really meet the bar of being actionable rules. Every one of the facts could be rephrased as an actionable rule, but I've also been disappointed in how often agents flake on rule alignment when there are even 30-50 rules. I think 30-50 is still a remarkably small amount of text, fewer than 70 lines, but agents just don't follow through with the consistency I want. This is one of the inspirations I took from NASAs Power 10 Rules; one of their most impactful decisions in devising them was that there could only be 10 rules. Of course they had to leave incredible insights and wisdom on the chopping block, but it was worth it to enforce the absolute most critical stuff. I couldn't limbo that low. I gave the agents an eleven course meal, with seven drinks. I'd be very proud of myself to get it down to exactly 10 rules. I don't think I will (or necessarily need to).