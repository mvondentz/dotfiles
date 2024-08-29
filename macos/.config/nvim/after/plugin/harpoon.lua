local present, harpoon = pcall(require, "harpoon")
if not present then
    return
end

harpoon.setup({
    -- global_settings = {
    --     -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    --     save_on_toggle = false,
    --
    --     -- saves the harpoon file upon every change. disabling is unrecommended.
    --     save_on_change = true,
    --
    --     -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    --     enter_on_sendcmd = false,
    --
    --     -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    --     tmux_autoclose_windows = false,
    --
    --     -- filetypes that you want to prevent from adding to the harpoon list menu.
    --     excluded_filetypes = { "harpoon" },
    --
    --     -- set marks specific to each git branch inside git repository
    --     mark_branch = false,
    --
    --     -- enable tabline with harpoon marks
    --     tabline = false,
    --     tabline_prefix = "   ",
    --     tabline_suffix = "   ",
    -- }
})


-- basic teleconfig configuration
local present, teleconfig = pcall(require, "telescope.config")
if not present then
    return
end

local present, telepickers = pcall(require, "telescope.pickers")
if not present then
    return
end

local present, telefinders = pcall(require, "telescope.finders")
if not present then
    return
end

local conf = teleconfig.values

local function toogleHarpoonTelescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    telepickers.new({}, {
        prompt_title = "Harpoon",
        finder = telefinders.new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>fh", function() toogleHarpoonTelescope(harpoon:list()) end, { desc = "Open harpoon window" })
