vim.opt.termguicolors = true
vim.opt.cursorline = true

return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme("tokyonight-night")
    end,
}