call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': './install.sh'}
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
	map <C-N> :NERDTreeToggle<CR>
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'drewtempelmeyer/palenight.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

"let g:lightline = {
"		\ 'colorscheme': 'palenight',
"		\ 'active': {
"		\	'right': [ [ 'percent', 'lineinfo' ],
"		\			   [ 'info' ],
"		\			   [ 'fileformat', 'fileencoding', 'filetype' ] ],
"		\	'left': [ [ 'mode', 'paste' ],
"		\			  [ 'currentfunction' ],
"		\			  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"		\ },
"		\ 'component_function' : {
"		\	'cocstatus': 'coc#status()'
"		\	'currentfunction': 'CocCurrentFunction'
"		\	'filetype': 'LightlineFiletype',
"		\	'gitbranch': 'LightlineGitbranch'
"		\ },
"       	\ 'component': {
"		\	'readonly': '%{&readonly?" ":""}',
"		\	'info' : ' arch  ',
"		\	'fileformat' : '%{&fileformat}  ',
"		\	'length' : '%{&lines}  ',
"		\	'fileencoding' : '%{&fileencoding}  '
"		\ },
"	    \ 'separator': { 'left': '', 'right': '' },
"        \ 'subseparator': { 'left': '', 'right': '' },
"		\ }
"
"function! LightlineGitbranch()
"  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
"		let _ = fugitive#head()
"			return strlen(_) ? ' '._.'  ' :
"			\ 'no  motherfucker  '
"	endif
"	return ''
"endfunction
"
"function! LightlineFiletype()
"  return &filetype ==# 'python' ? 'python  ' : 
"		\ &filetype ==# 'c.doxygen' ? 'C  ' : 
"		\ &filetype ==# 'c' ? 'c  ' : 
"		\ &filetype ==# 'cpp' ? 'cpp  ' : 
"		\ &filetype ==# 'go' ? 'go  ' : 
"		\ &filetype ==# 'html' ? 'html  ' : 
"		\ &filetype ==# 'javascript' ? 'javascript  ' : 
"		\ &filetype ==# 'markdown' ? 'markdown  ' : 
"		\ &filetype ==# 'php' ? 'php  ' : 
"		\ &filetype ==# 'vim' ? 'vim  ' : 
"		\ &filetype ==# 'rust' ? 'rust  ' : 
"		\ &filetype ==# 'haskell' ? 'haskell  ' : 
"		\ &filetype ==# 'cs' ? 'csharp  ' : 
"		\ &filetype ==# 'ruby' ? 'ruby ' :
"		\ &filetype ==# 'java' ? 'java  ' :
"		\ &filetype ==# 'text' ? 'text  ' : 
"		\ &filetype ==# 'tex' ? 'tex  ' : 
"		\ &filetype
"endfunction
"
"function! CocCurrentFunction()
"    return get(b:, 'coc_current_function', '')
"endfunction

"source $HOME/.config/nvim/statusline.vim

" Nvim behaviour
set background=dark
colorscheme space-theme
set termguicolors
set hls!
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
set splitbelow
set splitright
set noshowmode
set cursorline

" Custom Shortcuts
map <F6> :tabp<CR>
map <F7> :tabn<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc ><CR>
map <C-L> :5winc <<CR>
map <C-T> :split term://zsh<CR>
map D d$
map Y y$
nnoremap <Leader>c :set cursorline!<CR>
tnoremap <Esc> <C-\><C-n>

" Tricks
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd StdinReadPre * let s:std_in=1
augroup project
	autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"function! YRRunAfterMaps()
"	nnoremap Y	:<C-U>YRYankCount 'y$'<CR>
"endfunction
"nnoremap Y y$

" Set variables
let g:airline_powerline_fonts = 1
