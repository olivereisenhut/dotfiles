find . -maxdepth 1 -mindepth 1 -type d -not -name '.*' -exec basename {} \; | xargs stow -v 2
