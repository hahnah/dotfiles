return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                 ]],
			[[                 ]],
			[[                 ]],
			[[                 ]],
			[[     █  █     ]],
			[[     ███ ██     ]],
			[[     █████     ]],
			[[     ██ ███     ]],
			[[     █  █     ]],
			[[                 ]],
			[[N  E  O   V  I  M]],
			[[                 ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>enew<CR>"),
			dashboard.button("SPC ee", "  > Explore", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fr", "  > Find Recents", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("SPC sr", "󰦛  > Session Restore", "<cmd>SessionRestore<CR>"),
			dashboard.button("l", "󰒲  > Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("m", "  > Mason", "<cmd>Mason<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
