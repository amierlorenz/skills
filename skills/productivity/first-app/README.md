# first-app

A Claude Code skill that coaches someone who has never coded through building their own iPhone app in SwiftUI, over many sessions.

It starts with the learner making only product decisions (what the app does, how it looks) while Claude writes the code, then removes one layer of abstraction per level until they write features themselves:

| Level | The learner |
|---|---|
| 1 The Boss | Decides what the app does and how it looks. Touches no code. |
| 2 The Designer | Changes words, colors and spacing in the code. |
| 3 The Rule Maker | Writes the app's rules in English, then edits the Swift version. |
| 4 The Builder | Fills in the blanks, with a hint ladder. |
| 5 The Developer | Writes features; Claude reviews. |

Claude never suggests leveling up on its own; the learner asks when they want to know if they're ready, and can drop back a level any time.

## Progress

Progress lives in `~/Learning/<app>/`, in the same layout as [`learn`](../learn/README.md): `MISSION.md`, `PROGRESS.md` (level, wins, glossary, parking lot), `learning-records/`, and the shared `~/Learning/LEARNER.md`. So `/learn` sessions about Swift build on what `/first-app` taught, and the other way round. The project gets a `.learning` symlink, kept out of git through `.git/info/exclude`.

## Requirements

- A Mac with Xcode (free on the Mac App Store).
- Claude Code, opened in the folder Xcode creates for the project. Claude edits the Swift files; the learner watches the preview and Simulator in Xcode.

## Install

Install the plugin from this repo (see the [main README](../../../README.md#install)), then run `/amierlorenz-skills:first-app <your app idea>`. Claude won't start it on its own.

To let it write progress without asking each time, add `~/Learning` to `permissions.additionalDirectories` in `~/.claude/settings.json`.

## Uninstall

The skill keeps no cache or config. Your progress stays in `~/Learning/<app>/` until you delete it.
