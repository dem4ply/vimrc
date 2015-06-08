"	generales
syntax on
set ruler	"show the line number on the bar"
set number
set autoindent	"auto indent"
set nosmartindent
set tabstop=3 softtabstop=3 shiftwidth=1 noexpandtab
"set cursorline
set noerrorbells	"me quita el estres del bell"
set visualbell t_vb=
"set t_vb=
set tm=500
" esto es para que se marque lo que busque
set hlsearch

filetype on
filetype indent on
set nocp
filetype plugin on

"	backup
set backup
set backupdir=~/.vim_runtime/vim_backup


" personalisa los colores
set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set background=dark
colorscheme chlordane

" mapeo de teclas
:set pastetoggle=<F11>
" movimiento entre splits
map <S-UP> <C-W><UP>
map <S-DOWN> <C-W><DOWN>
map <S-LEFT> <C-W><LEFT>
map <S-RIGHT> <C-W><RIGHT>

" cambiar el tamaño de split
map <S-C-UP> <C-W>-
map <S-C-DOWN> <C-W>+
map <S-C-LEFT> <C-W><
map <S-C-RIGHT> <C-W>>



" explorador de carpeta
map <F2> :NERDTreeToggle <cr>
" tag list
map <F3> :TlistToggle <cr>
" fuzzy file
map <F4> :FufFile <cr>
" pestañas
map  <C-t> :tabnew <CR>
" mapeo de los tags de c c++
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"map <F10> :set paste</F10> </cr><cr>
"map <F11> :set nopaste </F11></cr><cr>

" frame tag list
" tamaño minimo de tag list
let Tlist_WinWidth = 40
" poner el tag list a la derecha
let Tlist_Use_Right_Window = 1

let g:user_zen_settings = {
\  'indentation' : '\t',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

let g:user_zen_expandabbr_key = '<c-y>'

let g:use_zen_complete_tag = 1


set foldmethod=syntax
set foldcolumn=1
set foldlevel=4


function! JavaScriptFold() 
	setl foldmethod=syntax
	setl foldlevelstart=2
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
	return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen


set tabstop=3 softtabstop=3 shiftwidth=1 noexpandtab
