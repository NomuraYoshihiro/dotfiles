#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
fpath=(/usr/local/share/zsh-completions $fpath)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# rbenv , brew で入れたvim, ndenv
export PATH=$HOME/.rbenv/bin:$HOME/.ndenv/bin:$PATH

eval "$(rbenv init -)"
eval "$(ndenv init -)"

# Customize to your needs...
### zsh others
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### history関係
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups

### vim
export EDITOR=vim

if [ -f ~/.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':auto-fu:var' postdisplay $''q
fi


### go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

### peco
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

### peco kill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

### alias
alias g='git'
alias be='bundle exec'

eval "$(direnv hook zsh)"

## eb
export PATH=$PATH:~/Library/Python/3.4/bin
