# pr-as-diff

A Claude Code skill that lets you read a GitHub PR in your editor instead of on github.com. `/pr-as-diff 5622` (or a PR URL) creates a worktree next to your checkout where every commit in the PR shows up as one unstaged diff, so VS Code's Source Control view lists each changed file.

## How it works

1. Fetches `pull/<N>/head` and the PR's base branch from the remote that owns the PR.
2. Adds a detached worktree at `../<repo>-pr-<N>`. Your current checkout is untouched.
3. Resets HEAD to the merge-base with the base branch, leaving the files as they are at the PR's last commit.
4. Marks new files intent-to-add, so they show a diff too.

## Install

Install the plugin from this repo (see the [main README](../../../README.md#install)), then run `/amierlorenz-skills:pr-as-diff <PR>`. Only you can start it.

Needs `git`; `gh` is used to read the PR's base branch and file count, with a fallback to the remote's default branch.

## Uninstall

The skill keeps no cache or config. Each run leaves a worktree and a `pr-<N>` branch; remove them with `git worktree remove --force ../<repo>-pr-<N> && git branch -D pr-<N>`.
