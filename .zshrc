[[ -f ~/.zplug/init.zsh ]] ||
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
. "$HOME/.zplug/init.zsh"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

eval $(/opt/homebrew/bin/brew shellenv)

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='exa'
alias useful="open ~/useful"
alias sketchreset="brew services stop sketchybar && brew services start sketchybar"

function take() {
  mkdir -p "$1" && cd "$1"
}

setopt no_list_ambiguous

zplug "wintermi/zsh-rust"

zplug "zsh-users/zsh-syntax-highlighting"

zplug "zimfw/asdf"
zplug "kiurchv/asdf.plugin.zsh", defer:2

zplug "none9632/zsh-sudo"

zplug "marlonrichert/zsh-autocomplete"
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select

zplug "agkozak/zsh-z"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 

[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

eval "$HOME/.config/zsh/inspirustbot" | cowsay

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
