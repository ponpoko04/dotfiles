autoload -Uz colors && colors
zstyle ":completion:*:commands" rehash 1

typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
  autoload -Uz compinit
  compinit
fi

PROMPT='%F{034}%n%f %F{036}($(arch))%f:%F{020}%~%f $(git_super_status)'
PROMPT+=""$'\n'"%# "

add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
precmd() {
  add_newline
}

tgz() {
  env COPYFILE_DISABLE=1 tar zcvf $1 --exclude=".DS_Store" ${@:2}
}

# -F でファイル種別の表示
# -G で色を付ける (GNU/Linux での "--color=auto" と等価)
alias ls="ls -FG"

alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
