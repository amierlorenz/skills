# LEARNER.md Format

`~/Learning/LEARNER.md` is the learner profile: the one file every teaching workspace reads and writes. It lets what the user learned in one topic shape lessons in another. It is an index of compressed facts about the learner, not a store of lesson content.

## Template

```md
# Learner Profile

## Known

- **JavaScript module bundling** `javascript` `build-tooling`: can explain how a bundler resolves imports into chunks. 2026-10-20. [LR-0003](electron-internals/learning-records/0003-bundling.md)
- **Prior: Python** `python`: several years, comfortable with classes and async. Stated 2026-10-20.

## Preferences

- Prefers short lessons with one runnable exercise over long reading.

## Shared Terms

**Event loop**:
The single-threaded scheduler that runs queued callbacks when the call stack is empty.
_Avoid_: Main loop, run loop (unless discussing Apple platforms)

## Misconceptions Corrected

- `concurrency` Believed `async` functions run on a separate thread; now knows they share the event loop. 2026-10-20. [LR-0005](electron-internals/learning-records/0005-async-threads.md)
```

## Rules

- **One line per entry**, with its tags, the date it was last demonstrated, and a link to the learning record that holds the evidence. Links are relative to `~/Learning/`. Stated prior knowledge has no record; mark it `Prior:` and note the depth claimed.
- **Tags come from the registry** in `~/Learning/TAGS.md`, and match the tags on the linked record.
- **Update the date** when the user demonstrates the item again. Old dates mark candidates for retrieval practice.
- **Shared Terms are for cross-topic vocabulary only.** Terms used in a single topic stay in that workspace's glossary. Follow the rules in [GLOSSARY-FORMAT.md](./GLOSSARY-FORMAT.md).
- **Misconceptions are high value.** They predict stumbling blocks in related topics; keep them until the user has shown they are resolved in more than one context.
- **Revise in place.** If an entry turns out wrong, fix or remove it rather than appending a contradiction.
