# Skills

My Claude Code skills, the ones I use day to day for learning and building.

Each one is a plain Markdown `SKILL.md` you can read in a minute, so take them apart and make them your own.

## Install

In Claude Code:

```
/plugin marketplace add amierlorenz/skills
/plugin install amierlorenz-skills@amierlorenz
```

The plugin follows the latest commit on `main`, so updating the marketplace pulls in new and changed skills.

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

## Plugins

Plugins that live in their own repo and are listed in this marketplace.

- **[git-workflow](https://github.com/amierlorenz/git-workflow)**: a hands-on or pr git workflow per repo, enforced by a hook. Install on its own with `/plugin install git-workflow@amierlorenz`.

## Developing

`scripts/link-skills.sh` symlinks every skill here into `~/.claude/skills` and `~/.agents/skills`, so edits in this repo are live. Re-run it after adding, renaming or moving a skill. Uninstall the plugin first, or each skill loads twice.

## License

[MIT](LICENSE)[^license].

[^teach]: A fork of Matt Pocock's [`/teach`](https://github.com/mattpocock/skills/tree/main/skills/productivity/teach).
[^license]: `learn` keeps Matt Pocock's copyright and [MIT license](skills/productivity/learn/LICENSE).
