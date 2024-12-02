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

--Oil
map("n", "<leader>fe", ":Oil<CR>")
map("n", "<leader>fa", ":SymbolsOutline<CR>")

--Buffers navigation
-- map("n", "<leader>n", ":bn<CR>")
-- map("n", "<leader>b", ":bp<CR>")

--Closing buffers
map("n", "<leader>qq", ":bd<CR>")
map("n", "<leader>qa", "<cmd>%bd|e#|bd#<CR>")
map("n", "<leader>qf", ":bd!<CR>")

--Resize maps
map("n", "+", ":res +5<CR>")
map("n", "_", ":res -5<CR>")
map("n", ">", ":vertical resize +5<CR>")
map("n", "<", ":vertical resize -5<CR>")

--vim navigation while in insert mode
map("i", "<c-j>", "<down>")
map("i", "<c-h>", "<left>")
map("i", "<c-k>", "<up>")
map("i", "<c-l>", "<right>")

-- Terminal
-- map("n", "<leader>tt", ":sp<bar>terminal <CR>")

--Integration tests
-- map("n", "<leader>ti", ":sp<bar>terminal integration %:p ")
map("n", "<leader>ti", ":TermExec cmd='integration %:p' <CR>")
-- Run main file
-- map("n", "<leader>rf", ":sp<bar>terminal run %:p ")
map("n", "<leader>rf", ":TermExec cmd='run %:p' <CR>")
-- Run main dir
map("n", "<leader>rd", ":TermExec cmd='rundir %:p' <CR>")
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

--Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
--map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
-- map("n", "<leader>fs", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fd", "<cmd>Telescope dap configurations<CR>")

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

-- Zen Mode
map("n", "<leader>z", "<cmd> ZenMode <CR>")

-- fugitive
vim.keymap.set("n", "<leader>git", vim.cmd.Git);

-- map("n", "<leader>pp", ":call nvim_put(['fmt.Printf(\"%v %v \\n\", \"\",\"\")'], 'l', v:true, v:true) <CR>")


-- function _G.set_terminal_keymaps()
--     local opts = { buffer = 0 }
--     vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
--     vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]], opts)
--     vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]], opts)
--     vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]], opts)
-- end
--
