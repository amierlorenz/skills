# skills

Claude Code skills by Amier ([amierlorenz](https://github.com/amierlorenz)), published as a plugin marketplace.

## Git workflow (pr mode)
<!-- git-workflow:pr — checked by ~/.claude/hooks/git-workflow-guard.sh; keep this marker -->
- Never commit to main, never merge a PR, never force-push. If a branch falls behind main, merge main into it.
- One branch per issue or feature: `feat/<issue#>-<slug>`, `fix/<issue#>-<slug>`.
- Conventional Commits 1.0.0, subject line only unless the why isn't obvious from the diff.
  Breaking changes: `!` after the type and a `BREAKING CHANGE:` footer.
- Run `git add` and `git commit -m "<subject>"` as separate commands, never chained.
- PR title is a conventional commit (it becomes the squash commit on main).
  Body: what, why, how tested, open questions, `Closes #N`.
- Review comments: fix what's clear, ask on the PR when ambiguous, reply to every thread.

## Writing skills
- Skill files are read on every run: keep a line only if the agent would act differently without it.
- Keep: a one-clause reason where it prevents a regression ("Whisper drops ums, so detect with CrisperWhisper"),
  numbers the agent acts on (thresholds, time estimates, limits), and checks it must run.
- Leave out: how a change was tested, measurements as proof, dates, who decided, session stories.
  They go in the commit or PR description, where git keeps them with the change.
- Every change to a skill names its source in the PR: the [Anthropic skill building guide](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf), [Claude Platform Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview), [Agent Skills spec](https://agentskills.io/specification.md), the agentskills.io guides, or reputable skill repos like [mattpocock/skills](https://github.com/mattpocock/skills) for writing, or a linked observed failure. No source: call it a proposal.
- Length: `SKILL.md` under 500 lines and ~5k tokens (agentskills.io spec). Material only some runs need goes in `references/` (one level deep),
  behind a pointer that says when to read it.
- Invocation: model-invoked only when a situation should trigger the skill without the user asking (an error,
  a hook, a file type); otherwise user-invoked (`disable-model-invocation: true`, and
  `policy.allow_implicit_invocation: false` in `agents/openai.yaml`). Descriptions front-load the trigger.
- No personal paths, names or course codes in examples. Credit forks in the skill and the README.

## Where skills keep things
Never write into the skill folder: plugin and `npx skills`/`gh skill` updates replace it.
- Preferences: `~/.config/amierlorenz-skills/<skill>.md`, created on setup from the skill's
  `preferences.example.md`. Without the file, use the example's defaults (cloud sessions have no `~/.config`).
  Say "run setup if missing" only where defaults would make the output wrong.
- Data the user reads: a named, visible folder (`learn` uses `~/Learning/`).
- Caches: `~/.cache/<skill>/`, pruned by age or size at the start of a run. Never delete shared caches
  (e.g. `~/.cache/huggingface`); say in the README where they are and how big they get.
- Per-run files: a temp folder each script creates and removes on exit (`trap 'rm -rf "$T"' EXIT`).
- Each skill's README ends with its uninstall line: `rm -rf ~/.cache/<skill> ~/.config/amierlorenz-skills/<skill>.md`.

## Manifests
After touching `.claude-plugin/*.json`: run `claude plugin validate .`, then install from a local copy with the
marketplace renamed, and check that `claude plugin list` shows it enabled. `validate` passes configs that fail
to load (#6). No `version` on purpose, so installs follow `main`; ignore that warning.
