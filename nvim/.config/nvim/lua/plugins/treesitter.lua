return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>gnn",
          node_incremental = "<leader>grn",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "go",
        "html",
        "css",
        "json",
        "bash",
        "markdown",
        "rust",
        "zig",
        "c",
        "toml",
        "dockerfile",
        "yaml",
        "nix",
      },
      auto_install = true,
    })
  end,
}
