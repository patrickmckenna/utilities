An odds-and-ends collection of some fairly basic `bash` scripts.


#####  [`git-delete-merged-branches.sh`](/git-delete-merged-branches.sh)
Deletes all local, writeable branches, except for the default and currently checked out branch(es), that have been merged into the default branch. Note: default here means the default branch on GitHub (Settings > Branches > Default branch). This can differ from the target of `refs/remotes/origin/HEAD`, e.g. if you change the default branch on GitHub after cloning the repo.

The script assumes that:
- you use GitHub
- have a single remote called "origin"
- have a GitHub [personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/), stored in an environment variable called `GITHUB_TOKEN`
- have [jq](https://stedolan.github.io/jq/) installed
