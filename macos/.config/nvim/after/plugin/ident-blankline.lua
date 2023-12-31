local present, ident = pcall(require, "ibl")
if not present then
    return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- ident.setup {
--     show_current_context = true,
--     show_current_context_start = false,
--
--     show_end_of_line = true,
--     -- space_char_blankline = " ",
-- }

-- local highlight = {
-- "CursorColumn",
-- "Whitespace",
-- }
ident.setup {
    -- indent = { highlight = highlight, char = "" },
    indent = { char = "" },
    whitespace = {
        -- highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
