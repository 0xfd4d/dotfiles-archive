set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'fidian/hexmode'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
" Plug 'xero/blaquemagick.vim'
Plug 'ap/vim-buftabline'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-readdir'
Plug 'ap/vim-css-color'
Plug 'wellle/tmux-complete.vim'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'icymind/NeoSolarized'
Plug 'ferranpm/vim-mapcolor'
Plug 'thaerkh/vim-workspace'
Plug 'pbrisbin/vim-mkdir'
" Plug 'roxma/vim-tmux-clipboard'
Plug 'arcticicestudio/nord-vim'

call plug#end()

filetype indent plugin on
filetype plugin on
syntax on

set autoindent
set backspace=indent,eol,start
set clipboard+=unnamedplus
set complete-=i
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set list
set listchars=tab:\¦\ ,trail:·,nbsp:░
set mouse=
set nobackup
set noswapfile
set number
set path+=**
set relativenumber
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set tabstop=4
set undodir=~/.local/share/nvim/undodir
set undofile
set wildignore=*/vendor/*,*/.git/*,*/cache/*
set wildmenu
set hidden

let g:tar_cmd= "bsdtar"

let g:loaded_netrwPlugin = 1

let g:workspace_autosave = 0

au BufNewFile,BufRead *Pkgfile set filetype=sh

" space bar un-highlights search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

noremap <silent> <F2> :edit .<CR>

" sort words in line
vnoremap <F3> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" 'fuzzy' find
nmap <C-P> :find 

" buffer naviagation
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>

" avoid Escape
imap ` <Esc>

if exists("+undofile")
	if isdirectory($HOME . '/.local/share/nvim/undodir') == 0
		:silent !mkdir -p ~/.local/share/nvim/undodir > /dev/null 2>&1
	endif
endif

" for prefix in ['i', 'n', 'v']
" 	for key in ['<Del>', '<Down>', '<End>', '<Home>', '<Left>', '<PageDown>', '<PageUp>', '<Right>', '<Up>']
" 		exe prefix . "noremap " . key . " <Nop>"
" 	endfor
" endfor

set background=dark
colorscheme nord

highlight OverLength term=NONE cterm=NONE ctermfg=0 ctermbg=1
match OverLength /\%81v.*/

" prevent default plugins from load
function s:stockless()
	let g:real_rtp = &runtimepath
	set rtp-=$VIMRUNTIME
	if &rtp == g:real_rtp | unlet g:real_rtp | return | endif
	" if Vim goes to source anything else whatsoever, fix &runtimepath first
	augroup Stockless
	autocmd SourcePre * let &runtimepath = remove(g:,'real_rtp') | exe 'autocmd! Stockless' | exe 'augroup! Stockless'
	augroup END
endfunc

call s:stockless()
