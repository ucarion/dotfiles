alias ll="ls -alcGF"

# Change the [N;] part to change normal/bold/italic
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
WHITE="\[\e[1;37m\]"

RESET="\[\e[0m\]"

export PS1="\n$YELLOW\u$WHITE in $GREEN\w\[$(tput sgr0)\]$WHITE\n$ $RESET"
