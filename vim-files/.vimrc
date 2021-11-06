"Others file of the configuration
so ~/.vim/plugins.vim
so ~/.vim/maps.vim

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

" no vi compatible
set nocompatible

" allow plugins by file type (rquire for plugins!)
filetype plugin on
filetype indent on

set hidden

" always show status bar
set ls=2

" highlighted searh results
set hlsearch

" para que no wrapee
set nowrap

"set clipboard=unamedplus

set noswapfile

set showcmd
set noerrorbells
set updatetime=300

" syntax highlight on
syntax on

" swap, backup and undo file
set directory=~/.vim/dirs/tmp " folder for swap files
set backup                    " make backup files
set backupdir=~/.vim/dirs/backups " folder for backup files
set undofile                  " presistent undos - undo after you are open the file
set undodir=!~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo " if you exit vim and later start, vim remembers information like, command line history and searchs..."

" create nedded directories if they don't exist
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')

endif

if !isdirectory(&directory)
  call mkdir(&directory, 'p')

endif


if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')

endif

" tabs and spaces handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" show
set ruler
set number
set relativenumber

" show tabs , col and spaces
"set list
" chars to use to show the tabs, col and spaces
" i don't know to use
" set listchars=tab:*\ ,eol:~, trail:~-

" show rule in column 100
set colorcolumn=100

" how to split windows
set splitbelow
set splitright

au VimResized *:wincmd = " resize split when windows are reduce

" show cursor line
set mouse=a
set cursorline

" Para la busqueda de archivos
autocmd FileType netrw setl bufhidden=delete
set path+=**
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
" use 256 colors when possible
"colorscheme base16-harmonic-dark
"colorscheme desert
"colorscheme base16-atelier-seaside
"este tema esta bien chivo
"colorscheme base16-apathy
"colorscheme base16-oceanicnext
colorscheme base16-gruvbox-dark-hard
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors

endif

" when scrolling, keep cursor 5 lines away from screen border
set scrolloff=8

" search
set incsearch " incremental search"
set ignorecase
set autoindent
set smartcase
