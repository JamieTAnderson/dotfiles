local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazy_repo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to clone lazy.nvim:\n" .. result)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      reset = false,
    },
  },
})
