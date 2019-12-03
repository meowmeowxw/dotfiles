" Set variables

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

