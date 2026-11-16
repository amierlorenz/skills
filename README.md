# Skills

My Claude Code skills, the ones I use day to day for learning and building.

Each one is a plain Markdown `SKILL.md` you can read in a minute, so take them apart and make them your own.

## Install

In Claude Code:

```
/plugin marketplace add amierlorenz/skills
/plugin install amierlorenz-skills@amierlorenz
```

The plugin follows the latest commit on `main`, so updating the marketplace pulls in new and changed skills. It also installs [learning-core](https://github.com/amierlorenz/learning-core), which `learn` depends on.

Marketplaces other than Anthropic's don't auto-update by default. To get updates without asking, open `/plugin` → Marketplaces → `amierlorenz` → **Enable auto-update**. Otherwise update by hand from `/plugin` → Installed, or `claude plugin update <plugin>@amierlorenz`, then `/reload-plugins`.

### Pick individual skills

The plugin installs every skill. To choose, copy the ones you want instead (any agent, editable files, no auto-update):

```
npx skills@latest add amierlorenz/skills          # asks which skills and which agent
gh skill install amierlorenz/skills learn         # GitHub CLI (preview); omit the name to choose
```

Update with `npx skills@latest update` or `gh skill update`. Use one install method per agent, or you get every skill twice.

## Skills

**User-invoked** skills run only when you type `/name`; **model-invoked** ones also load on their own when the task calls for them.

### Productivity

#### User-invoked

- **[learn](skills/productivity/learn/SKILL.md)**[^teach]: teaches you a topic over many sessions, with lessons that build on everything you've learned before, across topics.

### Engineering

#### User-invoked

- **[pretty-app](skills/engineering/pretty-app/SKILL.md)**[^prototype]: designs a working app through low-fi, mid-fi and hi-fi, comparing real variants on real data. Picks up where `ugly-app` leaves off.

## Plugins

Plugins that live in their own repo and are listed in this marketplace.

- **[git-workflow](https://github.com/amierlorenz/git-workflow)**: a hands-on or pr git workflow per repo, enforced by a hook. Install on its own with `/plugin install git-workflow@amierlorenz`.
- **[own-it](https://github.com/amierlorenz/own-it)**: own every line of an AI-assisted change. You map, plan, predict and explain; Claude types exactly what you ask and tutors, enforced by hooks. Install on its own with `/plugin install own-it@amierlorenz`.
- **[training-wheels](https://github.com/amierlorenz/training-wheels)**: coaches someone who has never coded through building their own first app, handing them more of the code level by level. Install with `/plugin install training-wheels@amierlorenz`.
- **[learning-core](https://github.com/amierlorenz/learning-core)**: the shared `~/Learning/` workspace (layout, learner profile, tags, learning records) that `learn` and `training-wheels` build on. Installed automatically by the plugins that need it.

### How the learning plugins connect

`learn` and `training-wheels` both depend on `learning-core@^1.0.0`. learning-core is the only versioned plugin: a change to the shared `~/Learning/` format is a new learning-core version (see its [versioning rules](https://github.com/amierlorenz/learning-core#versioning)), and a breaking one only reaches a plugin after that plugin raises its range. Everything else follows `main`.

## Developing

`scripts/link-skills.sh` symlinks every skill here into `~/.claude/skills` and `~/.agents/skills`, so edits in this repo are live. Re-run it after adding, renaming or moving a skill. Uninstall the plugin first, or each skill loads twice. Linked skills don't install dependencies, so install `learning-core@amierlorenz` yourself for `learn` to find `learning-workspace`.

## License

[MIT](LICENSE)[^license].

[^teach]: A fork of Matt Pocock's [`/teach`](https://github.com/mattpocock/skills/tree/main/skills/productivity/teach).
[^prototype]: Its variants are adapted from the UI branch of Matt Pocock's [`prototype`](https://github.com/mattpocock/skills/tree/main/skills/engineering/prototype).
[^license]: `learn` keeps Matt Pocock's copyright and [MIT license](skills/productivity/learn/LICENSE).
