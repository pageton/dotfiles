return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = {
      marks = true,
      registers = true,
    },
    key_labels = {
      ["<leader>"] = "SPC",
    },
  },
  config = function()
    local last_press = 0
    vim.keymap.set("n", "<CR>", function()
      local current_time = vim.fn.reltimefloat(vim.fn.reltime())
      if current_time - last_press < 0.5 then
        require("which-key").show()
      end
      last_press = current_time
    end)
  end,
}
