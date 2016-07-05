filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'w0ng/vim-hybrid'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()

syntax on
filetype plugin on
filetype indent on

set mouse=a
set laststatus=2
set showcmd
set showmode
set expandtab
set smarttab
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set ignorecase
set smartcase
set nobackup
set noswapfile
set undofile
set undolevels=500

set tabstop=4
set shiftwidth=4
set softtabstop=4

set scrolloff=10

set clipboard+=unnamedplus

set hlsearch 
set incsearch
set ignorecase
set smartcase

set shortmess=I

set wildmode=longest,list,full
set wildmenu

if exists("+undofile")
  if isdirectory($HOME . '/.config/nvim/undodir') == 0
    :silent !mkdir -p ~/.config/nvim/undodir > /dev/null 2>&1
  endif
endif

set undodir=~/.config/nvim/undodir

let g:neocomplete#enable_at_startup = 1

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'find %s -type f'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:go_list_type = "quickfix"

let g:deoplete#enable_at_startup = 1

map <F2> :Explore<CR>

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 0 
colorscheme hybrid
