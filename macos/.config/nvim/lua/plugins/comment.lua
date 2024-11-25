local options = {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = '<leader>c',
    },
    opleader = {
        line = '<leader>c',
    },
    extra = {},
    mappings = {
        basic = true,
        extra = true,
    },
    pre_hook = nil,
}

return {
    'numToStr/Comment.nvim',
    opts = options,
}
