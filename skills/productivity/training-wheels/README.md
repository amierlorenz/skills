# training-wheels

A Claude Code skill that coaches someone who has never coded through building their own first app, over many sessions. It works for an iPhone app (SwiftUI), a web app, or a Python game.

The learner starts by seeing what's possible: they make only product decisions while Claude writes the code. Each level then removes one layer of abstraction, until they're writing features with real software engineering habits:

| Level | The learner | Habits picked up |
|---|---|---|
| 1 The Boss | Decides what the app does and how it looks. Touches no code. | Small steps, run it after each one |
| 2 The Designer | Changes words, colors and spacing in the code. | Save points (commits) |
| 3 The Rule Maker | Writes the app's rules in English, then edits the code version. | Reading errors, debugging |
| 4 The Builder | Fills in the blanks, with a hint ladder. | Naming, small functions, reading docs |
| 5 The Developer | Plans and writes features; Claude reviews. | Planning, testing, refactoring |

- Claude never suggests leveling up; the learner asks when they want to know if they're ready.
- "You do it" is always offered as an option, and it's always the learner's choice.
- At Level 1, Claude invites curiosity about the code but shows it only when asked.
- Every win lands on a phone-friendly **trophy page** to show friends.

## Progress

Progress lives in `~/Learning/<app>/`, in the same layout as [`learn`](../learn/README.md): `MISSION.md`, `PROGRESS.md` (level, wins, glossary, parking lot), `trophies.html`, `learning-records/`, and the shared `~/Learning/LEARNER.md`. So `/learn` sessions build on what `/training-wheels` taught, and the other way round. The project gets a `.learning` symlink, kept out of git through `.git/info/exclude`.

## Requirements

- **iOS:** a Mac with Xcode (free on the Mac App Store).
- **Web:** any browser.
- **Python game:** Python 3; the skill installs pygame.

## Install

Install the plugin from this repo (see the [main README](../../../README.md#install)), then run `/amierlorenz-skills:training-wheels <your app idea>`. Claude won't start it on its own.

To let it write progress without asking each time, add `~/Learning` to `permissions.additionalDirectories` in `~/.claude/settings.json`.

## Uninstall

The skill keeps no cache or config. Progress stays in `~/Learning/<app>/` until you delete it.
