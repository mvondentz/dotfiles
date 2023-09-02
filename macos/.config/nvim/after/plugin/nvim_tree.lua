local present, nvim_tree = pcall(require, "nvim-tree")
if not present then
    return
end

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        -- mappings = {
        --     list = {
        --         { key = "u", action = "dir_up" },
        --     },
        -- },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
