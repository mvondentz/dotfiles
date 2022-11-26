
lua << EOF
-- Highlight yanked text for a brief amount of time.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = (vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'),
      timeout = 300
    })
  end
})
EOF

lua << EOF
local worktree = require("git-worktree")

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
      -- TODO: Check if we are in the services repo, otherwise don't do this
      -- Navigate to src/el to enable go test
      local cmd = string.format("%s %s/src/el", "cd", metadata.path)
      vim.cmd(cmd)
      end
end)
EOF
