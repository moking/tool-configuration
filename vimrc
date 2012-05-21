syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=0
set cindent 
set autoindent 
imap <c-z> <esc>:undo<cr>i
nmap wl <C-w>l
nmap wh <c-w>h
nmap wj <c-w>j
nmap wk <c-w>k
nmap w> <c-w>>
nmap w< <c-w><
nmap w+ <c-w>+
nmap w- <c-w>-
nmap <enter> <C-]>
nmap <space> <C-t>

nmap <right> :bn<cr>
nmap <left> :bp<cr>

"imap <left> <esc><left>
"imap <right> <esc><right>

set fdm=syntax
color asmanian2
nmap <tab> ==
nmap . :

filetype plugin indent on 
set completeopt=longest,menu 
set nocp
filetype plugin on 
set guicursor+=i:ver30-iCursor
let g:SuperTabDefaultCompletionType = "<c-n>"
highlight Pmenu ctermbg=9 guibg=brown gui=bold
highlight PmenuSel ctermbg=4
set cursorline
highlight CursorLine ctermfg=green
set statusline+=%f
"always display statusline
set laststatus=2
