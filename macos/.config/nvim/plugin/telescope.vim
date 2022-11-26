lua << EOF

require('telescope').setup({
defaults = {
    mappings = {
        n = { -- delete buffer in list view
        ['<c-d>'] = require('telescope.actions').delete_buffer
        },
    i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
        }
    }
},
  })

require("telescope").load_extension('mru')
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("dap")

require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})


EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>fc <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>
nnoremap <leader>fs <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>fr <cmd>Telescope mru<cr>

