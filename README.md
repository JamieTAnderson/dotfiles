# Dotfiles

Personal dotfiles, starting with a small Neovim setup.

The repo is meant to live at `~/dotfiles` or anywhere else you keep source
checkouts. The install script symlinks files into the normal XDG locations.

## Install

```sh
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

If you are already in this repo:

```sh
./install.sh
```

The installer backs up existing targets before linking this repo's Neovim config
and shell aliases.

## Neovim

Requires Neovim 0.12 or newer.

This config uses:

- [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), Mason, and `mason-lspconfig` for LSP setup
- `nvim-cmp` for completion
- `nvim-autopairs` for automatic closing pairs
- Telescope for finding files and searching text
- Gitsigns for Git gutter markers
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) for a file explorer
- local `pi-inline.nvim` for asking Pi questions from Neovim

See `.config/nvim/PLUGINS.txt` for the full plugin list and what each plugin does.

Recommended command line tools:

- `git`
- `ripgrep` for Telescope live grep
- `tree-sitter` CLI 0.26.1 or newer for Treesitter parser installs
- `pi` for Pi Inline
- a C compiler for Treesitter parser builds

On first launch, lazy.nvim will bootstrap itself and install plugins. If the
`tree-sitter` CLI is available, configured parsers are installed automatically.
Otherwise, install the CLI and run `:TSInstallConfigured`.

### Useful Commands

- `:Lazy` - manage plugins
- `:PluginDocs` - open the plugin inventory
- `:Mason` - install language servers and tools
- `:TSInstallConfigured` - install the configured Treesitter parsers
- `:checkhealth` - check Neovim setup
- `<leader>ff` - find files
- `<leader>fg` - search text
- `<leader>fb` - list open buffers
- `<leader>fh` - search help tags
- `<leader>n` - toggle Neo-tree
- `<leader>nf` - reveal the current file in Neo-tree
- `:Pi` / `<leader>pp` - open Pi Inline

Language servers currently configured:

- Lua: `lua_ls`
- TypeScript/JavaScript: `ts_ls`
- Python: `pyright`
- Go: `gopls`
- Rust: `rust_analyzer`
- Bash: `bashls`
- JSON: `jsonls`
- YAML: `yamlls`

`gopls` is only auto-installed when the `go` executable is available. Install Go
first, then open Neovim and run `:MasonInstall gopls` or `:Lazy sync`.

Install additional language servers from `:Mason`, then add them in `.config/nvim/lua/plugins/lsp.lua`.

## Layout

```text
.
├── .bash_aliases    # Bash aliases
├── .config/nvim/   # Neovim config
├── install.sh      # symlink installer
└── README.md
```
