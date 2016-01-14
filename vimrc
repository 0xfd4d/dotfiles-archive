execute pathogen#infect()

syntax enable

let g:netrw_dirhistmax = 0

set laststatus=2
set number
set showcmd

set directory=/tmp

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set tabstop=4
set shiftwidth=4
set expandtab

let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = ''

