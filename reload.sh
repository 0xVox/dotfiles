#!/bin/bash

# stow convenience function
_stow() {
  stow -t ~ $1
}

echo "Setting up Symlinks for dotfiles"
for m in zsh git tmux; do
    _stow "$m"
done