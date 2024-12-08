function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

--amazing yank to keep cursor
map("v", "y", "ygv<Esc>")
-- map("n", "p", "\"_dP")

--Closing buffers
-- map("n", "<leader>qq", ":bd<CR>")
-- map("n", "<leader>qa", "<cmd>%bd|e#|bd#<CR>")
-- map("n", "<leader>qf", ":bd!<CR>")
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>bx", ":bd!<CR>")
map("n", "<leader>bc", "<C-W>c")
map("n", "<leader>bo", "<C-W>o")

--Resize maps
map("n", "+", ":res +5<CR>")
map("n", "_", ":res -5<CR>")
map("n", ">", ":vertical resize +5<CR>")
map("n", "<", ":vertical resize -5<CR>")

--vim navigation while in insert mode
-- map("i", "<c-j>", "<down>")
-- map("i", "<c-h>", "<left>")
-- map("i", "<c-k>", "<up>")
-- map("i", "<c-l>", "<right>")

-- Terminal
-- map("n", "<leader>tt", ":sp<bar>terminal <CR>")
-- map("n", "<leader>ti", ":sp<bar>terminal integration %:p ")
-- map("n", "<leader>rf", ":sp<bar>terminal run %:p ")
-- map("n", "<leader>rd", ":sp<bar>terminal rundir %:p ")

--Centralize while navigating
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "nzzzv")

-- Better join lines
map("n", "J", "mzJ`z")

-- nop
map("n", "Q", "<nop>")

--DAP
-- map("n", "<F10>", ":DapToggleBreakpoint <CR>")
-- map("n", "<F8>", ":DapContinue <CR>")
-- map("n", "<F7>", ":DapStepOut <CR>")
-- map("n", "<F6>", ":DapStepOver <CR>")
-- map("n", "<F5>", ":DapStepIn <CR>")
-- map("n", "<F9>", ":DapTerminate <CR>")

-- Find and replace current placeholder
map("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- navigate the quickfix list
map("n", "<C-j>", "<cmd>cnext<CR>zz")
map("n", "<C-k>", "<cmd>cprev<CR>zz")

-- window navigation
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")

-- fugitive
vim.keymap.set("n", "<leader>git", vim.cmd.Git);

-- map("n", "<leader>pp", ":call nvim_put(['fmt.Printf(\"%v %v \\n\", \"\",\"\")'], 'l', v:true, v:true) <CR>")
