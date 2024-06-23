return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs",
				close_icon = "",
				buffer_close_icon = "",
				style_preset = {
					bufferline.style_preset.no_italic,
				},
				name_formatter = function(buf)
					return "Tab #" .. tostring(buf.tabnr)
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "........... Explorer ........",
						separator = true,
					},
				},
			},
		})
	end,
}
