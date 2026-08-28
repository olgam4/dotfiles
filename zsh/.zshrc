# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Zap Plugs
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"

# AUTOCOMPLETION
autoload -U compinit
compinit

# HISTORY SETTINGS
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# KEYBINDINGS
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# NVM SETUP
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ALIASES
alias ls='eza'
alias lt='eza -T'
alias cat='bat'
alias cd='z'
alias f='fd'
alias cls='clear && source ~/.zshrc'
alias wake-jean='ssh louis@ser8 "wol 58:47:ca:7f:85:da"'

# FUNCTIONS & UTILITIES
pdf_squeeze_func() {
  gs \
    -dBATCH \
    -dNOPAUSE \
    -q \
    -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.7 \
    -dQUIET \
    -dPDFSETTINGS=/ebook \
    -sOutputFile="$2" \
    "$1"
}
alias squeeze='pdf_squeeze_func'

take_func() { mkdir -p "$1" && cd "$1"; }
alias take='take_func'
alias ssh='TERM="xterm-256color" kitty +kitten ssh'

# INTEGRATIONS & PROMPT
source <(fzf --zsh)
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

setopt NO_BEEP
