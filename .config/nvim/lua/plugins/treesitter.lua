return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      local parsers = {
        "bash",
        "css",
        "go",
        "gomod",
        "gosum",
        "hcl",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      local parser_filetypes = {
        bash = { "bash", "sh", "zsh" },
        css = { "css" },
        go = { "go" },
        gomod = { "gomod" },
        gosum = { "gosum" },
        hcl = { "hcl", "terraform", "terraform-vars" },
        html = { "html" },
        javascript = { "javascript" },
        json = { "json", "jsonc" },
        lua = { "lua" },
        markdown = { "markdown" },
        python = { "python" },
        rust = { "rust" },
        toml = { "toml" },
        tsx = { "javascriptreact", "typescriptreact" },
        typescript = { "typescript" },
        vim = { "vim" },
        vimdoc = { "help" },
        yaml = { "yaml" },
      }

      treesitter.setup()

      for parser, filetypes in pairs(parser_filetypes) do
        vim.treesitter.language.register(parser, filetypes)
      end

      if vim.fn.executable("tree-sitter") == 1 then
        treesitter.install(parsers, { summary = true })
      end

      vim.api.nvim_create_user_command("TSInstallConfigured", function()
        if vim.fn.executable("tree-sitter") == 0 then
          vim.notify("Install the tree-sitter CLI first, then rerun :TSInstallConfigured.", vim.log.levels.ERROR)
          return
        end

        treesitter.install(parsers, { summary = true })
      end, { desc = "Install configured Treesitter parsers" })

      local filetypes = {}
      for _, values in pairs(parser_filetypes) do
        vim.list_extend(filetypes, values)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function(event)
          local ok = pcall(vim.treesitter.start, event.buf)
          if ok then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
