"call pathogen#runtime_append_all_bundles()
call pathogen#infect('~/.vim/bundle/{}')
call pathogen#helptags()
"DOLOR
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Nul> <C-x><C-o>

" abre un .vimrc local del pwd acutal
:set exrc

"	generales
syntax on
set ruler	"show the line number on the bar"
set number
set relativenumber
set autoindent	"auto indent"
" mejor autocomple
set wildmode=longest,full
" cosas para C#
set completeopt=longest,menuone,preview
set previewheight=5
" let g:OmniSharp_server_type = 'roslyn'
" let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_server_stdio = 0
" let g:OmniSharp_server_path = "~/.omnisharp/omnisharp-roslyn/run"

"set nosmartindent
set tabstop=3 softtabstop=3 shiftwidth=3 noexpandtab
"set cursorline
set noerrorbells	"me quita el estres del bell"
set visualbell t_vb=
"set t_vb=
set tm=500
" esto es para que se marque lo que busque
set hlsearch incsearch
" linia roja en el caracter 80
set colorcolumn=80

let g:airline_theme='wombat'

let mapleader = "\<Space>"

"DEBUG
filetype indent on
set nocp
filetype plugin on

syntax on

let python_highlight_all = 1

set foldmethod=indent
set foldcolumn=1
set foldlevel=4

au FileType c setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType cs setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
au FileType cpp setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab

au FileType html setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType javascript setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
au FileType vue setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab
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
au FileType ruby setl shiftwidth=3 tabstop=3 softtabstop=3 noexpandtab

autocmd FileType python setlocal foldenable foldmethod=indent
au FileType python setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab
au FileType yaml setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab

"	backup
set backup
set backupdir=~/.vim_runtime/vim_backup

set undofile
set undodir=~/.vim_runtime/vim_undo

set formatprg=par\ -w79jeq

" personalisa los colores
set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set background=dark
colorscheme chlordane
" quitar el fondo negro y se vuelva trasparente
" no sirve por un plugin y al final era molesto
"hi Normal ctermbg=None
"hi NonText ctermbg=None

" mapeo de teclas
set pastetoggle=<F11>
" movimiento entre splits
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l
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
map <C-t> :tabnew <CR>
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

" zen es para espandir html
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
let g:jedi#use_splits_not_buffers = "winwidth"
let g:jedi#completions_enabled = 1
let g:jedi#documentation_command = "<leader>K"
let g:jedi#smart_auto_mappings = 0
let g:jedi#auto_close_doc = 1

" set completeopt-=preview
au CompleteDone * pclose

let ropevim_vim_completion=0
let ropevim_extended_complete=0


" mapa de claves
" tab activa el snippet
" ctrl+j se mueve al siguiente campo
" ctrl+k se mueve al anteriror campo
"UltiSnips#TrackChange
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-J>"
let g:UltiSnipsJumpBackwardTrigger="<c-K>"

"cuendo eites snippets se abrirar en un split vertical
let g:UltiSnipsEditSplit="vertical"

"se agrega que muestre los caracteres ocultor
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

nnoremap <Leader>l :set list!<Enter>


" libreria de c del paquete clang de archlinux
let g:clang_library_path='/usr/lib/libclang.so'
" Clang Complete Settings
let g:clang_use_library=1
" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options=' -std=c++11 || exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
let g:clang_auto_select=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'


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

nnoremap <leader>_$ :call Preserver( "%s/\\s\\+$//e" )<CR>
nnoremap <leader>ts :call Add_space()<CR>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_loc_list_height = 3

let g:syntastic_rst_checkers = [ "syntastic-rst-sphinx" ]

let NERDTreeIgnore = [ '\.pyc$', '^__pycache__$', '.meta' ]
let NERDTreeWinPos = "right"

nnoremap <leader>ev :tabnew $MYVIMRC<Enter>
nnoremap <leader>sv :source $MYVIMRC<Enter>
nnoremap <leader>ec :tabnew $XDG_CONFIG_HOME/chibi/chibi.py<Enter>
"toggle number
nnoremap <leader>nu :setlocal number!<Enter> 
"toggle relative number
nnoremap <leader>nr :setlocal relativenumber!<Enter>

inoremap jk <esc>
vnoremap jk <esc>
"inoremap <esc> <nop>
"
nmap <leader>m @@

"

"echom ">^.^<"

let g:flake8_quickfix_height=3
let g:flake8_show_quickfix=0

"autocmd BufWritePost *.py call Flake8()
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.hpp :%s/\s\+$//e

let g:PyUnitTestsStructure='nose'
let g:PyUnitTestPrefix=''
let g:PyUnitCmd='nosetests -q --with-machineout -l=ERROR'


nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yypVr=
nnoremap <leader>4 yypVr-
nnoremap <leader>5 yypVr^
nnoremap <leader>6 yypVr"


" Don't run pylint on every save
let g:pymode = 1
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_doc = 0
let g:pymode_doc_bind = ''
let g:pymode_folding = 1
let g:pymode_indent = 1
let g:pymode_lint = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore = ''
let g:pymode_lint_message = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_select = ''
let g:pymode_lint_signs = 1
let g:pymode_motion = 0
let g:pymode_options = 0
let g:pymode_paths = []
let g:pymode_quickfix_maxheight = 6
let g:pymode_quickfix_minheight = 3
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_run = 0
let g:pymode_run_bind = '<leader>r'
let g:pymode_trim_whitespaces = 1
let g:pymode_python = 'python3'
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_rope_module_to_package_bind = '<C-c>r1p'
let g:pymode_rope_use_function_bind = '<C-c>ru'


" emojis emojis everywhere
" set completefunc=emoji#complete

nnoremap <leader>se :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<enter>


iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu. Nulla non quam erat, luctus consequat nisi. Integer hendrerit lacus sagittis erat fermentum tincidunt. Cras vel dui neque. In sagittis commodo luctus. Mauris non metus dolor, ut suscipit dui. Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum. Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor


augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    " autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    " autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END


" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
" nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
" xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
" nnoremap <Leader>nm :OmniSharpRename<CR>
" nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
" nnoremap <Leader>ss :OmniSharpStartServer<CR>
" nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
" nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
