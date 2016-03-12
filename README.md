An odds-and-ends collection of some fairly basic Bash scripts.

---

##### [`git-delete-merged-branches.sh`](/git-delete-merged-branches.sh)
Deletes all local branches, except the default and the currently checked out branch(es), that have been merged into the default branch. Note: default here means the default branch on GitHub (Settings > Branches > Default branch). This can differ from the target of `refs/remotes/origin/HEAD`, e.g. if you change the default branch on GitHub after cloning the repo.

The script currently assumes that:
- you use GitHub
- have a single remote called `origin`
- have a GitHub [personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/), stored in an environment variable called `GITHUB_TOKEN`
- have Git >= 2.7.0 installed
- have [jq](https://stedolan.github.io/jq/) installed


##### [`print-git-branch.sh`](/print-git-branch.sh)
Prints the currently checked out branch. Useful for, say, [customizing your prompt](https://github.com/patrickmckenna/dotfiles/blob/b8099969c3ec509c4770b6f0224cd044b9b66230/bashrc#L29).
