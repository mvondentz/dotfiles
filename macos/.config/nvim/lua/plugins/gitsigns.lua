local opts = {
    signs                           = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn                      = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                           = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                          = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                       = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                    = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked             = true,
    current_line_blame              = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts         = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1550,
        ignore_whitespace = false,
    },
    current_line_blame_formatter    = '<author>, <author_time> - <summary>',
    current_line_blame_formatter_nc = '<author>',
    -- current_line_blame_formatter_opts = {
    --     relative_time = true,
    -- },
    sign_priority                   = 6,
    update_debounce                 = 100,
    status_formatter                = nil,   -- Use default
    max_file_length                 = 40000, -- Disable if file is longer than this (in lines)
    preview_config                  = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    -- yadm                              = {
    --     enable = false
    -- },
}

return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    priority = 100,
    opts = opts,
    keys = {
        {
            "<leader>ghn",
            function()
                require("gitsigns").nav_hunk("next")
            end,
            desc = "Next Hunk"
        },
        {
            "<leader>ghp",
            function()
                require("gitsigns").nav_hunk("prev")
            end,
            desc = "Prev Hunk"
        },
        {
            "<leader>ghr",
            function()
                require("gitsigns").reset_hunk()
            end,
            desc = "Reset Hunk"
        },
        {
            "<leader>ght",
            function()
                local gitsigns = require('gitsigns')
                gitsigns.toggle_linehl()
                gitsigns.toggle_word_diff()
                gitsigns.toggle_numhl()
            end,
            desc = "Gitsigns Toggle"
        },
    },
}
