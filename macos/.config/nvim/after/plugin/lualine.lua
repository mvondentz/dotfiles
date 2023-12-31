local present, lualine = pcall(require, "lualine")
if not present then
    return
end


lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                path = 1,
            },
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
    extensions = {}
}
--
--
-- lualine.setup({
--     options = {
--         icons_enabled = true,
--         component_separators = '|',
--         section_separators = '',
--     },
--     sections = {
--         lualine_x = {
--             {
--                 require("noice").api.statusline.mode.get,
--                 cond = require("noice").api.statusline.mode.has,
--                 color = { fg = "#ff9e64" },
--             }
--         },
--         lualine_a = {
--             {
--                 'buffers',
--             }
--         }
--     }
-- })

-- lualine.setup {
--     options = {
--         icons_enabled = true,
--         theme = 'auto',
--         component_separators = { left = '', right = '' },
--         section_separators = { left = '', right = '' },
--         disabled_filetypes = {},
--         always_divide_middle = true,
--     },
--     sections = {
--         lualine_a = { 'mode' },
--         lualine_b = { 'branch', 'diff', 'diagnostics' },
--         lualine_c = {
--             {
--                 'filename',
--                 path = 1,
--             }
--         },
--         lualine_x = { 'encoding', 'fileformat', 'filetype' },
--         lualine_y = { 'progress' },
--         lualine_z = { 'location' }
--     },
--     inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { 'filename' },
--         lualine_x = { 'location' },
--         lualine_y = {},
--         lualine_z = {}
--     },
--     tabline = {},
--     extensions = {}
-- }
--
--
