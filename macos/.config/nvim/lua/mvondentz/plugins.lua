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
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "MunifTanjim/nui.nvim",
    --     }
    -- }

    use 'stevearc/oil.nvim'


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')

    use('nvim-lualine/lualine.nvim')

    use('kyazdani42/nvim-web-devicons')
    use('ryanoasis/vim-devicons')

    use('numToStr/Comment.nvim')

    --  Themes
    -- use { "catppuccin/nvim", as = "catppuccin" }
    -- use({ 'lunacookies/vim-substrata', as = "substrata" })
    -- use "rebelot/kanagawa.nvim"
    use "folke/tokyonight.nvim"
    -- use('fenetikm/falcon')
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    -- })

    use('ThePrimeagen/git-worktree.nvim')

    use 'pocco81/true-zen.nvim'
    -- use('folke/zen-mode.nvim')

    -- use('ggandor/leap.nvim')
    use 'folke/flash.nvim'

    use('lewis6991/gitsigns.nvim')

    -- use {
    --     'rcarriga/nvim-dap-ui',
    --     requires = {
    --         { 'mfussenegger/nvim-dap' },
    --         { 'nvim-telescope/telescope-dap.nvim' },
    --     }
    -- }

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use { "RRethy/vim-illuminate" }
    -- use { "jose-elias-alvarez/null-ls.nvim" }

    -- Completions
    use { "hrsh7th/nvim-cmp" }         -- The completion plugin
    use { "hrsh7th/cmp-buffer" }       -- buffer completions
    use { "hrsh7th/cmp-path" }         -- path completions
    use 'hrsh7th/cmp-cmdline'
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    -- Snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- use('fatih/vim-go', { run = ':GoUpdateBinaries' })

    use('rcarriga/nvim-notify')

    use {
        'folke/noice.nvim',
        requires = {
            { 'MunifTanjim/nui.nvim' },
            { 'rcarriga/nvim-notify' },
        }
    }

    use('ray-x/guihua.lua')

    use('windwp/nvim-autopairs')

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
    }
    use { 'letieu/harpoon-lualine' }

    use {
        'lukas-reineke/indent-blankline.nvim',
    }

    use 'simrat39/symbols-outline.nvim'


    use {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = false,
        config = function()
            require("todo-comments").setup {}
        end
    }

    use('vim-test/vim-test')


    if packer_bootstrap then
        require('packer').sync()
    end
end)
