" This file have the plugins configuration

" Using vim-plug
call plug#begin("~/.vim/plugged")

" Autocompletacion
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Work with Python
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}

"Plug 'vim-scripts/AutoComplPop'

"Plug 'preservim/tagbar'

" Close brackets and more
Plug 'jiangmiao/auto-pairs'

" This plugin is for resaltado of syntax
Plug 'sheerun/vim-polyglot'

" Syntactic analysis
Plug 'scrooloose/syntastic'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Find files
Plug 'ctrlpvim/ctrlp.vim'

" Run test
"Plug 'janko-m/vim-test', {'for': ['python']}
"Plug 'tpope/vim-dispatch'

" Code snippets
Plug 'SirVer/ultisnips', {'for': ['sh', 'python', 'markdown']}
Plug 'honza/vim-snippets', {'for': ['sh', 'python', 'markdown']}
Plug 'ervandew/supertab'

" File browser
" Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Change cursor in Insert and Replace
Plug 'wincent/terminus'

" Color Scheme
Plug 'chriskempson/base16-vim'

" Code comenter
Plug 'scrooloose/nerdcommenter'

" You complete me server
" Plug 'Valloric/YouCompleteMe'

" Better motion
" Plug 'easymotion/vim-easymotion'

" Code and file fuzzy finder
"Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do': './install --all'}
"Plug 'junegunn/fzf.vim'

" Ack code search (requires ack or ag installed in teh system)
" este plugin quizas nos dara error por que hay que instalar este programa de terminal
"Plug 'mileszs/ack.vim'

" Git integartion
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" Surround
"Plug 'tpope/vim-surround'

" Override configs by directory
" We can create a .vim.custom file in the directory you want to 
" customize
"Plug 'arielrossanigo/dir-configs-override.vim'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/emmet-vim'

call plug#end()

" ====================================
" Plugins configuration
" ====================================

"" Airline ---------------------------------------
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
""" aki podemos poder los simbolos que queremos que muestre, creo que esta mala asi posiblemente dara algun error
""" si da algun error, buscamos en la web esta configuracion
"let g:airline_symbols.branch = '/'
"let g:airline_symbols.paste = 'p'
"let g:airline_symbols.whitespace = '||'

" Syntastic ------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_python_flake8_post_args='--ignore=E501,D100,D101,D102,D103'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Vim tests ------------------------------------
"let g:test#strategy = "vimterminal"

"nmap <silent> <leader>rt :TestNearest<CR>
"nmap <silent> <leader>rT :TestFile<CR>
"nmap <silent> <leader>ra :TestSuite<CR>
"nmap <silent> <leader>rl :TestLast<CR>
"nmap <silent> <leader>rg :TestVisit<CR>

" Execute this command for install the indent line plugin in vim
"git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
"vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"


" Indent Lines Configuration
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '|'
let g:indentLine_defaultGroup = 'SpecialKey'

" Python Mode Settings
let g:ycm_show_diagnostics_ui = 0

" for that coc not show a message in error case
let g:coc_disable_startup_warning = 1


" Jedi vim configuration
"let g:jedi#auto_initialization = 0
"let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0

autocmd FileType python setlocal completeopt-=preview
