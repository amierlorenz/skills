# TAGS.md Format

`~/Learning/TAGS.md` is the tag registry: the controlled vocabulary for tagging learning records and learner profile entries across every workspace. A tag that is not in the registry should not be used.

## Structure

```md
# Tag Registry

**concurrency**:
Running or interleaving several tasks over the same period of time, including async code and threads.
_Avoid_: async, asynchronous, multithreading

**javascript**:
The JavaScript language and its runtimes (browsers, Node.js, Electron).
_Avoid_: js, node, ecmascript

**networking**:
How programs exchange data over a network: protocols, requests, sockets.
_Avoid_: http, network-requests, web-traffic
```

## Rules

- **Names are lowercase, kebab-case, singular, and spelled out.** `javascript`, not `js` or `JavaScript`; `data-structure`, not `data-structures`. Abbreviations become aliases.
- **Every tag has a one-line definition.** Writing it is the check against duplicates: if the definition overlaps an existing tag, use that tag instead.
- **Aliases go under `_Avoid_`.** When a word comes to mind that is listed as an alias, use the tag it belongs to.
- **Prefer broad tags.** A tag should be able to cover records from several workspaces. One that only ever fits one record is too narrow.
- **Merging** keeps the better name, renames the other in every record and profile entry, and adds the old name to the kept tag's aliases. Propose merges to the user before applying them.
- **Keep the registry alphabetical** so near-duplicates sit next to each other and are easy to spot.
