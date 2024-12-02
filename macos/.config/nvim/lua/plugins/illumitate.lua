return {
    'RRethy/vim-illuminate',
    config = function()
        vim.cmd([[
            highlight IlluminatedWordText guibg=#333333 gui=bold
            highlight IlluminatedWordRead guibg=#333333 gui=bold
            highlight IlluminatedWordWrite guibg=#444444 gui=bold
        ]])
    end,
}
