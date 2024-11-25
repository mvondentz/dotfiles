local options = {
    ensure_installed = { "go", "lua", "javascript", "json", "toml", "xml", "http", "graphql" },
    sync_install = true,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = options,
}
