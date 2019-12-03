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
Plug 'drewtempelmeyer/palenight.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

" Nvim behaviour
set background=light
colorscheme gruvbox
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
set colorcolumn=80
"
" Custom Shortcuts
map <F6> :tabp<CR>
map <F7> :tabn<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc ><CR>
map <C-L> :5winc <<CR>
map <C-T> :vsplit term://zsh<CR>
map D d$
map Y y$
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>r :g/^\s*$/d<CR>
tnoremap <Esc> <C-\><C-n>

" Tricks
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd StdinReadPre * let s:std_in=1
augroup project
	autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

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
endfunction

function SemshiDark()
	hi semshiAttribute guifg=#40f972
endfunction

function! YRRunAfterMaps()
	nnoremap Y	:<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$

if &background ==# 'light'
	autocmd FileType python call SemshiLight()
elseif &background ==# 'dark'
	autocmd FileType python call SemshiDark()
endif
autocmd BufNewFile *.c r $HOME/.config/nvim/templates/t.c
autocmd BufNewFile *.py r $HOME/.config/nvim/templates/t.py
autocmd BufNewFile *.sh r $HOME/.config/nvim/templates/t.sh
let g:airline_powerline_fonts = 1

