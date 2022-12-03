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

-- autoformat on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
