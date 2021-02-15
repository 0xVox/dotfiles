set exrc
set guicursor=
set relativenumber
set nu 
set nohlsearch
set hidden
set noerrorbells
set nowrap
set ignorecase
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set cmdheight=2

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'miyakogi/seiya.vim'
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
call plug#end()

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_invert_tabling = 1
let g:gruvbox_transparent_bg=1
set background=dark 
colorscheme gruvbox
highlight Normal guibg=none

