return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        local flash = require("flash")

        vim.keymap.set("n", "<leader>s", function()
            flash.jump({
                search = { forward = true, wrap = false, multi_window = true },
            })
        end)
        vim.keymap.set("n", "<leader>S", function()
            flash.jump({
                search = { forward = false, wrap = false, multi_window = true },
            })
        end)
    end
}
