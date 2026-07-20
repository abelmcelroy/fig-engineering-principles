<h1 align="center">Fig: <a href="https://en.wikipedia.org/wiki/Fig#:~:text=According%20to%20the%20opinion%20of%20Rabbi,Christ%20withers%20in%20the%20Gospels">the fruit of knowledge</a></h1>

<p align="center"><em>These are engineering principles for high quality code without babysitting.</em></p>

<p align="center">
  <a href="https://www.npmjs.com/package/fig-engineering-principles"><img src="https://img.shields.io/npm/v/fig-engineering-principles" alt="npm version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-PolyForm%20Noncommercial%201.0.0-blue" alt="license"></a>
</p>

<p align="center">
  <a href="#the-skills">The skills</a> ·
  <a href="#orchestration">Orchestration</a> ·
  <a href="#install">Install</a> ·
  <a href="#license">License</a>
</p>

---

## The Problem

We've all seen it, but I'll spell out the cascade. Agents are literally designed to output text. They lean into this behavior by default, leaping ahead with wrong assumptions, poor designs, and stuff you didn't ask for. This problem compounds. Each new agent reads the bloated code from its predecessors; using more input tokens. It has to process longer and harder to understand the nonsense it's ingested; using more thinking tokens. Then its work needs to cover an overly complex surface of cases, features, and states that never needed to exist in the first place; creating more output tokens. This cascade is what encumbers contexts, grows code bases like algae in a fake pond, and causes token costs to explode whenever you even whisper the words "vibe coding."

## The Thesis

By emphasizing principles of software engineering that great engineers already use to mitigate tech debt, distilled into language that specifically targets the ways AI agents wander astray of those principles, agents will write the right code, and by definition produce less, minimize complexity, and cost less over time.

## Motivation

I devised these skills from obsessing over how to get more out of AI coding agents nearly round the clock for six months. My view is and was that AI coding tools aren't worth it, no matter how amazing the tech is, if I'm trapped at my desk the same number of hours a day. And the singular determining factor trapping me at my desk is whether or not I expect agents to produce code that is at least good _enough_. My bar is high (very) so it's been a real struggle.

> **The vast majority of my waking hours in 2026 have been tirelessly dedicated to understanding coding agent's failures, and how modify their behavior effectively. You can read about my experience of doing that work and the insights behind these rules in the the [explanations.md](explanations.md) file. I strongly encourage everyone to do so.**

## Metrics

Measurements are tricky. Cherry picking a prompt and showing how little code it writes compared to vanilla agents or other skills isn't the quality of proof I want to deliver.

Creating standards for code complexity measurements, autonomy benchmarks, and measuring how token budget metrics are related to the aforementioned are all on my roadmap, so stay tuned.

## The skills

### `/fig`
The core skill is `/fig` and I recommend using it at the top of your sessions. 

### `/fig-workflow`
Accompanying the core principles contained in `/fig` is a basic orchestration workflow to squeeze maximal quality and autonomy out of those principles.

### `/fig-agent`
This package comes with an agent built with the those same principles as well called `/fig-agent`. This agent is integral to the aforementioned workflow.

The principles themselves are in [principles.md](principles.md).

## Orchestration

The Fig orchestrator uses very similar skills to these internally. It also contains all kinds of machinery ranging from obvious to fancy to make your experience of using coding agents as amazing as possible!

That aside, if you don't feel comfortable dipping your toes into an orchestrator yet (even through it's free-to-use), I'm giving you the basic premise of what Fig would do for you with the above skills.

I recommend using them in the following way:

```bash
cd $PROJECT_DIR
claude --dangerously-skip-permissions
/fig
/fig-workflow <your task description goes here>
<conversation with agent clarifying their understanding of the goals of the work>
```
Then go do whatever you want. Check in later to see if the work is done or there's a question for you.

## Install

Pick one:

**Copy-paste**
- Claude Code skills: copy [skills/fig/SKILL.md](skills/fig/SKILL.md) to `~/.claude/skills/fig/SKILL.md` and [skills/fig-workflow/SKILL.md](skills/fig-workflow/SKILL.md) to `~/.claude/skills/fig-workflow/SKILL.md`.
- Claude Code agent: copy [agents/fig-agent.md](agents/fig-agent.md) to `~/.claude/agents/fig-agent.md`.
- Tools that read an `AGENTS.md` (Codex, etc.): copy [principles.md](principles.md) into your project's `AGENTS.md`.

**Claude Code plugin**

```
/plugin marketplace add abelmcelroy/fig-engineering-principles
/plugin install fig@fig-principles
```

**curl**

```
curl -fsSL https://raw.githubusercontent.com/abelmcelroy/fig-engineering-principles/main/install/install.sh | sh
```

Installs the `/fig` and `/fig-workflow` skills and the `/fig-agent` subagent into `~/.claude/`.

**npm**

```
npx fig-engineering-principles
```

Same — the `/fig` and `/fig-workflow` skills and the `/fig-agent` subagent.

## General Claude Code Advise

I use Claude Code (not codex, cursor, copilot, ...). Here's some stuff I'd highly recommend you at least learn more about if you do too:

1. **NEVER AUTOCOMPACT!** Don't even approach 100% context. Imagine all the tokens you'll spend in a session from 0% to 100%. At least as many tokens will likely be spent from 70% to 100% as will between 0% and 60%! You're sending the entire conversation on every request. ALSO, autocompaction dredges up long stale content from early on in a session back to the forefront of an agents awareness. Settled questions, reversed decisions, discussion points from completed work: it all comes back in no particular focus. Agent's are irreversibly incoherent after autocompaction.

2. **Turn off automemory.** It's ass. It seems nice at first when agents magically know stuff want them to know, but the feature is additive and has no protocol for reaping/pruning stale information. Over time you'll find it wastes context and confuses agents more than it helps.

3. **Use `--dangerously-skip-permissions`.** It IS dangerous. But the biggest danger is YOU. If you're wearing the paint off your enter key, consider how your use of the tool left you with so little confidence in its behavior.

4. **Consider purity checks.** This suggestion has an expiration date on it, but if you're using Anthropic's Fable model and are annoyed by the false-positives in their safety check that degrades Fable agents to Opus try this: Have your Fable agent delegate their work -> have them instruct delegates to submit their final reports in files and only send a neutral final message containing almost no content, only pointing at those files -> when subagents finish have the delegator agent grep those subagent session files specifically for the models which were used on each message, nothing else. If the messages are purely Fable, it can read the files, if not it holds for you. Annoying but it will save you from poisoning conversations and work unnecessarily.

## License

[PolyForm Noncommercial 1.0.0](https://polyformproject.org/licenses/noncommercial/1.0.0) — free to use, modify, and share for any noncommercial purpose; see [LICENSE](LICENSE). For commercial use, contact abel.h.mcelroy@gmail.com.
