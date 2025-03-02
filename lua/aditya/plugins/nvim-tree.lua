
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 45, -- mengubah lebar view sesuai permintaan baru
        side = "left"
			},
			renderer = {
				root_folder_label = false, -- hide root directory at the top
				indent_markers = {
					enable = true, -- enable folder level guide
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "+", -- arrow when folder is closed
							arrow_open = "-", -- arrow when folder is open
							default = "",
							open = "",
							empty = "",
							empty_open = "",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "󰏫",
							untracked = "◌",
							deleted = "",
							ignored = "󰘓",
						},
					},
					padding = " ",
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false, -- Disable window picker
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			filters = {
				dotfiles = false,
				custom = { ".DS_Store" }, -- filter .DS_Store file
			},
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			git = {
				ignore = false, -- show git status
			},
		})

		-- Keymaps
		local keymap = vim.keymap

		-- Toggle NvimTree with leader ee
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

		-- Toggle NvimTree for current file with leader ef
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })

		-- Collapse NvimTree with leader ec
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })

		-- Refresh NvimTree with leader er
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}

