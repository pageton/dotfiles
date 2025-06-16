return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			require("dap-go").setup()

			local function toggle_dapui_on_event(event, open)
				dap.listeners.before[event].dapui_config = function()
					if open then
						dapui.open()
					else
						dapui.close()
					end
				end
			end

			toggle_dapui_on_event("attach", true)
			toggle_dapui_on_event("launch", true)
			toggle_dapui_on_event("event_terminated", false)
			toggle_dapui_on_event("event_exited", false)

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue Debugging" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
			vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
		end,
	},
}
