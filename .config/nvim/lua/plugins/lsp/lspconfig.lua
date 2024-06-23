return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- clearify floating window border
    local border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
    vim.diagnostic.config({
      float = {
        border = border,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- go to keymaps

        opts.desc = "Go to references"
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Go to definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Go to implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Go to type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- diagnostics keymaps

        opts.desc = "Find diagnostics in current file"
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Find all diagnostics"
        vim.keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics<CR>", opts)

        opts.desc = "Diagnostics on cursor line"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["graphql"] = function()
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
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
    })
  end,
}
