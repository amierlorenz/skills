# own-it

A Claude Code plugin by Amier ([amierlorenz](https://github.com/amierlorenz)): a learning loop for AI-assisted
code changes, enforced by hooks. Lives in `plugins/own-it` of the [`amierlorenz/skills`](https://github.com/amierlorenz/skills)
marketplace; the repo's root CLAUDE.md (git workflow, writing skills, where skills keep things) applies too.
Run the checks below from this folder.

## Layout
- `bin/own-it`: the state machine, and the only writer of `.own-it/state.json`. Gates live in its `gate()`.
- `hooks/own-it-guard.sh`: PreToolUse guard (Edit, Write, MultiEdit, NotebookEdit, Bash). Stable hooks API only.
- `hooks/own-it-context.sh`: UserPromptSubmit reminder of the phase and Claude's job in it.
- `hooks/register.tsx`, `hooks/display.ts`: the band (early-access function hooks). Must fail without affecting the guard.
- `skills/own-it/SKILL.md`: what Claude does in each phase. `rubric.example.md`: the default rubric.

## Checks
- Guard or CLI changes: a failing case in `hooks/own-it-guard.test.sh` first, then the fix;
  `bash hooks/own-it-guard.test.sh` must end with `failures: 0`.
- A new field in `own-it status --json` goes in `types/index.d.ts` too. A changed field gets a new `shape` tag on
  the `status` atom, with a test that the old value is declined.
- Display changes: `claude plugin test .` must pass.
- After touching `.claude-plugin/*.json` or `hooks/hooks.json`: `claude plugin validate .`, then install from a local
  marketplace copy and check that `claude plugin list` shows it enabled.
- Every change names its source in the PR: the Claude Code plugin or hooks docs, a learning-science source for
  loop changes, or a linked observed failure. No source: call it a proposal.

## Skill
- The user decides, writes and explains; Claude types, runs and asks. A change that hands thinking back to Claude
  needs a reason in the PR.
