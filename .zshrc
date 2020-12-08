# Paths for macOS machines
if [ $(uname -s) = "Darwin" ]
then
  export GOPATH="/Users/felix/gocode"
  export GOROOT="/usr/local/Cellar/go/$(ls /usr/local/Cellar/go | head -n1)/libexec"
fi

# Golang
if [ -n $GOPATH  ]
then
  export PATH="$GOPATH/bin:$PATH"
fi

if [ -n $GOROOT ]
then
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

# Global aliases
alias ll='ls -lah'
alias ...='cd ../..'
alias ..='cd ..'

# OS specific aliases
if [ $(uname -s) = "Darwin" ]
then
  alias hosts='code ~/.ssh/known_hosts'
  alias mbox='ssh felix@mailbox.rainbowfab.org'
  
  alias ww='fork . && code .'
  
  alias t='terraform'
  alias kc="kubectl -n core"
  alias ks="kubectl -n staging"
  alias kp="kubectl -n production"
  alias k="kubectl"
  
elif [ $(uname -s) = "FreeBSD" ]
then
fi

# GCLOUD
GCLOUD_PATH_INCLUDE="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
if [ -f "${GCLOUD_PATH_INCLUDE}" ]
then
  source "${GCLOUD_PATH_INCLUDE}"
fi

GCLOUD_COMPLETION_INCLUDE="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -f "${GCLOUD_COMPLETION_INCLUDE}" ]
then
  source "${GCLOUD_COMPLETION_INCLUDE}"
fi
