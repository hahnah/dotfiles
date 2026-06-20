return {
  "flix/nvim",
  ft = "flix",
  config = function()
    require("flix").setup()
    vim.lsp.enable("flix")
  end,
}
