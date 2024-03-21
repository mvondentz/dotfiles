local present, mason = pcall(require, "mason")
if not present then
    print("mason not found!")
    return
end

local present, masonlsp = pcall(require, "mason-lspconfig")
if not present then
    print("masonlsp not found!")
    return
end

local present, lspconfig = pcall(require, "lspconfig")
if not present then
    print("lspconfig not found!")
    return
end

local present, lsputil = pcall(require, "lspconfig/util")
if not present then
    print("lsputil not found!")
    return
end

local present, capabilities = pcall(require, "cmp_nvim_lsp")
if not present then
    print("capabilities not found!")
    return
end

mason.setup()
masonlsp.setup(
    {
        ensure_installed = { "gopls", "lua_ls", "yamlls", "eslint", "tsserver" },
        automatic_installation = true,
    }
)

lspconfig.gopls.setup
{
    cmd = { 'gopls', '--remote=auto' },
    capabilities = capabilities.default_capabilities(),
    filetypes = { "go", "gomod", "gowork" },
    root_dir = lsputil.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            buildFlags = { "-tags=integration,cse,wkhtmltopdf" },
            experimentalPostfixCompletions = true,
            completeUnimported = true,
            analyses = {
                unusedvariable = true,
                unusedwrite = true,
                staticcheck = true,
                shadow = true,
                gofumpt = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    },
}

lspconfig.lua_ls.setup {}
lspconfig.yamlls.setup {}
lspconfig.eslint.setup {}
lspconfig.tsserver.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<F4>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>f', function()
        --     vim.lsp.buf.format { async = true }
        -- end, opts)

        vim.keymap.set("n", "<leader>dj", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>dk", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)

        -- local status_ok, illuminate = pcall(require, "illuminate")
        -- if not status_ok then
        --     return
        -- end
        -- illuminate.on_attach(ev)

        -- -- Create a command `:Format` local to the LSP buffer
        -- vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_)
        --     if vim.lsp.buf.format then
        --         vim.lsp.buf.format()
        --     elseif vim.lsp.buf.formatting then
        --         vim.lsp.buf.formatting()
        --     end
        -- end, { desc = 'Format current buffer with LSP' })
    end,
})


-- autoformat on save
-- vim.cmd [[autocmd BufWritePre * :Format]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ filter = function(client) return client.supports_method("textDocument/formatting") end, bufnr = vim.api.nvim_get_current_buf() })]]
