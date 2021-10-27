if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
  exec sway
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'


source $ZSH/oh-my-zsh.sh

# User configuration

# export LANG=en_US.UTF-8

export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export TERM='xterm-256color'
eval "$(direnv hook zsh)"

# setup command history
HISTSIZE=60000
HISTFILE=${HOME}/.hist/${HOST}
SAVEHIST=10000

# quote names for the shell if they contain shell metacharacters or would cause
# ambiguous output
export QUOTING_STYLE=shell

# load supplementary configs if available
[[ -f ${HOME}/.zalias && -r ${HOME}/.zalias ]] && { source ${HOME}/.zalias; }
[[ -f ${HOME}/.zkube && -r ${HOME}/.zkube ]] && { source ${HOME}/.zkube; }
[[ -f ${HOME}/.zfunc && -r ${HOME}/.zfunc ]] && { source ${HOME}/.zfunc; }
[[ -f ${HOME}/.zgo && -r ${HOME}/.zgo ]] && { source ${HOME}/.zgo; }
[[ -f ${HOME}/.znode && -r ${HOME}/.znode ]] && { source ${HOME}/.znode; }

# load secret stuff if available
[[ -f ${HOME}/.zsecret && -r ${HOME}/.zsecret ]] && { source ${HOME}/.zsecret }

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tom/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tom/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tom/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tom/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
if [ -e /home/tom/.nix-profile/etc/profile.d/nix.sh ]; then . /home/tom/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux new
    exit
fi
