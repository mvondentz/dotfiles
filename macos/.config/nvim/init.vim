autocmd!

" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Plugins 
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'kkharji/lspsaga.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mbbill/undotree'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'airblade/vim-gitgutter'

Plug 'zivyangll/git-blame.vim'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ryanoasis/vim-devicons'

Plug 'ThePrimeagen/git-worktree.nvim'

Plug 'andymass/vim-matchup'
Plug 'numToStr/Comment.nvim'

Plug 'fenetikm/falcon'

Plug 'nvim-tree/nvim-web-devicons' 
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()
