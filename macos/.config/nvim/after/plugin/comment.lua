local present, comment = pcall(require, "Comment")
if not present then
    return
end

comment.setup({
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
    post_hook = nil,
})
