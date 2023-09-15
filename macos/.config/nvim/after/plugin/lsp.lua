function on_attach(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)

    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

    vim.keymap.set("n", "<leader>dj", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>dk", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)

    --vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    --vim.keymap.set("x", "<leader>ca", function() vim.lsp.buf.range_code_action() end, opts)

    -- find all in quicklist
    -- vim.keymap.set("n", "<leader>fa", function() vim.lsp.buf.workspace_symbol() end, opts)

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })
end

local present, lsp = pcall(require, "lsp-zero")
if not present then
    print "lsp-zero not found. LSP not configured"
    return
end

lsp.preset("recommended")
lsp.ensure_installed({
    'gopls',
    'eslint',
    -- 'sumneko_lua',
})
lsp.on_attach(on_attach)

-- GOPLS
local gopls_settings = {
    force_setup = true,
    flags = {
        debounce_text_changes = 500,
    },
    cmd = { 'gopls', '--remote=auto' },
    settings = {
        gopls = {
            usePlaceholders = true,
            buildFlags = { "-tags=integration,cse,wkhtmltopdf" },
            gofumpt = true,
        }
    }
}
lsp.configure('gopls', gopls_settings)
lsp.setup()

local present, cmp = pcall(require, "cmp")
if not present then
    return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings })


-- autoformat on save
vim.cmd [[autocmd BufWritePre * :Format]]
