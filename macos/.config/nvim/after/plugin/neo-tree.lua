local present, neo_tree = pcall(require, "neo-tree")
if not present then
    return
end

neo_tree.setup({
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, -- only works on Windows for hidden files/directories
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
        },
        group_empty_dirs = false,           -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    },
    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
        },
    },
})
