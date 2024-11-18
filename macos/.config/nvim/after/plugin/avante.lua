local found, img_clip = pcall(require, "img-clip")
if not found then
    return
end

img_clip.setup({
    default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
            insert_mode = true,
        },
        -- required for Windows users
        use_absolute_path = true,
    },
})


local found, render_markdown = pcall(require, "render-markdown")
if not found then
    return
end


render_markdown.setup({
    file_types = { "markdown", "Avante" },
})

local found, avante_lib = pcall(require, "avante_lib")
if not found then
    return
end


local found, avante = pcall(require, "avante")
if not found then
    return
end

local found, gemini_provider = pcall(require, "avante.providers.gemini")
if not found then
    return
end

avante_lib.load()

-- GEMINI URL
-- endpoint = "https://LOCATION-aiplatform.googleapis.com/v1/projects/PROJECT_ID/locations/LOCATION/publishers/google/models",
avante.setup({
    -- auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
    mappings = {
        ask = "<leader>g", -- ask
        edit = "<nop>",    -- edit
        refresh = "<nop>", -- refresh
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
        },
    },
    hints = { enabled = true },
    windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right",   -- the position of the sidebar
        wrap = true,          -- similar to vim.o.wrap
        width = 30,           -- default % based on available width
        sidebar_header = {
            enabled = true,   -- true, false to enable/disable the header
            align = "center", -- left, center, right for title
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8, -- Height of the input window in vertical layout
        },
        edit = {
            border = "rounded",
            start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
            floating = false,    -- Open the 'AvanteAsk' prompt in a floating window
            start_insert = true, -- Start insert mode when opening the ask window
            border = "rounded",
            ---@type "ours" | "theirs"
            focus_on_apply = "ours", -- which diff to focus after applying
        },
    },
    highlights = {
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
    },

    provider = "league_vertexai",
    vendors = {
        ["league_vertexai"] = {
            endpoint =
            "https://us-central1-aiplatform.googleapis.com/v1/projects/league-internal-genai/locations/us-central1/publishers/google/models",
            model = "gemini-1.5-flash-002",
            api_key_name = "cmd:gcloud auth print-access-token", -- requires gcloud CLI to fetch access token on the fly.
            parse_curl_args = function(opts, code_opts)
                body_opts = vim.tbl_deep_extend("force", {}, {
                    generationConfig = {
                        temperature = 0,
                        maxOutputTokens = 4096,
                    },
                })

                return {
                    url = opts.endpoint .. "/" .. opts.model .. ":streamGenerateContent?alt=sse",
                    headers = {
                        ["Authorization"] = "Bearer " .. opts.parse_api_key(api_key_name),
                        ["Content-Type"] = "application/json; charset=utf-8",
                    },
                    body = vim.tbl_deep_extend(
                        "force",
                        {},
                        gemini_provider.parse_messages(code_opts),
                        body_opts
                    ),
                }
            end,
            parse_response_data = function(data_stream, event_state, opts)
                gemini_provider.parse_response(data_stream, event_state, opts)
            end,
        },
    }


})
