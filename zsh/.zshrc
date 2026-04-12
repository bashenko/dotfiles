export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""  # отключаем — используем Starship

plugins=(git macos npm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# --- Dev tools ---
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.2

# conda
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ] && . "$HOME/miniconda3/etc/profile.d/conda.sh" || export PATH="$HOME/miniconda3/bin:$PATH"
fi
unset __conda_setup

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# LM Studio
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# --- Modern CLI aliases ---
alias ls='eza --icons --git'
alias ll='eza -la --icons --git'
alias cat='bat'
alias find='fd'
alias grep='rg'

# --- Starship ---
eval "$(starship init zsh)"

# --- zoxide (smart cd) ---
eval "$(zoxide init zsh)"
