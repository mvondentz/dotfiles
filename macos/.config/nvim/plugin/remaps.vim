
let mapleader = ";"

" esc to exit terminal
tnoremap <Esc> <C-\><C-n>

" amazing yank to keep cursor
vmap y ygv<Esc>

" New Line
nmap <leader>a o<Esc>
nmap <leader>A O<Esc>

" Nerdtree ----
nnoremap <silent> <expr> <leader>fe g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeShowHidden=1

" Buffers navigation
map <leader>n :bn<cr>
map <leader>b :bp<cr>

map <leader>ds :bp\|bd #<cr>
map <leader>dd :bd<cr>
map <leader>df :bd!<cr>
command BufOnly silent! execute "%bd|e#|bd#"
map <leader>da :BufOnly<cr>

" Format json
command JsonFormat execute "%!jq"

" Git remaps
nnoremap <leader>ij :<C-u>call gitblame#echo()<CR>
nnoremap <leader>in <Plug>(GitGutterNextHunk)
nnoremap <leader>ib <Plug>(GitGutterPrevHunk)
nnoremap <leader>ip <Plug>(GitGutterPreviewHunk)

" Rezise maps
nnoremap + :res +5<CR>
nnoremap _ :res -5<CR>
nnoremap > :vertical resize +5<CR>
nnoremap < :vertical resize -5<CR>

" vim navigation while in insert mode
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-k> <up>
inoremap <c-l> <right>

" Integration tests
au FileType go nnoremap <leader>ht :sp<bar>terminal t %:p
" Local tests with cse,integration build tags
au FileType go nnoremap <leader>hr :sp<bar>terminal r %:p:h

" Centralize while navigating
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
nnoremap n nzzzv

" DAP
au FileType go nnoremap <Leader>ha :DapToggleBreakpoint <CR>
au FileType go nnoremap <Leader>hc :DapContinue <CR>
au FileType go nnoremap <Leader>ho :DapStepOut <CR>
au FileType go nnoremap <Leader>hn :DapStepOver <CR>
au FileType go nnoremap <Leader>hi :DapStepIn <CR>
au FileType go nnoremap <Leader>hq :DapTerminate <CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>fr <cmd>Telescope mru<cr>
nnoremap <leader>ft <cmd>Telescope dap configurations<cr>

