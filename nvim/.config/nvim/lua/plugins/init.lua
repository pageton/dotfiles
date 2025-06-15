-- lua/plugins/init.lua

return {
  -- require("plugins.lsp-config"), TODO: add lsp config
  require("plugins.lsp.lspconfig"),
  require("plugins.lsp.mason"),
  require("plugins.catppuccin"),
}
