return {
    "vim-test/vim-test",
    config = function()
        vim.keymap.set("n", "<leader>tu", ":TestNearest -strategy=toggleterm <CR>")
        vim.keymap.set("n", "<leader>tua", ":TestFile -strategy=toggleterm <CR>")
    end

}
