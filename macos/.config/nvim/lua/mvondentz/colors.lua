vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.background = "dark"

vim.cmd.colorscheme("falcon")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
