local group = vim.api.nvim_create_augroup("user-config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
  desc = "Highlight yanked text",
})

