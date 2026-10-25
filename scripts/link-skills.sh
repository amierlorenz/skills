#!/usr/bin/env bash
# Dev-only: symlink every skill in this repo into the local skill folders, so edits here are live.
# Re-run after adding, renaming or moving a skill (or this repo). Not an installer; see the README.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

if [ -d "$HOME/.claude/plugins/cache/amierlorenz/amierlorenz-skills" ]; then
  echo "warning: the amierlorenz-skills plugin is installed too; every skill will load twice." >&2
  echo "         /plugin uninstall amierlorenz-skills@amierlorenz to use the linked copies only." >&2
fi

for DEST in "${DESTS[@]}"; do
  mkdir -p "$DEST"
  while IFS= read -r -d '' skill_md; do
    src="$(dirname "$skill_md")"
    target="$DEST/$(basename "$src")"
    # A real folder may be someone else's skill with the same name: never delete it.
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "skipped $target: a real folder, not a link" >&2
      continue
    fi
    ln -sfn "$src" "$target"
    echo "linked $target -> $src"
  done < <(find "$REPO/skills" -name SKILL.md -print0)
done
