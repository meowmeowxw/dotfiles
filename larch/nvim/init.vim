call plug#begin('~/.local/share/nvim/plugged')

Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'do': './install.sh'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

let g:lightline = {
		\ 'colorscheme': 'one',
		\ 'active': {
		\	'right': [ [ 'length' ],
		\				[ 'percent', 'lineinfo' ],
		\				[ 'info', 'fileformat', 'fileencoding', 'filetype' ] ],
		\	'left': [ [ 'mode', 'paste' ],
		\			  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		\ },
		\ 'component_function' : {
		\	'filetype': 'LightlineFiletype',
		\	'gitbranch': 'LightlineGitbranch'
		\ },
       	\ 'component': {
		\	'readonly': '%{&readonly?" ":""}',
		\	'info' : ' arch  ',
		\	'fileformat' : '%{&fileformat}  ',
		\	'length' : '%{&lines}  ',
		\	'fileencoding' : '%{&fileencoding}  '
		\ },
	    \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' },
		\ }

function! LightlineGitbranch()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
		let _ = fugitive#head()
		return strlen(_) ? ' '._ : ''
	endif
	return ''
endfunction

function! LightlineFiletype()
  return &filetype ==# 'python' ? 'python  ' : 
		\ &filetype ==# 'c.doxygen' ? 'C  ' : 
		\ &filetype ==# 'c' ? 'c  ' : 
		\ &filetype ==# 'cpp' ? 'cpp  ' : 
		\ &filetype ==# 'go' ? 'go  ' : 
		\ &filetype ==# 'html' ? 'html  ' : 
		\ &filetype ==# 'javascript' ? 'javascript  ' : 
		\ &filetype ==# 'php' ? 'php  ' : 
		\ &filetype ==# 'vim' ? 'vim  ' : 
		\ &filetype
endfunction
"let g:airline_section_y = 'utf-8 arch  ' 
"let g:airline_theme = 'deus'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
set termguicolors
colorscheme material-theme
let g:terminal_color_1 = '#282828'
let g:terminal_color_2 = '#e14245'
let g:terminal_color_3 = '#55ba79'
let g:terminal_color_4 = '#f67400'
let g:terminal_color_5 = '#4285f4'
let g:terminal_color_6 = '#9b59b6'
let g:terminal_color_7 = '#1abc9c'

set hls!
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
set splitbelow
set splitright
map <F6> :tabp<CR>
map <F7> :tabn<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc <<CR>
map <C-L> :5winc ><CR>
map <C-T> :split term://zsh<CR>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
tnoremap <Esc> <C-\><C-n>
augroup project
	autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
function! YRRunAfterMaps()
	nnoremap Y	:<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$

