vim.g['completion_auto_change_source'] = 1

-- CMP configs
local present, lsp_config = pcall(require, "lspconfig")
if not present then
    return
end

local present, luasnip = pcall(require, "luasnip")
if not present then
    return
end

local present, cmp = pcall(require, "cmp")
if not present then
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}
-------------------


-- Signs configs
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})
---------------------


-- LSP Client configs 
local present, lsp_status = pcall(require, "lsp-status")
if not present then
    return
end

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    local opts = { noremap=true, silent=true }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    --vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    vim.api.nvim_buf_set_keymap(0, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "K","<cmd>Lspsaga hover_doc<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)

    lsp_status.on_attach(client)

    --if client.resolved_capabilities.document_formatting then
        --lsp_format.buf_pre_save()
    --end
end

lsp_status.register_progress()

local present, lsp_saga = pcall(require, "lspsaga")
if present then
    lsp_saga.init_lsp_saga{
        use_saga_diagnostic_sign = false
    }
end

lsp_capabilities = lsp_config.util.default_config
local lsp_flags = { debounce_text_changes = 500 }
local lsp_default_config = {on_attach = on_attach, capabilites = lsp_capabilities, flags = lsp_flags}

-- LSP Servers configs
local servers = {
    gopls = {
        cmd = {'gopls', '--remote=auto'},
        settings = {
            gopls = {
                usePlaceholders = true,
                buildFlags =  {"-tags=integration,cse"},
                gofumpt = true,
            }
        },
        capabilties = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = true
                    }
                }
            }
        },
        init_options = {
            usePlaceholders = false,
            completeUnimported = true
        }
    }
}

for server, config in pairs(servers) do
    lsp_config[server].setup(vim.tbl_deep_extend('force', lsp_default_config, config))
end

local present, treesiter = pcall(require, "nvim-treesitter.configs")
if present then
    treesiter.setup({
        highlight = {
            enable = true
        }
    })
end
