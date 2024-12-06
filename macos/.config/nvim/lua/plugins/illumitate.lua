return {
    'RRethy/vim-illuminate',
    config = function()
        vim.cmd([[
            highlight IlluminatedWordText guibg=#333333 gui=none
            highlight IlluminatedWordRead guibg=#333333 gui=none
            highlight IlluminatedWordWrite guibg=#444444 gui=none
        ]])
    end,
}
