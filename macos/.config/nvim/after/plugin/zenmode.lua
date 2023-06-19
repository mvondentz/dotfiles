local present, zen = pcall(require, "zen-mode")
if not present then
    return
end

zen.setup {
    window = {
        width = .65,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}
