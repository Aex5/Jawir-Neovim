return {
	"AlexvZyl/nordic.nvim",
	priority = 1000,
	config = function()
		require("nordic").setup({
			transparent_bg = true,
			italic_comments = true,
			bold_keywords = true,
			cursorline = {
				theme = true,
				blend = 0.7,
			},
			colors = {
				bg = "#2E3440",
				fg = "#D8DEE9",
			},
		})

		vim.cmd.colorscheme("nordic")
		vim.api.nvim_set_hl(0, "Folded", { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FoldSeparator", { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "VertSplit", { fg = "NONE", bg = "NONE" })
		vim.cmd([[
                highlight Visual guibg=#004187
            ]])
	end,
}
