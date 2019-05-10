execute pathogen#infect()
call pathogen#helptags()
set termguicolors 
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") &&
	\ b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * lcd %:p:h
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_mirage'
let ayucolor="dark" 
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2
colorscheme ayu
set number
set wildmenu
set laststatus=2
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set colorcolumn=80
"set colorcolumn on gui
highlight ColorColumn guibg=SlateBlue
"set colorcolumn on terminal
"highlight ColorColumn ctermbg=7
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR>
map <F6> :tabp<CR>
map <F7> :tabn<CR>
nmap <F8> :TagbarToggle<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc <<CR>
map <C-L> :5winc ><CR>
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
nnoremap Y y$
nnoremap <Leader>c :set cursorline!<CR>
