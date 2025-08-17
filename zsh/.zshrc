eval "$HOME/.config/zsh/inspirustbot" | cowsay -f ~/.config/zsh/minou.cow | lolcat --spread 1.0

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Zap Plugs

plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"

# AUTOCOMPLETION

autoload -U compinit
compinit

setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# nvm setup

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ls='eza'
alias lt='eza -T'
alias cat='bat'
alias cd='z'
alias f='fd'

alias emoji="~/.config/zsh/emoji2utf16"

pdf_squeeze_func() {
  gs \
    -dBATCH \
    -dNOPAUSE \
    -q \
    -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.7 \
    -dNOPAUSE \
    -dQUIET\
    -dPDFSETTINGS=/prepress \
    -sOutputFile=$2 \
  $1
}
alias squeeze='pdf_squeeze_func'

take_func() { mkdir -p "$1" && cd "$1"; }
alias take='take_func'
alias ssh='TERM="xterm-256color" kitty +kitten ssh'

source <(fzf --zsh)
source "$HOME/.cargo/env"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

setopt NO_BEEP
