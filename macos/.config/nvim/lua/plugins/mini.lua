local jump_opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        forward = 'f',
        backward = 'F',
        forward_till = 't',
        backward_till = 'T',
        repeat_jump = '',
    },

    -- Delay values (in ms) for different functionalities. Set any of them to
    -- a very big number (like 10^7) to virtually disable.
    delay = {
        -- Delay between jump and highlighting all possible jumps
        highlight = 250,

        -- Delay between jump and automatic stop if idle (no jump is done)
        idle_stop = 10000000,
    },
}


return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        -- better find with extended things
        require('mini.jump').setup({ jump_opts })
    end,
}
