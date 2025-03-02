return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Setup LSP servers
		mason_lspconfig.setup({
			ensure_installed = {
				"html", -- HTML server
				"cssls", -- CSS server
				"tailwindcss", -- Tailwind CSS server
				"svelte", -- Svelte server
				"lua_ls", -- Lua server
				"graphql", -- GraphQL server
				"emmet_ls", -- Emmet server
				"prismals", -- Prisma server
				"pyright", -- Python server
				"intelephense", -- PHP server
			},
			automatic_installation = true,
		})

		-- Install additional tools
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- Python linter
				"eslint_d", -- ESLint for JavaScript/TypeScript
			},
		})

		-- Set up LSP key mappings
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition
			vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Hover
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- References
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Rename
			-- Add other key mappings as needed
		end

		-- LSP settings
		local lspconfig = require("lspconfig")
		mason_lspconfig.setup_handlers({
			function(server_name) -- Default handler
				lspconfig[server_name].setup({
					on_attach = on_attach,
					-- Add additional configuration options here
				})
			end,
		})
	end,
}
