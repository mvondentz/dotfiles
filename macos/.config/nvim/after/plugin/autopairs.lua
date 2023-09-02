local present, pairs = pcall(require, "nvim-autopairs")
if not present then
    return
end


pairs.setup({ })

