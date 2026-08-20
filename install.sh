#!/usr/bin/env bash
set -euo pipefail

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"

link_path() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    printf 'Already linked: %s\n' "$target_path"
    return
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    local backup_path="${target_path}.backup.$(date +%Y%m%d%H%M%S)"
    mv "$target_path" "$backup_path"
    printf 'Backed up: %s -> %s\n' "$target_path" "$backup_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'Linked: %s -> %s\n' "$target_path" "$source_path"
}

link_path "$dotfiles_dir/.config/nvim" "$config_home/nvim"
link_path "$dotfiles_dir/.config/ghostty" "$config_home/ghostty"
link_path "$dotfiles_dir/.config/aerospace" "$config_home/aerospace"
link_path "$dotfiles_dir/.config/opencode" "$config_home/opencode"
link_path "$dotfiles_dir/.bash_aliases" "$HOME/.bash_aliases"

vscode_user_dir="$HOME/Library/Application Support/Code/User"
link_path "$dotfiles_dir/vscode/settings.json" "$vscode_user_dir/settings.json"
link_path "$dotfiles_dir/vscode/keybindings.json" "$vscode_user_dir/keybindings.json"

printf '\nDone. Open Neovim with: nvim or vi. OpenCode config is linked globally.\n'
