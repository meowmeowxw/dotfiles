call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': './install.sh'}
Plug 'mhinz/vim-startify'
	let g:startify_bookmarks = [{'c': '~/.config/nvim/init.vim'},
				\ {'f': '~/.config/fish/config.fish'},
				\ {'z': '~/.zshrc'}]
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
    map <space>n :NERDTreeToggle<CR>
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && 
                \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | 
                \ exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && 
                \ b:NERDTree.isTabTree()) | q | endif
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    autocmd FileType python map <F2> :Semshi rename
Plug 'meowmeowxw/eleline.vim'
	let g:airline_powerline_fonts = 1
Plug 'tpope/vim-fugitive'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
    let g:gruvbox_material_background = 'medium'
Plug 'liuchengxu/vista.vim'
	let g:vista#renderer#enable_icon = 0
Plug 'meowmeowxw/onedark.vim'
    let g:onedark_terminal_italics = 1
Plug 'petRUShka/vim-sage'
Plug 'daeyun/vim-matlab'
Plug 'sainnhe/sonokai'
    let g:sonokai_style = 'atlantis'
    let g:sonokay_enable_italic = 1
Plug 'sainnhe/edge'
    let g:edge_style = 'neon'
Plug 'rhysd/vim-grammarous'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
"    let g:multi_cursor_exit_from_insert_mode = 1
"    let g:multi_cursor_exit_from_visual_mode = 1
" Maybe this is a better multi cursors but I need to test it
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'liuchengxu/vim-clap'
    map <space>b :Clap buffers<CR>
    map <space>c :Clap colors<CR>
    map <space>e :Clap filer<CR>
    map <space>f :Clap files<CR>
    map <space>g :Clap grep<CR>
    map <space>j :Clap jumps<CR>
    map <space>m :Clap marks<CR>
    map <space>p :Clap providers<CR>
    map <space>t :Clap tags<CR>
    map <space>w :Clap windows<CR>
    map <space>y :Clap yanks<CR>
    map <space>p :Clap proj_tags<CR>
Plug 'liuchengxu/space-vim-theme'
Plug 'rhysd/vim-grammarous'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'matze/vim-move'
"Plug 'hardcoreplayers/spaceline.vim'
"    let g:spaceline_seperate_style = 'arrow'

call plug#end()

" Nvim behaviour
" let mapleader = " "
syntax on
filetype plugin on
set background=dark
set termguicolors
colorscheme gruvbox-material
set hls!
set laststatus=2
set tabstop=4
set smartindent
"set cindent
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
set splitbelow
set splitright
set noshowmode
set scrolloff=5
set cursorline
set colorcolumn=80
set nofoldenable
set number relativenumber
"
" Custom Shortcuts
nmap <F8> :Vista!!<CR>
map <C-K> :5winc +<CR>
map <C-J> :5winc -<CR>
map <C-H> :5winc ><CR>
map <C-L> :5winc <<CR>
map <A-M> :%norm.<CR>
map D d$
map Y y$
"map <C-T> :vsplit term://zsh<CR>
nmap gD gdcgn
nmap <space>v :vsplit term://zsh<CR>
nmap <space>x :split term://zsh<CR>
nmap <space>s $]}V[{
nmap <space>S V[{
nmap ]t :tabn<CR>
nmap [t :tabp<CR>
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>r :g/^\s*$/d<CR>
nnoremap <Leader>k :Man<CR>
tnoremap <Esc> <C-\><C-n>
"
" Properties for terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd StdinReadPre * let s:std_in=1
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
    hi semshiImported gui=bold
    hi semshiUnresolved guifg=#f25445 gui=bold
    hi semshiBuiltin guifg=#f49f02
endfunction

if &background ==# 'light'
    autocmd FileType python call SemshiLight()
elseif &background ==# 'dark'
    autocmd FileType python call SemshiDark()
endif
"
" Template for different files type
autocmd BufNewFile *.c r $HOME/.config/nvim/templates/t.c
"

" CoC config
let g:coc_global_extensions = [
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-json',
            \ 'coc-git'
            \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
augroup documentation_mapping
    autocmd!
    autocmd FileType python,java,js nnoremap <silent> K :call <SID>show_documentation()<CR>
augroup END

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>cl  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>
" Automatic new line when enter is pressed after brackets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Startify bookmark

