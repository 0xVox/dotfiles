#!/bin/bash

# bash 'strict mode'
set -euo pipefail

# stow convenience function
_stow() {
  stow -t ~ $1
}

# Install ZSH
sudo apt install zsh direnv

CONFIGS=(zsh )
OMZ="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

[ ! -d $HOME/.oh-my-zsh ] && RUNZSH=no sh -c "$(curl -fsSL $OMZ)" && rm $HOME/.zshrc

for m in zsh git tmux; do
    _stow "$m"
done