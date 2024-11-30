local options = {}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        local ibl = require("ibl")
        ibl.setup(options)

        -- vim.opt.list = true
        -- vim.opt.listchars:append "space:⋅"
        -- vim.opt.listchars:append "eol:↴"
    end,
}
