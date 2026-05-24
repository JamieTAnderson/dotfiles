vim.api.nvim_create_user_command("PluginDocs", function()
  vim.cmd.edit(vim.fs.joinpath(vim.fn.stdpath("config"), "PLUGINS.txt"))
end, { desc = "Open Neovim plugin documentation" })
