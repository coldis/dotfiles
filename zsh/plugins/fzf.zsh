# Custom fzf path
# ---------------
fzf_path=$HOME/.fzf

# Use Ag
# ---------
export FZF_DEFAULT_COMMAND='(
  hg files ||
  git ls-tree -r --name-only HEAD ||
  ag -g "" --hidden) 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1

_fzf_compgen_path() {
  hg files ||
  git ls-tree -r --name-only HEAD ||
  ag -g $1 --hidden
}

_fzf_compgen_dir() {
  (hg files ||
  git ls-tree -r --name-only HEAD ||
  ag -g $1 --hidden) | sed -e 's:/[^/]*$::' | uniq
}

# Setup fzf
# ---------
if [[ ! "$PATH" == *$fzf_path/bin* ]]; then
  export PATH="$PATH:$fzf_path/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$fzf_path/man* && -d "$fzf_path/man" ]]; then
  export MANPATH="$MANPATH:$fzf_path/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzf_path/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$fzf_path/shell/key-bindings.zsh"
