return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local function maximize_status()
      return vim.t.maximized and " EXPANDED" or ""
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename", maximize_status },
        lualine_x = {},
        lualine_y = { "encoding" },
        lualine_z = { "location" },
      },
    })
  end,
}
