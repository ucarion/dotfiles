alias ll="ls -alcGF"

source ~/.dotfiles/.git-completion.sh

# Change the [N;] part to change normal/bold/italic
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
WHITE="\[\e[1;37m\]"

RESET="\[\e[0m\]"

function current_branch() {
  branch=`(git branch | grep '^*' | cut -d ' ' -f 2) 2>/dev/null`

  if [ "$branch" != "" ]; then
    echo "on ${BLUE}${branch}"
  fi
}

export PS1="\n$YELLOW\u$WHITE in $GREEN\w\[$(tput sgr0)\]$WHITE $(current_branch)$WHITE\n$ $RESET"
