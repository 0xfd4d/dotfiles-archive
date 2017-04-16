filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'lumiliet/vim-twig'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'w0ng/vim-hybrid'

call plug#end()

syntax on
filetype plugin on
filetype indent on

set autoindent
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
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
set shiftround
set shiftwidth=4
set showcmd
set showmode
set smartcase
set softtabstop=4
set tabstop=4
set undofile
set wildmenu
set wildmode=longest,list

if exists("+undofile")
    if isdirectory($HOME . '/.config/nvim/undodir') == 0
        :silent !mkdir -p ~/.config/nvim/undodir > /dev/null 2>&1
    endif
endif

set undodir=~/.config/nvim/undodir

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_comletion_start_length = 1
let g:deoplete#omni_patterns = {}

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'find %s -type f'

" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%=\ %{SyntasticStatuslineFlag()}\ %P

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:go_list_type = "quickfix"

map <F2> :Explore<CR>

inoremap jk <ESC>

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

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set guifont=monospace\ 10

set t_Co=256
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 0
colorscheme hybrid

" hi StatusLine ctermfg=7 ctermbg=0
" hi StatusLineNC ctermfg=0 ctermbg=7
"
" hi LineNr ctermfg=grey ctermbg=NONE
"
" hi Visual ctermfg=0 ctermbg=7

hi TabLineFill ctermfg=0 ctermbg=1
hi TabLine ctermfg=0 ctermbg=7
hi TabLineSel cterm=NONE ctermfg=black ctermbg=7

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
