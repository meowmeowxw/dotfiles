call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': './install.sh'}
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
	map <C-N> :NERDTreeToggle<CR>
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && 
	\ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | 
	\ exe 'cd '.argv()[0] | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && 
	\ b:NERDTree.isTabTree()) | q | endif
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'liuchengxu/eleline.vim'
	let g:airline_powerline_fonts = 1
Plug 'tpope/vim-fugitive'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'liuchengxu/vista.vim'
	let g:vista#renderer#enable_icon = 1
Plug 'Yggdroot/indentLine'
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    let g:indentLine_setColors = 0
Plug 'justinmk/vim-syntax-extra/'

call plug#end()

" Nvim behaviour
syntax on
filetype plugin on
set background=dark
set termguicolors
let g:gruvbox_material_background='medium'
colorscheme gruvbox-material
set hls!
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set splitbelow
set splitright
set noshowmode
set cursorline
set colorcolumn=80
set number relativenumber
"
" Custom Shortcuts
map <F6> :tabp<CR>
map <F7> :tabn<CR>
nmap <F8> :Vista!!<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc ><CR>
map <C-L> :5winc <<CR>
map <C-T> :vsplit term://zsh<CR>
map D d$
map Y y$
"map <C-F> :pyf /usr/share/clang/clang-format.py<CR>
"imap <C-F> <c-o>:pyf /usr/share/clang/clang-format.py<CR>
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>r :g/^\s*$/d<CR>
tnoremap <Esc> <C-\><C-n>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"
" Tricks
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd StdinReadPre * let s:std_in=1
"augroup project
"	autocmd!
"    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END
"
" Relative line numbers in normal mode, absolute line numbers in insert mode
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
"
" Adjusts colors in semshi for python
function SemshiLight()
	hi semshiImported guifg=#e06411
	hi semshiSelf guifg=#33990a
	hi semshiAttribute guifg=#770a99
	hi semshiParameter guifg=#1b4eba
	hi semshiParameterUnused guifg=#a82678
	hi semshiGlobal guifg=#d8671c
	hi semshiBuiltin guifg=#d31fd3
	hi semshiFree guifg=#c44082
	hi semshiSelected guifg=#3d3d38 guibg=#f2f076
	hi semshiUnresolved guifg=#dd7418
endfunction

function SemshiDark()
	hi semshiAttribute guifg=#40f972
	hi semshiSelected guifg=#c1c1c1 guibg=#333333
endfunction

if &background ==# 'light'
	autocmd FileType python call SemshiLight()
elseif &background ==# 'dark'
	autocmd FileType python call SemshiDark()
endif
"
" Template for different files type
autocmd BufNewFile *.c r $HOME/.config/nvim/templates/t.c
autocmd BufNewFile *.py r $HOME/.config/nvim/templates/t.py
autocmd BufNewFile *.sh r $HOME/.config/nvim/templates/t.sh
"
