#!/usr/bin/env bash
set -euo pipefail

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"

link_path() {
  local source_path="$1"
  local target_path="$2"

  if [ ! -e "$source_path" ]; then
    printf 'Missing source: %s\n' "$source_path" >&2
    return 1
  fi

  mkdir -p "$(dirname "$target_path")"

  if [ "$source_path" -ef "$target_path" ]; then
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

link_path "$dotfiles_dir/.config/mise/config.toml" "$config_home/mise/conf.d/dotfiles.toml"
link_path "$dotfiles_dir/.config/nvim" "$config_home/nvim"
link_path "$dotfiles_dir/.config/ghostty" "$config_home/ghostty"
link_path "$dotfiles_dir/.config/yabai" "$config_home/yabai"
link_path "$dotfiles_dir/.config/skhd" "$config_home/skhd"
link_path "$dotfiles_dir/.config/opencode/opencode.json" "$config_home/opencode/opencode.json"
link_path "$dotfiles_dir/.bash_aliases" "$HOME/.bash_aliases"

for script_path in "$dotfiles_dir"/bin/*; do
  [ -f "$script_path" ] || continue
  link_path "$script_path" "$HOME/.local/bin/${script_path##*/}"
done

printf '\nDone. Configuration files and scripts are linked.\n'
