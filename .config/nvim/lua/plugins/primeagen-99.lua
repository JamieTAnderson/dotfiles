return {
  {
    "ThePrimeagen/99",
    keys = {
      {
        "<leader>9s",
        function()
          require("99").search()
        end,
        desc = "99 search project",
      },
      {
        "<leader>9v",
        function()
          require("99").visual()
        end,
        mode = "v",
        desc = "99 ask about selection",
      },
      {
        "<leader>9x",
        function()
          require("99").stop_all_requests()
        end,
        desc = "99 stop requests",
      },
    },
    config = function()
      require("99").setup({
        model = "openai/gpt-5.5",
      })
    end,
  },
}
