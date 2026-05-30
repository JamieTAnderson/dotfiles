return {
  {
    dir = "/workspace/pi-inline.nvim",
    name = "pi-inline.nvim",
    cmd = {
      "Pi",
      "PiAsk",
      "PiClear",
      "PiCancel",
      "PiMode",
      "PiReadOnly",
      "PiEdit",
      "PiSessionUse",
      "PiSessionSelect",
      "PiSessionClear",
      "PiSessionDeleteAll",
    },
    keys = {
      { "<leader>pp", "<cmd>Pi<cr>", mode = { "n", "v" }, desc = "Open Pi Inline" },
      { "<leader>pc", "<cmd>PiClear<cr>", desc = "Clear Pi Inline ghost text" },
      { "<leader>pC", "<cmd>PiCancel<cr>", desc = "Cancel Pi request" },
      { "<leader>ps", "<cmd>PiSessionSelect<cr>", desc = "Select Pi session" },
      { "<leader>pS", "<cmd>PiSessionClear<cr>", desc = "Clear Pi session" },
    },
    opts = {
      pi = {
        command = "pi",
        args = { "--mode", "rpc" },
      },
    },
  },
}
