"call pathogen#runtime_append_all_bundles()
call pathogen#infect('~/.vim/bundle/{}')
call pathogen#helptags()
"DOLOR
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"	generales
syntax on
set ruler	"show the line number on the bar"
set number
set autoindent	"auto indent"
"set nosmartindent
set tabstop=3 softtabstop=3 shiftwidth=3 noexpandtab
"set cursorline
set noerrorbells	"me quita el estres del bell"
set visualbell t_vb=
"set t_vb=
set tm=500
" esto es para que se marque lo que busque
set hlsearch
:set colorcolumn=80

let g:airline_theme='wombat'

let mapleader = "\<Space>"

"DEBUG
filetype indent on
set nocp
filetype plugin on

syntax on

let python_highlight_all = 1

set foldmethod=syntax
set foldcolumn=1
set foldlevel=4

au FileType c setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType cpp setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab

au FileType html setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType javascript setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType php setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType handlebars setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType objcpp setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType objcpp setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType objc setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType xml setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType cfml setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType cfscript setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType rst setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType sql setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType java setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab

autocmd FileType python setlocal foldenable foldmethod=syntax
au FileType python setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab

"	backup
set backup
set backupdir=~/.vim_runtime/vim_backup

set formatprg=par\ -w80jeq

" personalisa los colores
set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set background=dark
colorscheme chlordane
" quitar el fondo negro y se vuelva trasparente
hi Normal ctermbg=None
hi NonText ctermbg=None

" mapeo de teclas
:set pastetoggle=<F11>
" movimiento entre splits
map <C-k> <C-W><UP>
map <C-j> <C-W><DOWN>
map <C-h> <C-W><LEFT>
map <C-l> <C-W><RIGHT>

" cambiar el tamaño de split
"map <S-C-k> <C-W>-
"map <S-C-j> <C-W>+
"map <S-C-h> <C-W><
"map <S-C-l> <C-W>>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" explorador de carpeta
map <F2> :NERDTreeToggle <cr>
" tag list
map <F3> :TlistToggle <cr>
" fuzzy file
map <F4> :CtrlP <cr>
map <F6> :FufFile <cr>
" pestañas
map  <C-t> :tabnew <CR>
" mapeo de los tags de c c++
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" historias de undos
nnoremap <F5> :GundoToggle<CR>

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

function! JavaScriptFold() 
	setl foldmethod=syntax
	setl foldlevelstart=5
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
		return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen


"configuracion de jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#completions_enabled = 1


" mapa de claves
" tab activa el snippet
" ctrl+j se mueve al siguiente campo
" ctrl+k se mueve al anteriror campo
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-J>"
let g:UltiSnipsJumpBackwardTrigger="<c-K>"

"cuendo eites snippets se abrirar en un split vertical
let g:UltiSnipsEditSplit="vertical"

"se agrega que muestre los caracteres ocultor
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

nnoremap <Leader>l :set list!<Enter>



"agrega el espacio en los parentecis


function! Preserver( command )
	let _s = @/
	let l = line(".")
	let c = col(".")
	execute a:command
	let @/ = _s
	call cursor( l, c )
endfunction

function! Add_space()
	call Preserver("%s/\\v(\\()(\\w|\\(|')/\\1 \\2/g")
	call Preserver("%s/\\v(\\w|\\)|')(\\))/\\1 \\2/g")
endfunction

nmap <leader>_$ :call Preserver( "%s/\\s\\+$//e" )<CR>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
