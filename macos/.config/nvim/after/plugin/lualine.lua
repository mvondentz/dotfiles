local present, lualine = pcall(require, "lualine")
if not present then
    return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

-- local present, utils = pcall(require, "lualine.utils.utils")
-- if not present then
--     print "lualine utils not found, fallback to default"
--     lualine.setup()
--     return
-- end
-- local present, highlight = pcall(require, "lualine.highlight")
-- if not present then
--     print "lualine highlight not found, fallback to default"
--     lualine.setup()
--     return
-- end
-- local present, component = pcall(require, "lualine.component")
-- if not present then
--     print "lualine component not found, fallback to default"
--     lualine.setup()
-- end
--
-- local diagnostics_message = component:extend()
--
-- diagnostics_message.default = {
--     colors = {
--         error = utils.extract_color_from_hllist(
--             { "fg", "sp" },
--             { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
--             "#e32636"
--         ),
--         warning = utils.extract_color_from_hllist(
--             { "fg", "sp" },
--             { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
--             "#ffa500"
--         ),
--         info = utils.extract_color_from_hllist(
--             { "fg", "sp" },
--             { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
--             "#ffffff"
--         ),
--         hint = utils.extract_color_from_hllist(
--             { "fg", "sp" },
--             { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
--             "#273faf"
--         ),
--     },
-- }
--
-- function diagnostics_message:init(options)
--     diagnostics_message.super:init(options)
--     self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
--     self.highlights = { error = "", warn = "", info = "", hint = "" }
--     self.highlights.error = highlight.create_component_highlight_group(
--         { fg = self.options.colors.error },
--         "diagnostics_message_error",
--         self.options
--     )
--     self.highlights.warn = highlight.create_component_highlight_group(
--         { fg = self.options.colors.warn },
--         "diagnostics_message_warn",
--         self.options
--     )
--     self.highlights.info = highlight.create_component_highlight_group(
--         { fg = self.options.colors.info },
--         "diagnostics_message_info",
--         self.options
--     )
--     self.highlights.hint = highlight.create_component_highlight_group(
--         { fg = self.options.colors.hint },
--         "diagnostics_message_hint",
--         self.options
--     )
-- end
--
-- function diagnostics_message:update_status(is_focused)
--     local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
--     local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
--     if #diagnostics > 0 then
--         local diag = diagnostics[1]
--         for _, d in ipairs(diagnostics) do
--             if d.severity < diag.severity then
--                 diagnostics = d
--             end
--         end
--         local icons = { " ", " ", " ", " " }
--         local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
--         return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
--     else
--         return ""
--     end
-- end
--
-- lualine.setup({
--     sections = {
--         lualine_c = {
--             {
--                 diagnostics_message,
--                 colors = {
--                     error = "#BF616A",
--                     warn = "#EBCB8B",
--                     info = "#A3BE8C",
--                     hint = "#88C0D0",
--                 },
--             },
--         },
--     },
-- })
