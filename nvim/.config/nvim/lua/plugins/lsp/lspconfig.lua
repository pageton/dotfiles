local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        opts.desc = "Go to Definition"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        opts.desc = "Hover"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "References"
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        opts.desc = "Code Action"
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })
    mason_lspconfig.setup({
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["svelte"] = function()
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client, _)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.svelte", "*.js", "*.ts" },
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,

        ["graphql"] = function()
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,

        ["lua_ls"] = function()
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
        ["gopls"] = function()
          lspconfig.gopls.setup({
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            capabilities = capabilities,
            init_options = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
            settings = {
              gopls = {
                formatting = true,
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
                completeUnimported = true,
                usePlaceholders = true,
                hoverKind = "Structured",
                linksInHover = true,
                experimentalPostfixCompletions = true,
              },
            },
            on_attach = function(_, bufnr)
              local opts = { noremap = true, silent = true, buffer = bufnr }
              local map = vim.keymap.set
              map("n", "gd", vim.lsp.buf.definition, opts)
              map("n", "gr", vim.lsp.buf.references, opts)
              map("n", "K", vim.lsp.buf.hover, opts)
              map("n", "<leader>rn", vim.lsp.buf.rename, opts)
              map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
              map("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
              end, opts)
            end,
          })

          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*.go",
            callback = function() end,
          })
        end,
        ["nil_ls"] = function()
          lspconfig.nil_ls.setup({
            capabilities = capabilities,
            filetypes = { "nix" },
            settings = {
              ['nil'] = {
                formatting = {
                  command = { "nixpkgs-fmt" },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
