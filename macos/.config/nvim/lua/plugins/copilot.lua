return {
    {
        "github/copilot.vim",
        event = "InsertEnter",                                                      -- Load when entering insert mode
        ft = { "javascript", "typescript", "lua", "python", "go", "yaml", "json" }, -- Specific file types
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<leader>a", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.g.copilot_suggestion_delay = 1500 -- it's not working
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = true,
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },    -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            debug = false,
            window = {
                width = 0.35,
            },
        },
        keys = {
            {
                "<Leader>ac",
                ":'<,'>CopilotChat<CR>",
                mode = { "v" },
                desc = "Copilot Chat Selection",
            },
            {
                "<Leader>ac",
                ":CopilotChatToggle<CR>",
                mode = { "n" },
                desc = "Toggle Copilot Chat",
            },
        },
    }
}
