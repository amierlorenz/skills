# ugly-app

A Claude Code skill that builds an app idea end to end as a deliberately ugly app: the whole flow works, and every screen is just a title, its raw data and its buttons. Design comes after, with [`pretty-app`](../pretty-app/README.md).

The idea comes from Wesley Yu, VP of Engineering at Metalab, on [Software Engineering Daily](https://softwareengineeringdaily.com/wp-content/uploads/2026/07/SED1930-Metalab.txt): build the full flow with screens that render JSON and a button, walk through it, reorder it, then work with design on how each screen should present its data.

## Why

- **Gaps show up early.** Walking the whole flow on day one shows what's missing from the idea while it's cheap to change.
- **Nothing to defend.** Nobody hesitates to move, merge or delete a screen nobody has styled.
- **Design gets a clean handoff.** Logic stays out of the screens, so every screen can be redesigned without touching anything that works.

## Stages

0. **Blueprint:** the beats of the app, from first launch to the end of the value chain. No screens.
1. **Build ugly:** logic first, then one ugly screen per beat, thin end to end before deep. Seed data, a reset and a jump-to-any-screen menu, all debug-only.
2. **Walk it:** after each beat, you click through. Flow changes happen now; look-and-feel ideas get logged.
3. **Exit gate:** every beat works, empty states exist, the flow map matches the code.

## Project files

```
.ugly/                 # kept out of git through .git/info/exclude
├── blueprint.md       # the beats
├── flows.md           # screens, transitions (Mermaid), stubs
├── ux-log.md          # open UX/UI questions as UX-### entries
└── status.md          # each screen's fidelity: json → lowfi → midfi → hifi
```

Code gets short `// UX-012: …` comments that point at log entries. They're temporary: `pretty-app` closes them all before hi-fi is done.

Works with any stack. The rules are principles, and [`references/stacks.md`](references/stacks.md) shows how they map to web, SwiftUI, Compose, Flutter and React Native.

## Install

Install the plugin from this repo (see the [main README](../../../README.md#install)), then run `/amierlorenz-skills:ugly-app <your app idea>`. The skill can only be started by you; Claude won't invoke it on its own.

## Uninstall

The skill keeps nothing outside your projects. In each project, delete `.ugly/` and remove its line from `.git/info/exclude`:

```
rm -rf .ugly && sed -i.bak '/^\.ugly\/$/d' .git/info/exclude
```
