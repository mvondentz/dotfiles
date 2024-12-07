return {
    'ThePrimeagen/git-worktree.nvim',
    keys = {
        {
            "<leader>fw",
            function()
                require('telescope').extensions.git_worktree.git_worktrees()
            end
        },
    },
    config = function()
        local worktree = require("git-worktree")
        worktree.on_tree_change(function(op, metadata)
            if op == worktree.Operations.Switch then
                -- Navigate to src/el to enable DAP and unit tests to work properly
                if string.find(metadata.path, "services.git") then
                    local cmd = string.format("%s %s/src/el", "cd", metadata.path)
                    vim.cmd(cmd)
                end
            end
        end)
    end,

}
