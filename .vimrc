" 'Sets'
set spell
set ruler
set title
set laststatus=0
set mouse=a
set nohlsearch
set cursorline
set number
set nocompatible
set encoding=utf-8
" Others
filetype plugin on
syntax on

" Key binds
" Speed jumping
nnoremap H <S-Left>
nnoremap L <S-Right>
nnoremap J 10j
nnoremap K 10k

"Plugins
call plug#begin()

	Plug 'vimwiki/vimwiki'
	Plug 'dylanaraps/wal.vim'

call plug#end()

colorscheme wal

"I beam
let &t_SI = "\<Esc>[6 q" 
let &t_EI = "\<Esc>[2 q"
let &t_SR = "\<Esc>[4 q"

" Vim Wiki
let g:vimwiki_list = [{'path': '~/dox/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
