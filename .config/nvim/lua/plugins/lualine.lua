return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local function maximize_status()
			return vim.t.maximized and " MAX" or ""
		end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
			},
			sections = {
				lualine_c = { "filename", maximize_status },
			},
		})
	end,
}
