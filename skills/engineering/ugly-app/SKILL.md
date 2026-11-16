---
name: ugly-app
description: Build an app idea end to end as a deliberately ugly app, where every screen shows only its raw data and buttons, so flows and product decisions change cheaply before any design. Invoke /ugly-app with the app or flow to build.
disable-model-invocation: true
argument-hint: "What app or flow are we building?"
---

The user wants to build an app, or a large new flow in one, starting with an **ugly app**: the whole flow works from start to end, and every screen is just a title, its raw data and its actions.

Ugly on purpose. Seeing the whole flow early shows the gaps in the idea while they are cheap to fix, and screens nobody has styled are screens nobody hesitates to move, merge or delete. Design comes later, with `/pretty-app`.

## The project files

Everything this skill decides lives in the project's `.ugly/` folder: `blueprint.md`, `flows.md`, `ux-log.md` and `status.md`. Before creating or editing any of them, read [references/contract.md](references/contract.md) for their formats and for keeping `.ugly/` out of git.

If `.ugly/` already exists, read it first and continue from where it stands; don't start over.

## Stage 0: Blueprint

Before any screen exists, write `blueprint.md`: the beats of the app, from first launch to the end of the value chain, each with what the user does, what the system does and anything that happens behind the scenes.

Ask the user what you need to write it, one question at a time: who it's for, the core value, what the first session looks like, what brings them back. Prefer a recommended answer they can accept over an open question.

Show the beats and get a yes before building. A wrong beat costs a sentence to fix now and a screen later.

## Stage 1: Build ugly

Detect the stack from the project (or ask, for a new one). Read the matching section of [references/stacks.md](references/stacks.md) once, then follow the project's own conventions where they exist.

### The ugly rules

1. **Each screen shows a title, its raw data and its actions.** Nothing else: no layout work, no icons, no images.
2. **Platform defaults only.** No custom colors, fonts, spacing, components, animations or transitions. If you notice yourself reaching for a modifier or a class, stop.
3. **Screens hold no logic.** Data, rules and side effects live in the stack's natural home (model, view model, service, hook). A screen reads state and calls actions. This is what lets `pretty-app` replace every screen without touching anything that works.

### Build order

1. The data model and the logic for every beat, with the smallest real persistence the app needs.
2. Screens, one beat at a time, in blueprint order. Get the thinnest version of every beat working end to end before deepening any of them.
3. Empty states (no data yet) and the errors a user can actually cause. Ugly, but present.

### Make walking the flow fast

Debug-only, gated so they never ship:

- **Seed data** that exercises real cases: a long name, an empty list, a full list.
- **A reset** back to first launch.
- **A jump menu** that opens any screen directly.

### Stub what isn't core

Payments, notifications, third-party APIs and similar: put each behind one interface with a fake implementation, and list it under `## Stubs` in `flows.md`. Build the real one only when the user asks, or when the beat can't be judged without it.

## Logging what comes later

Whenever the user says something about how a screen should look or feel ("later", "this should feel like…", "make it fun"), or you notice an open question that isn't about how the app works:

- Add an entry to `ux-log.md` and a `UX-###` tag at the spot in the code, as the contract describes.
- Ideas that exist to bring joy rather than function get `Kind: delight`. Never build them here; they are parked for hi-fi.
- Tell the user in one line which ID you logged, so nothing they said disappears.

Don't log flow questions you can settle now. Settle them.

## Walk it

After each beat works end to end, ask the user to run the app and click through everything built so far, then ask: **what feels wrong in the order of things?**

Sort what comes back:

- **Flow changes** (screens, their order, what data a screen needs, what an action does): make them now, while they're cheapest. Update `blueprint.md` and `flows.md` to match.
- **Look and feel:** log it. Don't fix it.

If the user isn't there to walk it, keep building and list what to walk in your next message.

## Keep the map true

After any change to screens or transitions, update `flows.md` in the same step. The flow map is what `pretty-app` and the user steer by; a stale one is worse than none.

## Exit gate

Before saying the ugly app is done, check every item and report any that fail:

- [ ] Every beat in `blueprint.md` works end to end in the running app.
- [ ] Every screen has its empty state, and errors the user can cause are handled.
- [ ] `flows.md` matches the code: every screen, transition and stub.
- [ ] Every open question in the code has a `ux-log.md` entry, and every entry with a place in the code has its tag.
- [ ] `status.md` lists every screen as `json`.

Then tell the user the app is ready for `/pretty-app`, and list the stubs that still need real implementations.
