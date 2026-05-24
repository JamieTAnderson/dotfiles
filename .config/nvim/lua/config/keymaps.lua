local keymap = vim.keymap.set

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })

keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

