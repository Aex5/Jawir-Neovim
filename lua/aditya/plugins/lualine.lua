
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- Untuk update Lazy.nvim

		-- Warna dari Nightfox
		local colors = {
			black     = "#131a24",
			bg        = "#1e1e1e",
			fg        = "#cdcecf",
			blue      = "#719cd6",
			cyan      = "#63cdcf",
			green     = "#81b29a",
			magenta   = "#9d79d6",
			orange    = "#f4a261",
			red       = "#c94f6d",
			yellow    = "#dbc074",
			inactive_bg = "#1a1f28",
		}

		local nightfox_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				b = { bg = colors.bg, fg = colors.blue },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.bg, fg = colors.green },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
				b = { bg = colors.bg, fg = colors.magenta },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.orange, fg = colors.black, gui = "bold" },
				b = { bg = colors.bg, fg = colors.orange },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.bg, fg = colors.red },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.fg },
				c = { bg = colors.inactive_bg, fg = colors.fg },
			},
		}

		-- Konfigurasi Lualine
		lualine.setup({
			options = {
				theme = nightfox_theme,
				globalstatus = true, -- Pastikan statusline global di semua split
				section_separators = { left = "", right = "" }, -- Custom separator keren
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", upper = true } },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{ lazy_status.updates, cond = lazy_status.has_updates, color = { fg = colors.orange } },
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}

