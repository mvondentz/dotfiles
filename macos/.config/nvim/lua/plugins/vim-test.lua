return {
    "vim-test/vim-test",
    keys = {
        {
            "<leader>tu",
            ":TestNearest -strategy=toggleterm <CR>"
        },
        {
            "<leader>tua",
            ":TestFile -strategy=toggleterm <CR>"
        },
    },
}
