#!/bin/bash

# bash 'strict mode'
#set -euo pipefail

# stow convenience function
_stow() {
  stow -t ~ $1
}

export PATH=$PATH:$HOME/bin

# Install ZSH and tools
sudo apt install zsh direnv stow tmux git

# Tmux plugins
mkdir -p ~/.tmux/plugins/tpm
git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git@github.com:seebi/tmux-colors-solarized.git ~/.tmux/plugins/tmux-colors-solarized
git clone git@github.com:tmux-plugins/tmux-resurrect.git ~/.tmux/plugins/tmux-resurrect 
git clone git@github.com:tmux-plugins/tmux-continuum.git ~/.tmux/plugins/tmux-continuum 
git clone git@github.com:erikw/tmux-powerline.git ~/.tmux/bin/tmux-powerline
~/.tmux/plugins/tpm/bin/install_plugins

# Fix fonts
curl https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -o PowerlineSymbols.otf
curl https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -o 10-powerline-symbols.conf

mkdir -p ~/.local/share/fonts
mv PowerlineSymbols.otf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.local/share/fonts/

OMZ="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

[ ! -d $HOME/.oh-my-zsh ] && RUNZSH=no sh -c "$(curl -fsSL $OMZ)" && rm $HOME/.zshrc

for m in zsh git tmux; do
    _stow "$m"
done