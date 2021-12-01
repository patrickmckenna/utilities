# no need for these in CI, no tests make use of them
brew "diff-so-fancy" unless system "[ $CI ]"
brew "fzf" unless system "[ $CI ]"
# always use brew to install latest version, to match likely dev env
brew "shellcheck"
