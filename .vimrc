filetype off

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'w0ng/vim-hybrid'
Plug 'sheerun/vim-polyglot'
Plug 'lumiliet/vim-twig'
Plug 'fatih/vim-go'
Plug 'Shougo/neocomplete.vim'
Plug 'StanAngeloff/php.vim'

call plug#end()

syntax on
filetype plugin on
filetype indent on

set laststatus=2
set showcmd
set showmode
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
set expandtab

set listchars=tab:\¦\ ,trail:·,nbsp:░
set list

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmode=longest,list
set wildmenu

set mouse=a

set clipboard=unnamedplus

function! ReadOnly()
if &readonly || !&modifiable
    return '!'
else
    return ''
endfunction

if exists("+undofile")
    if isdirectory($HOME . '/.vim/undodir') == 0
        :silent !mkdir -p ~/.vim/undodir > /dev/null 2>&1
    endif
endif

set undodir=~/.vim/undodir

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_comletion_start_length = 1

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'find %s -type f'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_c_check_header = 1
" let g:syntastic_c_auto_refresh_includes = 1

let g:go_list_type = "quickfix"

map <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>

map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>

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

" Hightlight whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

hi StatusLine ctermfg=7 ctermbg=0
hi StatusLineNC ctermfg=0 ctermbg=7

hi LineNr ctermfg=grey ctermbg=NONE

hi Visual ctermfg=0 ctermbg=7

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
