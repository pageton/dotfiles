return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", {})
		vim.keymap.set("n", "<C-/>", function()
			local neo_tree_win = nil
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
				if bufname:match("neo%-tree") then
					neo_tree_win = win
					break
				end
			end

			if neo_tree_win then
				if vim.api.nvim_get_current_win() == neo_tree_win then
					vim.cmd("wincmd p")
				else
					vim.api.nvim_set_current_win(neo_tree_win)
				end
			end
		end, { noremap = true, silent = true })
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},
			},
		})
	end,
}
