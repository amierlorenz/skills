---
name: pr-as-diff
description: Check out a GitHub PR in a sibling worktree with all of its commits shown as one unstaged diff, so you can read every changed file in your editor's Source Control view instead of on github.com. Use when you want to look over someone's PR locally, or invoke /pr-as-diff with a PR number or URL.
disable-model-invocation: true
argument-hint: "<PR number or URL>"
---

Set up a PR so the user can read it in their editor as if every change were their own uncommitted work. Run from inside a clone of the PR's repo (or a fork of it). Change nothing in the user's current checkout.

## 1. Resolve the PR

- From a URL, take `<owner>/<repo>` and `<N>`. Pick the remote whose URL points at `<owner>/<repo>`; if none does, stop and say so.
- From a bare number, use the `upstream` remote if there is one, else `origin`. A fork's `origin` has no `pull/<N>/head`.
- Read the base branch: `gh pr view <N> -R <owner>/<repo> --json baseRefName,title -q .baseRefName`. Without `gh`, use the remote's default branch (`git remote show <remote>`, "HEAD branch").

## 2. Check for a previous run

The worktree goes in `../<repo-folder>-pr-<N>`, next to the current checkout.

- If that folder exists, ask before replacing it: `git worktree remove --force` discards any edits made there. On yes, remove it and `git branch -D pr-<N>`.
- If only the branch `pr-<N>` exists, delete it; it holds nothing but the fetched PR head.

## 3. Build the worktree

```sh
git fetch <remote> pull/<N>/head:pr-<N> <base>
git worktree add --detach ../<repo-folder>-pr-<N> pr-<N>
cd ../<repo-folder>-pr-<N>
git reset --mixed "$(git merge-base pr-<N> <remote>/<base>)"
git ls-files --others --exclude-standard -z | xargs -0 git add -N
```

- Fetch the base too, and use `<remote>/<base>` rather than a local branch: a stale local base puts the base's own commits into the diff.
- `--detach` keeps the reset from moving `pr-<N>`.
- The merge-base is the latest point where the PR took in the base, so commits that merged the base into the PR drop out.
- `git add -N` makes new files show a diff instead of only appearing as untracked. Their content stays unstaged.

## 4. Report

Compare `git diff --stat` in the worktree with the PR's `changedFiles` (`gh pr view <N> --json changedFiles`). If the counts differ, say so: the PR's real base may sit past the merge-base.

Then give the user:
- The PR title, the number of commits (`git rev-list --count <merge-base>..pr-<N>`) and the number of files changed.
- `code <absolute worktree path>` (or their editor's equivalent). Don't open the editor yourself.
- The cleanup line: `git worktree remove --force <path> && git branch -D pr-<N>`. Say that it discards any edits made in the worktree.
