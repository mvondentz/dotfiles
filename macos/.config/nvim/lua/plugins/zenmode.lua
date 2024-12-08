local opts = {
    window = {
        width = 0.65,
        options = {
            number = true,
            relativenumber = true,
        },
    },
}
return {
    "folke/zen-mode.nvim",
    keys = {
        {
            "<leader>z",
            function()
                require("zen-mode").toggle();
            end,
        },
    },
    opts = opts,
}
