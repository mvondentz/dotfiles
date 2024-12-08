local opts = {
    open_mapping = [[<leader>tt]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    start_in_insert = true,
    insert_mappings = true,        -- whether or not the open mapping applies in insert mode
    terminal_mappings = true,      -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true,           -- if set to true (default) the previous terminal mode will be remembered
    direction = 'float',
    close_on_exit = true,          -- close the terminal window when the process exits
    shell = vim.o.shell,
    auto_scroll = true,            -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved',
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        -- width = <value>,
        -- height = <value>,
        -- row = <value>,
        -- col = <value>,
        winblend = 3,
        -- zindex = <value>,
        title_pos = 'right',
    },
}

return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = opts,
        lazy = false,
        priority = 100,
        keys = {
            {
                "<leader>trf",
                ":TermExec cmd='run %:p' <CR>",
            },
            {
                "<leader>trd",
                ":TermExec cmd='rundir %:p' <CR>",
            },
        },
    }
}
