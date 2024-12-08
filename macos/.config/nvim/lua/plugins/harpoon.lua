return {
    {
        "letieu/harpoon-lualine"
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        commit = 'e76cb03',
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>fh",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon",
            },
            {
                "<leader>m",
                function() require("harpoon"):list():add() end,
                desc = "Harpoon",
            },
            {
                "<leader>1",
                function() require("harpoon"):list():select(1) end,
                desc = "Harpoon",
            },
            {
                "<leader>2",
                function() require("harpoon"):list():select(2) end,
                desc = "Harpoon",
            },
            {
                "<leader>3",
                function() require("harpoon"):list():select(3) end,
                desc = "Harpoon",
            },
            {
                "<leader>4",
                function() require("harpoon"):list():select(4) end,
                desc = "Harpoon",
            },
            {
                "<leader>5",
                function() require("harpoon"):list():select(5) end,
                desc = "Harpoon",
            },
            {
                "<leader>6",
                function() require("harpoon"):list():select(6) end,
                desc = "Harpoon",
            },

        },
    },
}
