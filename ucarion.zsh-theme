function color_on_exit_status() {
  if [[ $? -gt 0 ]]; then
    echo "%{$fg_bold[red]%}"
  else
    echo "%{$fg_bold[green]%}"
  fi
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function git_status() {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)

  if [[ -z $branch ]]; then
    echo "%{$fg_bold[grey]%}not in git"
  else
    echo "%{$fg_bold[red]%}[$branch]"
  fi
}

PROMPT='$(color_on_exit_status)$(get_pwd)%{$reset_color%}$ '
RPROMPT='$(git_status)%{$reset_color%}'
