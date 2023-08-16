-- Ensure packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')

    -- use('mbbill/undotree')

    use('nvim-lualine/lualine.nvim')

    use('kyazdani42/nvim-web-devicons')
    use('ryanoasis/vim-devicons')

    use('nvim-tree/nvim-tree.lua')

    use('numToStr/Comment.nvim')

    -- use('fenetikm/falcon')
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use('ThePrimeagen/git-worktree.nvim')

    use("folke/zen-mode.nvim")

    use('ggandor/leap.nvim')

    -- use('jiangmiao/auto-pairs')

    use('lewis6991/gitsigns.nvim')

    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            { 'mfussenegger/nvim-dap' },
            { 'nvim-telescope/telescope-dap.nvim' },
        }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- use('fatih/vim-go', { run = ':GoUpdateBinaries' })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
