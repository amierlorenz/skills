# skills

Claude Code skills by Amier Lorenz, published as a plugin marketplace.

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
