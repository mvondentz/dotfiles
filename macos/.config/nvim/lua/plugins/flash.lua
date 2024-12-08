return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {

        {
            "<leader>s",
            function()
                require("flash").jump({
                    search = { forward = true, wrap = false, multi_window = true },
                })
            end,
            desc = "Search forward"
        },
        {
            "<leader>S",
            function()
                require("flash").jump({
                    search = { forward = false, wrap = false, multi_window = true },
                })
            end,
            desc = "Search backwards"
        },
    },
}
