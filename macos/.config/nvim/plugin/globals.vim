" Global Sets 

set ttyfast          " Fast rendering
set lazyredraw
syntax on            " Enable syntax highlight
set guicursor=       " Bold cursor
set nu               " Enable line numbers
set relativenumber   " Enable relative line numbers
"set nohlsearch       " Don't highlight searchs
set noerrorbells     " No Bells!
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set expandtab
set nowrap
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=10     " Minimum number of lines to keep above and below the cursor
set colorcolumn=120  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set showcmd
set shell=fish
set cmdheight=3      " Give more space for displaying messages
set updatetime=50   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set noswapfile       " No swap files
set undodir=~/.vim/undodir
set undofile
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set autowrite        "
set mouse=a          " Enable mouse support
set ai               " auto ident
set si               " smart ident
set inccommand=split
set clipboard=unnamedplus "macos copy
set shiftround

filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

