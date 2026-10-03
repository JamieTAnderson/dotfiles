return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
    },
    config = function(_, opts)
      local function soften_xml_comments()
        for _, group in ipairs({
          "@lsp.type.xmlDocCommentName.cs",
          "csXmlTag",
          "csSummary",
        }) do
          vim.api.nvim_set_hl(0, group, { link = "Comment" })
        end
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("CSharpXmlComments", {
          clear = true,
        }),
        callback = soften_xml_comments,
      })

      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
