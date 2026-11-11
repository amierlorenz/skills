# Variants

Variants let the user choose by using the screen, not by reading a description. They live in the app, on the real screen, with real data. Unlike a throwaway prototype, the winner is kept and becomes the screen.

## Plan

Write the plan in one line at the top of the variant code, so a reader knows what it's for:

```
// Variants for Home: list vs. sections vs. calendar strip (UX-012). Delete after picking.
```

- **3 variants by default, 5 at most.** More stop being different and start being noise.
- **Different in structure,** not just color or copy. Variants that differ only in a color are a tweak; make the call or ask.
- **Shared code is limited to pieces like a header.** A shared layout defeats the point: each variant must be free to throw the layout out.
- **Same stage.** Low-fi variants are grayscale, mid-fi variants use stock components, hi-fi variants use the tokens. A more polished variant wins because it is polished, not because it's better.

## Build

- Render the variants on the existing screen, with its real data, navigation and state. Don't create a separate demo screen.
- Add a small floating switcher: previous, the current variant's letter, next. Cycling wraps around.
- Remember the current variant across reloads or relaunches (see `stacks.md`), so the user can leave and come back to the same one.
- Gate the switcher and the variant selection to debug builds (see `stacks.md`).
- Tell the user which screen to open and what each variant is trying, in one line each.

## Remix

When the user wants parts of several ("B's layout with C's header"):

- Build a **new** variant, D, rather than editing B. Record its recipe in the plan line: `D = B layout + C header`.
- Compare D against its parents, B and C. It isn't better just because it is newer.
- At most **2 remix rounds** per screen. After that, stop and ask what the user is actually trying to decide; the question is probably unclear.

## Promote

Once the user picks:

1. The winning variant's code becomes the screen.
2. Delete every other variant and the switcher.
3. Close the `ux-log.md` entry with the decision and a one-line why from the user, and remove its tags.
4. Update `status.md`.

If the user isn't around to pick, leave the variants in place, say which you would pick and why, and move on to the next screen.
