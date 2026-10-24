# learn

A Claude Code skill that teaches you a topic over many sessions, with lessons that build on everything you've learned before, in any topic.

`/learn` is a fork of Matt Pocock's [`/teach`](https://github.com/mattpocock/skills/tree/main/skills/productivity/teach) skill. It keeps its teaching approach (a mission, short interactive HTML lessons, reference sheets, learning records, and lessons pitched just past what you already know) and changes where your learning lives and how topics connect.

## How it differs from `/teach`

| | `/teach` | `/learn` |
|---|---|---|
| Where a workspace lives | The folder you run it in | Its own folder under `~/Learning/<topic>/` |
| What it knows about you | Only this topic's learning records | This topic's records plus a learner profile shared by every topic |
| Finding related learning | Not supported across topics | Tags from a shared registry, searchable across all workspaces |
| Link to a code project | The project folder *is* the workspace | Two-way symlinks that repair themselves after the project moves |

### Why

- **Learning should compound.** In `/teach`, each workspace starts from zero, so a new topic may re-teach what you learned in another. `/learn` keeps a short learner profile (`~/Learning/LEARNER.md`) of what you've demonstrably learned, your teaching preferences, shared terms, and corrected misconceptions. Every session reads it, and lessons use it for spaced retrieval practice across topics.
- **Project folders stay clean.** Lessons, records, and reference sheets no longer land in your code repos. A topic about a project gets a `.learning` symlink in the project (kept out of git through `.git/info/exclude`) and a `project` symlink back.
- **Nothing to drift.** All workspaces sit under one folder, so there's no index of paths to go stale. Moving a project only breaks the convenience `project` link, and the skill re-points it the next time you run `/learn` from the project.
- **Cheap retrieval without a vector database.** Records carry 1-3 tags from a controlled vocabulary (`~/Learning/TAGS.md`, with definitions and aliases to prevent near-duplicate tags). Finding related learning is one registry read and one search.

## Layout

```
~/Learning/
├── LEARNER.md            # learner profile, shared by all topics
├── TAGS.md               # tag registry
└── electron-internals/   # one folder per topic
    ├── MISSION.md
    ├── RESOURCES.md
    ├── NOTES.md
    ├── lessons/
    ├── reference/
    ├── learning-records/
    ├── assets/
    └── project -> ~/Code/my-electron-app
```

## Install

Clone this repo and link it into your Claude Code skills folder:

```bash
ln -s /path/to/learn-skill/learn ~/.claude/skills/learn
```

Then run `/learn <what you want to learn>`. The skill can only be started by you; Claude won't invoke it on its own.

When you run `/learn` from a project folder, Claude Code may ask for permission to write to `~/Learning/`. To allow it permanently, add `~/Learning` to `permissions.additionalDirectories` in `~/.claude/settings.json`.

## License

MIT. The original `/teach` skill is © Matt Pocock; see [LICENSE](LICENSE).
