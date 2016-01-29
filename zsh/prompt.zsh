autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# See where git actually is and use that
GIT=$(which git)

git_branch() {
  echo $($GIT symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($GIT status --porcelain 2>/dev/null)
  if [[ $st == "" ]]
  then
    echo "[%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}]"
  else
    echo "[%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}]"
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

directory_name(){
  echo "%{$fg_bold[cyan]%}%~/%\%{$reset_color%}"
}

host_name () {
	echo "%{$fg_bold[black]%}(%n@%m):%{$reset_color%}"
}

export PROMPT=$'\n$(host_name)$(directory_name) $(git_dirty)$(need_push)\n$ '
export PROMPT_EOL_MARK=""

precmd() {
  title "zsh" "%m" "%55<...<%~"
}
