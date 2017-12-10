set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'fidian/hexmode'
Plug 'tpope/vim-sleuth'
Plug 'xero/blaquemagick.vim'

call plug#end()

filetype indent plugin on
syntax on

set autoindent
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set complete-=i
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set lazyredraw
set lazyredraw
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
set showmatch
set showmode
set smartcase
set softtabstop=4
set tabstop=4
set ttyfast
set undodir=~/.vim/undodir
set undofile
set wildignore=*/vendor/*,*/.git/*,*/cache/*
set wildmenu

au BufNewFile,BufRead *Pkgfile set filetype=sh

" Show highlighting groups for current word
" nmap <C-S-P> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"	if !exists("*synstack")
"	  return
"	endif
"	echo map(synstack(line('.'), col('.')), 
"	\		'synIDattr(v:val, "name")')
" endfunc

" space bar un-highlights search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

noremap <silent> <F2> :Explore<CR>

" sort words in line
vnoremap <F3> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" 'fuzzy' find
nmap <C-P> :find 

if exists("+undofile")
	if isdirectory($HOME . '/.vim/undodir') == 0
		:silent !mkdir -p ~/.vim/undodir > /dev/null 2>&1
	endif
endif

for prefix in ['i', 'n', 'v']
	for key in ['<Del>', '<Down>', '<End>', '<Home>', '<Left>', '<PageDown>', '<PageUp>', '<Right>', '<Up>']
		exe prefix . "noremap " . key . " <Nop>"
	endfor
endfor

colorscheme blaquemagick

highlight OverLength   term=NONE cterm=NONE ctermfg=0	 ctermbg=1
match OverLength /\%81v.*/
