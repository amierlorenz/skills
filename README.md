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

### Productivity

- **[learn](skills/productivity/learn/)**: teaches you a topic over many sessions, with lessons that build on everything you've learned before, across topics. A fork of Matt Pocock's [`/teach`](https://github.com/mattpocock/skills/tree/main/skills/productivity/teach).

## License

[MIT](LICENSE). `learn` keeps Matt Pocock's copyright and [MIT license](skills/productivity/learn/LICENSE).
