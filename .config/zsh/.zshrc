# Oh-My-Zsh stuff
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ikorason"

plugins=(
  git
  rust
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"

export EDITOR="nvim"
export PATH=/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/irfannito/.cargo/bin:/opt/homebrew/bin
