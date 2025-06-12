" Others file of the configuration

set encoding=utf-8

" Vim plug initialization
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')

if !filereadable(vim_plug_path)
  echo "Installing Vim-plug..."
  echo ""

  silent !mkdir -p ~/.vim/autoload
  " si no funciona o da un error hay que cambiar https://raw.githubusercontent.com/"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let vim_plug_just_installed = 1

endif

" manally load vim-plug the first time
if vim_plug_just_installed
  :execute 'source' .fnamespace(vim_plug_path)

endif


if vim_plug_just_installed
  echo "Installing Bundles, please ignore key map error messages"
  :PlugInstall

endif


" Source files for plugins and mapping
" so ~/.vim/plugins.vim
so ~/.vim/maps.vim

call plug#begin()
" Autocompletacion
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Work with Python
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}

" Autocomplete
Plug 'jiangmiao/auto-pairs'

" Code snippets
Plug 'SirVer/ultisnips', {'for': ['sh', 'python', 'markdown','javascript']}
Plug 'honza/vim-snippets', {'for': ['sh', 'python', 'markdown', 'javascript']}
Plug 'ervandew/supertab'

" Color Scheme
Plug 'chriskempson/base16-vim'

" Emmet for HMTL
Plug 'mattn/emmet-vim'

" Code comenter
Plug 'scrooloose/nerdcommenter'

" Color Schemes
Plug 'chriskempson/base16-vim'

" Change cursor in Insert and Replace
Plug 'wincent/terminus'


call plug#end()

" No vi compatible
set nocompatible

" Allow plugins by file type (rquire for plugins!)
filetype plugin on
filetype indent on

set hidden

" Always show status bar
set ls=2

" Highlighted searh results
set hlsearch

" No wrap to use
set wrap

" Clipboard for the system
set clipboard=unnamedplus

" No swap file when editing
set noswapfile

set showcmd
set noerrorbells
set updatetime=300

" Syntax highlight on
syntax on

" swap, backup and undo file
"set directory=~/.vim/dirs/tmp " folder for swap files
"set backup                    " make backup files
"set backupdir=~/.vim/dirs/backups " folder for backup files
"set undofile                  " presistent undos - undo after you are open the file
"set undodir=!~/.vim/dirs/undos
"set viminfo+=n~/.vim/dirs/viminfo " if you exit vim and later start, vim remembers information like, command line history and searchs..."

"" create nedded directories if they don't exist
"if !isdirectory(&backupdir)
  "call mkdir(&backupdir, 'p')

"endif

"if !isdirectory(&directory)
  "call mkdir(&directory, 'p')

"endif


"if !isdirectory(&undodir)
  "call mkdir(&undodir, 'p')

"endif

" Tabs and spaces handling
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Show Numbers and Ruler
set ruler
set number
" set relativenumber

" show tabs , col and spaces
"set list
" chars to use to show the tabs, col and spaces
" i don't know to use
" set listchars=tab:*\ ,eol:~, trail:~-

" Show rule in column 100
set colorcolumn=100

" How to split windows
set splitbelow
set splitright

au VimResized *:wincmd = " resize split when windows are reduce

" Show cursor line
set mouse=a
set cursorline

" For best find files
autocmd FileType netrw setl bufhidden=delete
set path+=**

" Best menu
set wildmenu


augroup cline
  " delete any old autocmd
  au!
  " remove cursor line on Windows leave and when on insert mode
  au WinLeave,InsertEnter * set nocursorline
  " show cursor line on window enter or when exit from insert mode
  au WinEnter,InsertLeave * set cursorline
augroup END

set background=dark
"colorscheme base16-tomorrow-night
"colorscheme base16-apathy
"colorscheme base16-harmonic-dark
"colorscheme desert
"colorscheme base16-atelier-seaside
"colorscheme base16-oceanicnext
"colorscheme base16-gruvbox-dark-hard
"colorscheme base16-monaki
"colorscheme base16-irblack
colorscheme base16-monokai

" Use 256 colors when possible
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" When scrolling, keep cursor 5 lines away from screen border
set scrolloff=8

" Search
set incsearch " incremental search"
set ignorecase
set autoindent
set smartcase

