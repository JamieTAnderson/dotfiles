local uv = vim.uv or vim.loop
local config_dir = assert(uv.fs_realpath(vim.fn.stdpath("config")))

-- <projects>/dotfiles/.config/nvim -> <projects>
local projects_dir = vim.fn.fnamemodify(config_dir, ":h:h:h")

return {
  {
    dir = projects_dir .. "/buddy/nvim",
    name = "buddy",
    lazy = false,
    config = function()
      require("buddy").setup({
        require_message = {
          persistent = true, -- <leader>9v
          ephemeral = true, -- <leader>9c
          command = true, -- <leader>9b
        },
      })
    end,
  },
}
