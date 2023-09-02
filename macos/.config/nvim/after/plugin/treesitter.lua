local present, treesiter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

treesiter.setup({
    ensure_installed = { "go", "lua", "javascript", "json", "toml", "hcl" },
    sync_install = true,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
})
