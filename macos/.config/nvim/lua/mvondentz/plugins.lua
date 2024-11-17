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

    use 'stevearc/oil.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    use 'nvim-lualine/lualine.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    use 'numToStr/Comment.nvim'

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

    use 'ThePrimeagen/git-worktree.nvim'

    use('folke/zen-mode.nvim')

    use 'folke/flash.nvim'

    use 'lewis6991/gitsigns.nvim'

    -- DAP
    -- use 'rcarriga/nvim-dap-ui'
    -- use 'theHamsta/nvim-dap-virtual-text'
    -- use 'nvim-telescope/telescope-dap.nvim'
    -- use 'nvim-neotest/nvim-nio'
    -- use 'mfussenegger/nvim-dap'

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use { "RRethy/vim-illuminate" }

    -- Completions
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'


    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    })

    -- use('fatih/vim-go', { run = ':GoUpdateBinaries' })

    -- use {
    --     'folke/noice.nvim',
    --     requires = {
    --         { 'MunifTanjim/nui.nvim' },
    --         { 'rcarriga/nvim-notify' },
    --     }
    -- }

    use 'ray-x/guihua.lua'

    use 'windwp/nvim-autopairs'

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
    }
    use 'letieu/harpoon-lualine'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'simrat39/symbols-outline.nvim'

    use {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = false,
        config = function()
            require("todo-comments").setup {}
        end
    }

    use 'vim-test/vim-test'


    -- use 'tpope/vim-dadbod'
    -- use 'kristijanhusak/vim-dadbod-completion'
    -- use 'kristijanhusak/vim-dadbod-ui'
    -- use 'tpope/vim-dotenv'

    -- Avante AI
    use 'nvim-treesitter/nvim-treesitter'
    use 'stevearc/dressing.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'HakonHarnes/img-clip.nvim'
    use 'MeanderingProgrammer/render-markdown.nvim'
    use 'yetone/avante.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
