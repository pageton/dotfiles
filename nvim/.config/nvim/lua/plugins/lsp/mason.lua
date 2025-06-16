return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"prismals",
				"biome",
				"pylsp",
				"gopls",
				"zls",
        "nil_ls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"biome",
				"ruff",
        "nixpkgs-fmt",
			},
		})
	end,
}
