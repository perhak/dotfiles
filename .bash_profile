eval "$(rbenv init -)"
export EDITOR='vim'

source ~/.bin/tmuxinator.sh
source ~/.git-completion.sh
source ~/.git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

#PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '
