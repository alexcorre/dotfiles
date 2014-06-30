autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# See where git actually is and use that
GIT=$(which git)

git_branch() {
  echo $($GIT symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($GIT status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      echo "[%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}]"
    elif [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "[%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}]"
    else
      echo "[%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}]"
    fi
  fi
}

git_prompt_info () {
 ref=$($GIT symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $GIT cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  if $(which rbenv &> /dev/null)
  then
	  echo "[%{$fg_bold[yellow]%}ruby $(rbenv version | awk '{print $1}')%{$reset_color%}]"
	else
	  echo ""
  fi
}

# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}%~/%\%{$reset_color%}"
}

host_name () {
	echo "%{$fg_bold[black]%}(%n@%m):%{$reset_color%}"
}

export PROMPT=$'\n$(host_name)$(directory_name) $(git_dirty)$(need_push)\n$ '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$(todo)%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
