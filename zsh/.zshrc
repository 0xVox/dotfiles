# Install notes

#mkdir -p ~/.zsh/plugins
#git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
#brew instlal fzf

# ----- core env -----
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export TERM='xterm-256color'

# history
HISTSIZE=60000
SAVEHIST=10000
HISTFILE=${HOME}/.hist/${HOST}
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

# ui niceties
setopt PROMPT_SUBST
COMPLETION_WAITING_DOTS="true"

# ----- completion system (native zsh) -----
autoload -Uz compinit
# speed up compinit; rehash only when needed
typeset -g -A _compdir_mtimes
compinit -d ~/.cache/zsh/zcompdump

# better completion behavior
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=**'
zstyle ':completion:*' group-name ''

# if on mac with homebrew, include site functions (no-op elsewhere)
if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# ----- autosuggestions -----
# history-based suggestions (like omz’s plugin, but without omz)
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
# accept suggestion with ctrl-f is nice:
bindkey '^F' autosuggest-accept

# (optional) syntax highlighting, after everything else
if [ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ----- kubectl completion -----
# base kubectl completion
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  # alias + tie completion to alias
  alias k='kubectl'
  compdef k=kubectl
fi

# ----- your paths (kept) -----
export PATH="$PATH:/Users/t/Library/Python/3.9/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
if [ -f '/home/tom/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tom/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/tom/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tom/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
if [ -e /home/tom/.nix-profile/etc/profile.d/nix.sh ]; then . /home/tom/.nix-profile/etc/profile.d/nix.sh; fi
export PATH="$PATH:/home/t/.foundry/bin"

# ----- your dotfile includes (kept) -----
[[ -r ${HOME}/.zalias ]] && source ${HOME}/.zalias
[[ -r ${HOME}/.zkube  ]] && source ${HOME}/.zkube
[[ -r ${HOME}/.zfunc  ]] && source ${HOME}/.zfunc
[[ -r ${HOME}/.zgo    ]] && source ${HOME}/.zgo
[[ -r ${HOME}/.znode  ]] && source ${HOME}/.znode
[[ -r ${HOME}/.zsecret ]] && source ${HOME}/.zsecret

# quoting behavior you wanted
export QUOTING_STYLE=shell

# fzf search
eval "$(fzf --zsh)"

# starship prompt
eval "$(starship init zsh)"

# auto-tmux (kept)
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux new
  exit
fi

