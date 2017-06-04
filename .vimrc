filetype off

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'lumiliet/vim-twig'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'arcticicestudio/nord-vim'
Plug 'wellle/tmux-complete.vim'

call plug#end()

syntax on
filetype plugin on
filetype indent on

set autoindent
set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed,unnamedplus
set complete-=i
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:\¦\ ,trail:·,nbsp:░
set mouse=a
set nobackup
set noswapfile
set number
set path+=**
set relativenumber
set shiftround
set shiftwidth=4
set showcmd
set showmode
set smartcase
set softtabstop=4
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set wildmenu

if exists("+undofile")
    if isdirectory($HOME . '/.vim/undodir') == 0
        :silent !mkdir -p ~/.vim/undodir > /dev/null 2>&1
    endif
endif

let g:netrw_banner=0
let g:netrw_bufsettings='nobl noma nomod nowrap number relativenumber ro'
let g:netrw_liststyle=1

let g:syntastic_always_populate_loc_list=1

let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

map <F2> :Explore<CR>

inoremap jj <ESC>

" space bar un-highlights search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" insert new line without entering insert mode
inoremap <S-Enter> <C-o>O
nnoremap <S-Enter> O<Esc>j
nnoremap <CR> o<Esc>k

" sort words in line
vnoremap <F3> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

set pastetoggle=<F4>
map <F5> :r! cat

imap jj <Esc>

for prefix in ['i', 'n', 'v']
    for key in ['<Del>', '<Down>', '<End>', '<Home>', '<Left>', '<PageDown>', '<PageUp>', '<Right>', '<Up>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set guifont=monospace\ 10

colorscheme nord

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
