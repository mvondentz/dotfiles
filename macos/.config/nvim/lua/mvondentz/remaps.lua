function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ";"

--amazing yank to keep cursor
map("v", "y", "ygv<Esc>")

--NerdTree
map("n", "<leader>fe", ":NvimTreeFindFileToggle<CR>")

--Buffers navigation
map("n", "<leader>n", ":bn<CR>")
map("n", "<leader>b", ":bp<CR>")

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
map("n", "<leader>tt", ":sp<bar>terminal <CR>")

--Integration tests
map("n", "<leader>ti", ":sp<bar>terminal t %:p ")
--Local tests with cse,integration build tags
map("n", "<leader>tu", ":sp<bar>terminal r %:p:h ")
-- Run currently main file
map("n", "<leader>rf", ":sp<bar>terminal m %:p ")

--Centralize while navigating
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "nzzzv")

-- Bettern join lines
map("n", "J", "mzJ`z")

-- nop
map("n", "Q", "<nop>")

--DAP
map("n", "<F10>", ":DapToggleBreakpoint <CR>")
map("n", "<F8>", ":DapContinue <CR>")
map("n", "<F7>", ":DapStepOut <CR>")
map("n", "<F6>", ":DapStepOver <CR>")
map("n", "<F5>", ":DapStepIn <CR>")
map("n", "<F9>", ":DapTerminate <CR>")

--Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
--map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fs", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fd", "<cmd>Telescope dap configurations<CR>")

-- Find and replace current packeholder
map("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- navigate the quickfix list
map("n", "<C-j>", "<cmd>cnext<CR>zz")
map("n", "<C-k>", "<cmd>cprev<CR>zz")

-- window navigation
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>z", "<cmd> ZenMode <CR>")

-- fugitive
vim.keymap.set("n", "<leader>git", vim.cmd.Git);

-- undortree
-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Leap
map("n", "<leader>s", "<Plug>(leap-forward-to)", { noremap = false, silent = true })
map("n", "<leader>S", "<Plug>(leap-backward-to)", { noremap = false, silent = true })


map("n", "<leader>pp", ":call nvim_put(['fmt.Printf(\"%v %v \\n\", \"\",\"\")'], 'l', v:true, v:true) <CR>")
