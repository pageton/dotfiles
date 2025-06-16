return {
	{
		"olexsmir/gopher.nvim",
		config = function(_, opts)
			require("gopher").setup(opts)
			vim.keymap.set("n", "<leader>dg", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tag" })
			vim.keymap.set("n", "<leader>dt", "<cmd> GoTagAdd toml <CR>", { desc = "Add toml struct tag" })
			vim.keymap.set("n", "<leader>dy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tag" })
			vim.keymap.set("n", "<leader>ds", "<cmd> GoTagAdd sql <CR>", { desc = "Add sql struct tag" })
			vim.keymap.set("n", "<leader>td", "<cmd> GoMod tidy <CR>", { desc = "Go Mod Tidy" })
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
