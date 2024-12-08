local keys = {
    { "<leader>gb",  function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>.",   function() Snacks.scratch() end,   desc = "Toggle Scratch Buffer" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>git", function() Snacks.lazygit() end,   desc = "Lazy Git" },
}

local scratch_opts = {
    enabled = true,
    name = "Scratch",
    ft = function()
        return "markdown"
    end,
}

local opts = {
    bigfile = { enabled = true },
    gbrowse = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scratch = scratch_opts,
    lazygit = { enabled = true },
}

local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params
            .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
            return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
                p[i] = {
                    token = ev.data.params.token,
                    msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                    ),
                    done = value.kind == "end",
                }
                break
            end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})


return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = opts,
    keys = keys,
}
