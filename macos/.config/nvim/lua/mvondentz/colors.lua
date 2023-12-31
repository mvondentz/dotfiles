-- Rosa Pine setup
local present, rose_pine = pcall(require, "rose-pine")
if present then
    rose_pine.setup({
        --- @usage 'main' | 'moon'
        dark_variant = 'moon',
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,
        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = 'base',
            panel = 'surface',
            border = 'highlight_med',
            comment = 'muted',
            link = 'iris',
            punctuation = 'subtle',

            error = 'love',
            hint = 'iris',
            info = 'foam',
            warn = 'gold',

            headings = {
                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            }
            -- or set all headings at once
            -- headings = 'subtle'
        },
        -- Change specific vim highlight groups
        highlight_groups = {
            ColorColumn = { bg = 'rose' }
        }
    })

    vim.cmd.colorscheme("rose-pine")
end

-- Catppuccin setup
local present, cat = pcall(require, "catppuccin")
if present then
    cat.setup({
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = true,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        }
    })
    vim.cmd.colorscheme("catppuccin-mocha")
end


vim.opt.termguicolors = true
vim.opt.cursorline = true
-- vim.opt.background = "dark"

local present, falc = pcall(require, "falcon")
if present then
    vim.cmd.colorscheme("falcon")
end

-- local present, subs = pcall(require, "substrata")
-- if present then
-- vim.cmd.colorscheme("substrata")
-- end
--
local present, kanagawa = pcall(require, "kanagawa")
if present then
    kanagawa.load("dragon")
end

local present, tokyo = pcall(require, "tokyonight")
if present then
    vim.cmd.colorscheme("tokyonight-night")
end

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
