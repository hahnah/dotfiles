return {
	"declancm/maximize.nvim",
	config = function()
		require("maximize").setup()
		vim.keymap.set("n", "<leader>ww", "<cmd>Maximize<CR>", { desc = "Toggle maximizing window" })
	end,
}
