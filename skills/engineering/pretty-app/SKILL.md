---
name: pretty-app
description: Design a working app in three gated stages (low-fi layout, mid-fi native components, hi-fi brand and delight), comparing real variants on real data. Invoke /pretty-app on an app built with /ugly-app, or on any existing app.
disable-model-invocation: true
argument-hint: "Which app, or which screens, are we designing?"
---

The user has a working app and wants to design it. The app usually comes from `/ugly-app`: every flow works, and every screen is a title, raw data and buttons.

Design happens in three stages, each finished across the whole app before the next starts, so screens stay consistent with each other:

| Stage | Screens look like | The question |
|---|---|---|
| Low-fi | grayscale boxes and real labels | What goes where? |
| Mid-fi | the platform's stock components | Does it work and feel native? |
| Hi-fi | this app and no other | Does it feel loved? |

## Start

Read [references/contract.md](references/contract.md), then the project's `.ugly/` folder. `status.md` says where each screen is; continue from there.

**No `.ugly/` folder** (an app not built with `ugly-app`, or a fresh clone): build the contract from the code before designing. Read the screens and navigation, write `flows.md`, write `status.md` with your honest read of each screen's current fidelity, draft `blueprint.md` from what the app does, and turn open questions you find into `ux-log.md` entries. Show the user the flow map and statuses and get a yes before going further.

Detect the stack and read the matching sections of [references/stacks.md](references/stacks.md) when a step needs them.

## Rules for every stage

- **Logic stays out of screens.** Design work changes views. If a design decision needs logic to change, it is a flow change (below), not a design change.
- **Real data only.** Design against the app's real store and seed data, never invented sample content: long names, empty lists and full lists are where layouts break.
- **Close the log as you go.** When a stage settles a `ux-log.md` entry, fill its decision and why, and remove its tags from the code in the same step.
- **Keep `status.md` true** after every screen you move up a level.

## Flow changes loop back

You decide whether a change is a flow change, and say which you decided and why in one line. It is a flow change when it changes which screens exist, their order, the data a screen needs or what an action does. Otherwise it is visual.

For a flow change:

1. Log it as `Kind: flow` and mark every affected screen `json` in `status.md`.
2. Make the change ugly-style: logic first, screens back to raw data and default buttons, no styling.
3. Update `flows.md` (and `blueprint.md` if a beat changed), ask the user to walk the changed flow, then bring the screens back up through the stages.

Don't restyle a screen whose flow is still moving; that work gets thrown away.

## Variants

When a screen has an open layout question, or the user asks to see options, build variants instead of picking one yourself. Read [references/variants.md](references/variants.md) before building the first variant in a session.

## Low-fi

Goal: layout and hierarchy. Nothing else.

- Grayscale only. Real labels and real data; gray boxes where images will go.
- Decide what each screen is for, what the user sees first, and what can be removed.
- Variants for every screen with an open `layout` entry in `ux-log.md`.

**Gate:** every screen `lowfi`, and no `layout` entries left open.

## Mid-fi

Goal: the platform's real components and behavior, with no brand.

- Real navigation patterns, the platform's own components, system fonts and system icons.
- Accessibility: text scales with the user's size setting, dark mode works, every control has a screen-reader label.
- Empty, loading and error states for every screen, designed rather than left raw.
- **Feel pass:** the app responds before the user waits.
  - Load what the user is about to open when their intent shows (hover, focus, scrolling near it).
  - Update the screen immediately on an action and reconcile with the result after (optimistic updates), unless failure would mislead the user.
  - Never a blank screen: show cached or partial content while loading.

Then ask the user to use the app for real, for a day if they can. Stock components show their problems with use, not on first look.

**Gate:** every screen `midfi`, the user has used it, and no `feel` entries left open.

## Hi-fi

Goal: make it this app, not an app. AI-default styling is recognised quickly and valued less, so every choice here starts from the user's taste, not the template.

1. **References first.** Ask for two or three apps, objects, places or eras whose feel the user wants. Propose a direction in a few sentences, with one alternative, and get a pick.
2. **Tokens.** Color, type scale, spacing and corner radius in one place in the code. Apply them everywhere before styling any single screen further.
3. **One signature element:** something a default template would not produce, tied to what the app is about. Agree on it with the user before building it.
4. **Magic moments:** with the user, pick one to three moments that matter most (a first success, a completion, a reveal) and overinvest there instead of polishing everything evenly. The parked `delight` entries are candidates; build the ones the user picks and defer the rest with a why.
5. **Every tap gets a visible reaction.** Pressed states, transitions that show where things went, feedback on success and failure. Haptics only where they match a physical action; a vibration with no visible cause feels like a fault.
6. **Expensive ideas:** when a design idea is costly to build, don't accept or reject it. Build the dream version and the cheap version as variants, then find the middle with the user.
7. **Screenshot check:** capture every screen in light and dark, on the smallest and largest supported size, and read each image. Fix what you see before calling a screen done.

**Gate:**

- [ ] Every screen `hifi` in `status.md`.
- [ ] Zero `UX-` tags left in the code; search for them.
- [ ] Every `ux-log.md` entry `decided` or `deferred`, each with a why.
- [ ] No variant switchers or leftover variant code; debug tools are still gated out of release builds.
- [ ] Screenshots reviewed for every screen.

Then summarize for the user: the direction, the signature element, the magic moments, and what was deferred.
