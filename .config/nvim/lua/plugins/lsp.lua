return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      if not vim.lsp.config then
        vim.notify("This config requires Neovim 0.12 or newer.", vim.log.levels.ERROR)
        return
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        ts_ls = {},
        pyright = {},
        gopls = {
          mason = vim.fn.executable("go") == 1,
        },
        rust_analyzer = {},
        bashls = {},
        jsonls = {},
        yamlls = {},
      }

      local ensure_installed = {}

      for server_name, server_opts in pairs(servers) do
        local should_install = server_opts.mason ~= false
        server_opts.mason = nil

        if should_install then
          ensure_installed[#ensure_installed + 1] = server_name
        end

        server_opts = vim.tbl_deep_extend("force", {}, server_opts, {
          capabilities = capabilities,
        })
        vim.lsp.config(server_name, server_opts)
      end

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        automatic_enable = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf }
          local keymap = vim.keymap.set

          local function map(keys, fn, desc)
            keymap("n", keys, fn, vim.tbl_extend("force", opts, { desc = desc }))
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "Find references")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")
        end,
      })
    end,
  },
}
