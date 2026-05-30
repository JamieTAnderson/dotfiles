return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
      { "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "Reveal current file" },
      { "<leader>ng", "<cmd>Neotree git_status<cr>", desc = "Git status explorer" },
      { "<leader>nb", "<cmd>Neotree buffers<cr>", desc = "Buffer explorer" },
    },
    opts = {
      close_if_last_window = true,
      enable_diagnostics = true,
      enable_git_status = true,
      popup_border_style = "rounded",
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 32,
      },
    },
  },
}
