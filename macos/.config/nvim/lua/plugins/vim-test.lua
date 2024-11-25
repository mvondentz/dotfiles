return {
    "vim-test/vim-test",
    config = function()
        vim.keymap.set("n", "<leader>tu", ":TestNearest -strategy=neovim_sticky <CR>")
        vim.keymap.set("n", "<leader>tua", ":TestFile -strategy=neovim_sticky <CR>")
    end

}
