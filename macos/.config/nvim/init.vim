autocmd!

" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ttyfast          " Fast rendering
set lazyredraw
syntax on            " Enable syntax highlight
set guicursor=       " Bold cursor
set nu               " Enable line numbers
set relativenumber   " Enable relative line numbers
"set nohlsearch       " Don't highlight searchs
set noerrorbells     " No Bells!
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set expandtab
set nowrap
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=10     " Minimum number of lines to keep above and below the cursor
set colorcolumn=120  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set showcmd
set shell=fish
set cmdheight=3      " Give more space for displaying messages
set updatetime=50   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set noswapfile       " No swap files
set undodir=~/.vim/undodir
set undofile
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set autowrite        "
set mouse=a          " Enable mouse support
set ai               " auto ident
set si               " smart ident
set inccommand=split
set clipboard=unnamedplus "macos copy
set shiftround

filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any


" Plugins """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kkharji/lspsaga.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'folke/tokyonight.nvim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'honza/vim-snippets'

Plug 'mbbill/undotree'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'airblade/vim-gitgutter'

Plug 'zivyangll/git-blame.vim'

"Plug 'sebdah/vim-delve'
Plug 'mfussenegger/nvim-dap'
"Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'ThePrimeagen/git-worktree.nvim'

"Plug 'tpope/vim-dadbod'
"Plug 'kristijanhusak/vim-dadbod-ui'
"Plug 'kristijanhusak/vim-dadbod-completion'

Plug 'alan-w-255/telescope-mru.nvim'
Plug 'yegappan/mru'

Plug 'windwp/nvim-autopairs'
Plug 'andymass/vim-matchup'

call plug#end()

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()

require('telescope').setup({
defaults = {
    mappings = {
        n = { -- delete buffer in list view
        ['<c-d>'] = require('telescope.actions').delete_buffer
        },
    i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
        }
    }
},
  })

require("telescope").load_extension('mru')
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("dap")

require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})


EOF


" Themes """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

"colorscheme gruvbox
"let g:airline_theme = 'gruvbox'

set background=dark

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
colorscheme tokyonight
let g:airline_theme = "tokyonight"

set cursorline

" Autocmd """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remaps """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ";"

" Vista
nnoremap <leader>s :Vista!!<CR>

" esc to exit terminal
tnoremap <Esc> <C-\><C-n>

" amazing yank to keep cursor
vmap y ygv<Esc>

" New Line
nmap <leader>a o<Esc>
nmap <leader>A O<Esc>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>fc <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>
nnoremap <leader>fs <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>fr <cmd>Telescope mru<cr>

" Nerdtree ----
nnoremap <silent> <expr> <leader>fe g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeShowHidden=1
"----

" Buffers navigation
map <leader>n :bn<cr>
map <leader>b :bp<cr>

map <leader>dd :bd<cr>
command BufOnly silent! execute "%bd|e#|bd#"
map <leader>da :BufOnly<cr>


" Git remaps
nnoremap <leader>ij :<C-u>call gitblame#echo()<CR>
nnoremap <leader>in <Plug>(GitGutterNextHunk)
nnoremap <leader>ib <Plug>(GitGutterPrevHunk)
nnoremap <leader>ip <Plug>(GitGutterPreviewHunk)

" Rezise maps
nnoremap + :res +5<CR>
nnoremap _ :res -5<CR>
nnoremap < :vertical resize +5<CR>
nnoremap > :vertical resize -5<CR>

" vim navigation while in insert mode
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-k> <up>
inoremap <c-l> <right>

"Delve Remaps
"q = quit
"n = next
"b <line> = add brk to line
"c = continue (next line)
"r = restart
"s = step
"so = step out
au FileType go nnoremap <Leader>ha :DapToggleBreakpoint <CR>
au FileType go nnoremap <Leader>hc :DapContinue <CR>
au FileType go nnoremap <Leader>ho :DapStepOut <CR>
au FileType go nnoremap <Leader>hi :DapStepIn <CR>

" Integration tests
au FileType go nnoremap <leader>ht :vs<bar>terminal t %:p


" Airline """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" dadbod """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dbs = {
            \ 'testprod_entities': 'mongodb://user:pass@localhost:27022/entities?authSource=admin',
            \ 'testprod_events': 'mongodb://user:pass@localhost:27022/events?authSource=admin',
            \ 'prod_entities': 'mongodb://localhost:27023/entities?readPreference=secondaryPreferred&serverSelectionTimeoutMS=5000&connectTimeoutMS=10000&authSource=admin&authMechanism=SCRAM-SHA-1',
            \ 'prod_events': 'mongodb://localhost:27023/events?readPreference=secondaryPreferred&serverSelectionTimeoutMS=5000&connectTimeoutMS=10000&authSource=admin&authMechanism=SCRAM-SHA-1',
            \ }


" Worktree  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local worktree = require("git-worktree")

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
      -- Navigate to src/el to enable go test
      local cmd = string.format("%s %s/src/el", "cd", metadata.path)
      vim.cmd(cmd)
      end
end)
EOF

" DAP config """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF

local dap = require('dap')
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Test .mod",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}


local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

EOF


" LSP Config  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF

local opts = { noremap=true, silent=true }

local lsp_config = require'lspconfig'
local lsp_status = require'lsp-status'
local lsp_saga = require'lspsaga'
--local lsp_completion = require'completion'
--local lsp_format = require'formatter'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
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
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    vim.api.nvim_buf_set_keymap(0, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "K","<cmd>Lspsaga hover_doc<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
    vim.api.nvim_buf_set_keymap(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

    --lsp_completion.on_attach(client)
    lsp_status.on_attach(client)
    --if client.resolved_capabilities.document_formatting then
        --lsp_format.buf_pre_save()
        --end
end

local lsp_flags = { debounce_text_changes = 500 }

vim.g['completion_auto_change_source'] = 1

lsp_status.register_progress()
lsp_saga.init_lsp_saga{
    use_saga_diagnostic_sign = false
}

lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_status.capabilities)

local lsp_default_config = {on_attach = on_attach, capabilites = lsp_capabilities, flags = lsp_flags}
local servers = {
    gopls = {
        cmd = {'gopls'},
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

require 'nvim-treesitter.configs'.setup({
highlight = {
    enable = true
    }
})


EOF
