# Paths for macOS machines
if [ $(uname -s) = "Darwin" ]; then
  if [ "$(uname -p)" = "arm" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    alias ibrew='arch -x86_64 /usr/local/bin/brew'
    
    # homebrew autocomplete
    if type brew &>/dev/null; then
      FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    fi
  fi
  
  # Go
  export GOPATH="/Users/felix/gocode"
  export GOROOT="$(brew --prefix)/Cellar/go/$(ls $(brew --prefix)/Cellar/go | head -n1)/libexec"

  alias hosts='code ~/.ssh/known_hosts'
  alias ww='fork . && code .'

  # # GCLOUD
  GCLOUD_PATH_INCLUDE="$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  if [ -f "${GCLOUD_PATH_INCLUDE}" ]; then source "${GCLOUD_PATH_INCLUDE}"; fi

  GCLOUD_COMPLETION_INCLUDE="$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  if [ -f "${GCLOUD_COMPLETION_INCLUDE}" ]; then source "${GCLOUD_COMPLETION_INCLUDE}"; fi

elif [ $(uname -s) = "FreeBSD" ]; then
fi

# Global aliases
alias ll='ls -lah'
alias ...='cd ../..'
alias ..='cd ..'

# Golang
if [ -n $GOPATH  ]; then
  export PATH="$GOPATH/bin:$PATH"
fi

if [ -n $GOROOT ]; then
  export PATH="$GOROOT/bin:$PATH"
fi

# Save command history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=2000
SAVEHIST=1000
setopt hist_ignore_all_dups

# Style
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' stagedstr '%F{yellow}+%f'
zstyle ':vcs_info:*:*' unstagedstr '%F{magenta}!%f'

zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f %c%u'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

precmd() { vcs_info }
setopt prompt_subst

# Default prompt
PS1='%F{red}%n%f@%m %F{magenta}%1~%f ${vcs_info_msg_0_} %# '
