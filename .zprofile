# Save command history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=2000
SAVEHIST=1000

# Default prompt
PS1="%F{red}%n%f@%m %F{magenta}%1~%f %# "

# Global aliases 
alias ll='ls -lah'
alias ...='cd ../..'
alias ..='cd ..'

# OS specific aliases
if [ $(uname -s) = "Darwin" ]
then
  alias hosts='code ~/.ssh/known_hosts'
  alias ww='fork . && code .'
  alias t='terraform'
  alias k="kubectl"
  alias mbox='ssh felix@mailbox.rainbowfab.org'
elif [ $(uname -s) = "FreeBSD" ]
then
fi

# GCLOUD
GCLOUD_COMPLETION_INCLUDE="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -f "${GCLOUD_COMPLETION_INCLUDE}" ]
then
  source "${GCLOUD_COMPLETION_INCLUDE}"
fi
