#for M1 mac
eval "$(/opt/homebrew/bin/brew shellenv)"

#for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# alias
alias ls='ls -G'
alias ll='ls -la'
alias vi='vim'

# git ps1
# source /usr/local/etc/bash_completion.d/git-prompt.sh # for intel mac
# source /usr/local/etc/bash_completion.d/git-completion.bash # for intel mac
source /opt/homebrew/etc/bash_completion.d/git-prompt.sh # for M1 mac
source /opt/homebrew/etc/bash_completion.d/git-completion.bash # for M1 mac
GIT_PS1_SHOWDIRTYSTATE=true
parse_git_user() {
    if git rev-parse 2> /dev/null; then
        echo " $(git config --get user.name)";
    fi
}
export PS1='\[\033[37m\][\[\033[36m\]\D{%y/%m/%d %H:%M:%S} \[\033[32m\]\w\[\033[37m\]]\[\e[35m\]$(parse_git_user)\[\e[0m\]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
