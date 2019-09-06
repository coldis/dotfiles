# Ref:
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
# https://junegunn.kr/2016/07/fzf-git/

# -------------
# GIT heart FZF
# -------------

fzf-git_is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-git_fzf-down() {
  fzf --height 50% "$@" --border
}

fzf-git_gf() {
  fzf-git_is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-git_fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

fzf-git_gb() {
  fzf-git_is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-git_fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

fzf-git_gt() {
  fzf-git_is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-git_fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

fzf-git_gh() {
  fzf-git_is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-git_fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

fzf-git_gr() {
  fzf-git_is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-git_fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" --remotes={1} | head -200' |
    cut -d$'\t' -f1
}

fzf-git_join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

fzf-git_bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(fzf-git_g$c | fzf-git_join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g$c' fzf-g$c-widget"
  done
}
fzf-git_bind-git-helper f b t r h
unset -f fzf-git_bind-git-helper
