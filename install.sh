#!/usr/bin/env bash
set -e

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "→ Linking dotfiles from $DOTFILES"

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

link "zsh/.zshrc"           ".zshrc"
link "tmux/.tmux.conf"      ".tmux.conf"
link "hyper/.hyper.js"      ".hyper.js"
link "starship/starship.toml" ".config/starship.toml"

echo "✓ Done. Run: source ~/.zshrc"
