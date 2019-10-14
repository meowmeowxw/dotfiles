call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'drewtempelmeyer/palenight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'

call plug#end()

let g:lightline = {
		\ 'colorscheme': 'palenight',
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
			return strlen(_) ? ' '._.'  ' :
			\ 'no  motherfucker  '
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
		\ &filetype ==# 'markdown' ? 'markdown  ' : 
		\ &filetype ==# 'php' ? 'php  ' : 
		\ &filetype ==# 'vim' ? 'vim  ' : 
		\ &filetype ==# 'rust' ? 'rust  ' : 
		\ &filetype ==# 'haskell' ? 'haskell  ' : 
		\ &filetype ==# 'cs' ? 'csharp  ' : 
		\ &filetype ==# 'ruby' ? 'ruby ' :
		\ &filetype ==# 'java' ? 'java  ' :
		\ &filetype ==# 'text' ? 'text  ' : 
		\ &filetype ==# 'tex' ? 'tex  ' : 
		\ &filetype
endfunction

set termguicolors
set background=dark
colorscheme gruvbox
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
set splitbelow
set splitright
set noshowmode
map <F6> :tabp<CR>
map <F7> :tabn<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc <<CR>
map <C-L> :5winc ><CR>
map <C-N> :NERDTreeToggle<CR>
map <C-T> :terminal<CR>
nnoremap <Leader>c :set cursorline!<CR>
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
autocmd StdinReadPre * let s:std_in=1

