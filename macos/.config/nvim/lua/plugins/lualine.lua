local options = {
    options = {
        icons_enabled = true,
        -- theme = 'auto',
        theme = 'kanagawa',
        -- theme = 'codedark',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            function()
                return vim.fn["copilot#GetStatus"]()
            end,
            -- {
            --     'filename',
            --     path = 1,
            -- },
            "harpoon2",
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        -- lualine_c = { 'filename' },
        -- lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {},
}


return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = options,
}
