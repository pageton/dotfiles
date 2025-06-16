return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")
		substitute.setup()

		vim.keymap.set("n", "s", substitute.operator, { desc = "Subsitute with motion" })
		vim.keymap.set("n", "ss", substitute.line, { desc = "Subsitute line" })
		vim.keymap.set("n", "S", substitute.eol, { desc = "Subsitute to end of line" })
		vim.keymap.set("x", "s", substitute.visual, { desc = "Subsitute in visual mode" })
	end,
}
