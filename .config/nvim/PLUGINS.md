# Neovim Plugins

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim).
Pinned plugin versions live in `lazy-lock.json`.

## Plugin Manager

| Plugin | Purpose | Config |
| --- | --- | --- |
| `folke/lazy.nvim` | Bootstraps and manages all plugins. Provides `:Lazy` for installing, updating, and inspecting plugins. | `lua/config/lazy.lua` |

## Editing

| Plugin | Purpose | Config |
| --- | --- | --- |
| `folke/tokyonight.nvim` | Colorscheme loaded at startup. | `lua/plugins/colorscheme.lua` |
| `folke/which-key.nvim` | Shows available keybindings after pressing a prefix like `<leader>`. | `lua/plugins/which-key.lua` |

## Finding Files

| Plugin | Purpose | Config |
| --- | --- | --- |
| `nvim-telescope/telescope.nvim` | Fuzzy finder for files, text search, buffers, and help tags. | `lua/plugins/telescope.lua` |
| `nvim-lua/plenary.nvim` | Utility dependency used by Telescope. | `lua/plugins/telescope.lua` |

Keymaps:

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Search text with live grep |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Search help tags |

## Git

| Plugin | Purpose | Config |
| --- | --- | --- |
| `lewis6991/gitsigns.nvim` | Shows Git changes in the sign column. | `lua/plugins/git.lua` |

## Completion And Snippets

| Plugin | Purpose | Config |
| --- | --- | --- |
| `hrsh7th/nvim-cmp` | Completion menu engine. | `lua/plugins/completion.lua` |
| `hrsh7th/cmp-nvim-lsp` | Adds LSP completion results to `nvim-cmp`. | `lua/plugins/completion.lua`, `lua/plugins/lsp.lua` |
| `hrsh7th/cmp-buffer` | Adds words from the current buffer to completion. | `lua/plugins/completion.lua` |
| `hrsh7th/cmp-path` | Adds filesystem paths to completion. | `lua/plugins/completion.lua` |
| `L3MON4D3/LuaSnip` | Snippet engine used by completion. | `lua/plugins/completion.lua` |
| `saadparwaiz1/cmp_luasnip` | Connects LuaSnip snippets to `nvim-cmp`. | `lua/plugins/completion.lua` |

Keymaps:

| Key | Action |
| --- | --- |
| `<C-Space>` | Open completion menu |
| `<C-e>` | Close completion menu |
| `<CR>` | Confirm selected completion |
| `<Tab>` | Next completion item or jump through snippet |
| `<S-Tab>` | Previous completion item or jump backward through snippet |

## Language Support

| Plugin | Purpose | Config |
| --- | --- | --- |
| `neovim/nvim-lspconfig` | Provides LSP server configuration defaults. | `lua/plugins/lsp.lua` |
| `mason-org/mason.nvim` | Installs external language servers and developer tools. Provides `:Mason`. | `lua/plugins/lsp.lua` |
| `mason-org/mason-lspconfig.nvim` | Connects Mason-installed language servers to Neovim LSP. | `lua/plugins/lsp.lua` |
| `nvim-treesitter/nvim-treesitter` | Installs Treesitter parsers and query files for syntax highlighting and indentation. | `lua/plugins/treesitter.lua` |

Configured LSP servers:

| Server | Language |
| --- | --- |
| `lua_ls` | Lua |
| `ts_ls` | TypeScript and JavaScript |
| `pyright` | Python |
| `gopls` | Go |
| `rust_analyzer` | Rust |
| `bashls` | Bash |
| `jsonls` | JSON |
| `yamlls` | YAML |

`gopls` is only auto-installed when the `go` executable is available.

Configured Treesitter parsers:

`bash`, `css`, `go`, `gomod`, `gosum`, `html`, `javascript`, `json`, `lua`,
`markdown`, `markdown_inline`, `python`, `query`, `rust`, `toml`, `tsx`,
`typescript`, `vim`, `vimdoc`, `yaml`.

## Useful Commands

| Command | Purpose |
| --- | --- |
| `:PluginDocs` | Open this plugin inventory |
| `:Lazy` | Manage plugins |
| `:Mason` | Manage language servers and external tools |
| `:TSInstallConfigured` | Install the configured Treesitter parsers |
| `:checkhealth` | Check Neovim and plugin health |
