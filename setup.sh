#!/bin/bash

# bash 'strict mode'
#set -euo pipefail

# stow convenience function
_stow() {
  stow -t ~ $1
}

export PATH=$PATH:$HOME/bin

# Install ZSH and tools
echo "Installing requirments"
sudo apt install zsh direnv stow tmux git

# Switch shell to zsh
echo "Switching default shell to zshell"
chsh -s $(which zsh)

# Tmux plugins
echo "Installing TMux + Plugins + Statusline"
mkdir -p ~/.tmux/plugins/tpm
git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git@github.com:seebi/tmux-colors-solarized.git ~/.tmux/plugins/tmux-colors-solarized
git clone git@github.com:tmux-plugins/tmux-resurrect.git ~/.tmux/plugins/tmux-resurrect 
git clone git@github.com:tmux-plugins/tmux-continuum.git ~/.tmux/plugins/tmux-continuum 
git clone git@github.com:erikw/tmux-powerline.git ~/.tmux/bin/tmux-powerline
rm ~/.tmux/bin/tmux-powerline/themes/default.sh
cp ./powerline/default.sh ~/.tmux/bin/tmux-powerline/themes/default.sh
~/.tmux/plugins/tpm/bin/install_plugins

# Fix fonts
curl -L https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -o PowerlineSymbols.otf
curl -L https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -o 10-powerline-symbols.conf
mkdir -p ~/.local/share/fonts
mv PowerlineSymbols.otf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.local/share/fonts/

echo "Installing OMZ"
OMZ="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

[ ! -d $HOME/.oh-my-zsh ] && RUNZSH=no sh -c "$(curl -fsSL $OMZ)" && rm $HOME/.zshrc

echo "Setting up Symlinks for dotfiles"
for m in zsh git tmux; do
    _stow "$m"
done


echo "If this is your first run - logout and in again to set zsh to default."