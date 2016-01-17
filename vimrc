execute pathogen#infect()

if exists('$DISPLAY')
    colorscheme gotham
endif

let g:netrw_dirhistmax = 0

syntax enable

set nocompatible
set t_Co=256
set laststatus=2
set showcmd
set showmode
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set tags=tags
set softtabstop=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set ignorecase
set smartcase
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell
set noerrorbells
set autowrite
set mouse=a

set directory=/tmp

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
