# pretty-app

A Claude Code skill that designs a working app in three gated stages: low-fi layout, mid-fi native components, and hi-fi brand and delight. It picks up where [`ugly-app`](../ugly-app/README.md) leaves off, and also works on any existing app.

Based on Wesley Yu, VP of Engineering at Metalab, on [Software Engineering Daily](https://softwareengineeringdaily.com/wp-content/uploads/2026/07/SED1930-Metalab.txt): screens go from JSON to wireframes, to mid-fidelity without brand, to high fidelity.

## Stages

| Stage | Screens look like | What happens |
|---|---|---|
| Low-fi | grayscale boxes, real labels | Layout and hierarchy. Variants for open layout questions. |
| Mid-fi | the platform's stock components | Real navigation, accessibility, empty/loading/error states, and a feel pass (prefetch on intent, optimistic updates, no blank screens). |
| Hi-fi | this app and no other | References first, design tokens, one signature element, one to three magic moments, visible feedback on every tap, screenshot check. |

Each stage is finished across the whole app before the next starts. The last gate requires every `UX-###` tag gone from the code.

## Variants

For an open question, Claude builds three structurally different versions of the screen, in the app, with real data, behind a debug-only switcher. You pick by using them. "B's layout with C's header" becomes a new variant D. The winner becomes the screen; the rest are deleted.

The variant approach is adapted from the UI branch of Matt Pocock's [`prototype`](https://github.com/mattpocock/skills/tree/main/skills/engineering/prototype) skill. The difference: a prototype is thrown away, while here the winner is kept and carried up the next stage.

## Flow changes loop back

If a design decision changes what a screen does (which screens exist, their order, their data, their actions), Claude says it's a flow change, drops those screens back to raw data, fixes the logic, and brings them back up. Restyling a screen whose flow is still moving is wasted work.

## Without ugly-app

With no `.ugly/` folder, Claude reads the code, drafts the flow map and each screen's current fidelity, and checks them with you before designing. See [`ugly-app`](../ugly-app/README.md#project-files) for the folder layout.

Works with any stack: [`references/stacks.md`](references/stacks.md) maps the rules to web, SwiftUI, Compose, Flutter and React Native.

## Install

Install the plugin from this repo (see the [main README](../../../README.md#install)), then run `/amierlorenz-skills:pretty-app`. The skill can only be started by you; Claude won't invoke it on its own.

## Uninstall

The skill keeps nothing outside your projects. In each project, delete `.ugly/` and remove its line from `.git/info/exclude`:

```
rm -rf .ugly && sed -i.bak '/^\.ugly\/$/d' .git/info/exclude
```
