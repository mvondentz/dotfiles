local present, mason = pcall(require, "mason")
if present then
    mason.setup()
end

local present, mason_lspconfig = pcall(require, "mason-lspconfig")
if present then
    mason_lspconfig.setup()
end
