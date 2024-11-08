local present, notify = pcall(require, "notify")
if not present then
    return
end

notify.setup(
    {
        background_colour = "#000000",
        fps = 50,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = ""
        },
        level = 2,
        minimum_width = 50,
        -- render = "wrapped-compact",
        render = "default",
        -- stages = "fade_in_slide_out",
        stages = "slide",
        timeout = 650,
        top_down = false
    }
)

vim.notify = notify
