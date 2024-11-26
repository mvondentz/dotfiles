return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Lazy load when opening files
    config = function()
        local lspconfig = require("lspconfig")

        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })

        local on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<F4>', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

            -- format
            -- vim.keymap.set("n", "<leader>fo", function()
            --     vim.lsp.buf.format({ async = true })
            -- end, opts)
        end

        local lsputil = require("lspconfig/util")

        local golps = {
            on_attach = on_attach,
            cmd = { 'gopls', '--remote=auto' },
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            filetypes = { "go", "gomod", "gowork" },
            root_dir = lsputil.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    --- experimental
                    -- gofumpt = true,
                    codelenses = {
                        generate = true, -- Enable code lens for generating code
                        gc_details = true,
                        test = true,
                    },
                    semanticTokens = true,
                    --- experimental

                    buildFlags = { "-tags=integration,cse,wkhtmltopdf" },
                    experimentalPostfixCompletions = true,
                    completeUnimported = true,
                    analyses = {
                        unusedvariable = true,
                        unusedwrite = true,
                        staticcheck = true,
                        shadow = true,
                        -- gofumpt = true,
                    },
                    staticcheck = true,
                },
            },
            init_options = {
                usePlaceholders = true,
            },
        }

        lspconfig.gopls.setup(golps)
        lspconfig.lua_ls.setup {}
        lspconfig.jsonls.setup {}
        lspconfig.yamlls.setup {}
        lspconfig.eslint.setup {}
        lspconfig.ts_ls.setup {}
    end,
}
