"This file have the maps for vim

let mapleader=","

" quit file
nnoremap <leader>q <esc>:q<cr>

" go to normal mode amazing!!
inoremap kj <esc>l
vnoremap as <esc>l

" move between windows
noremap <TAB><TAB> <C-w><C-w>

" do nothing  when F1 is pressed
noremap <F1> <nop>
inoremap <F1> <nop>

" key mappings for save file
nnoremap <F2> <esc>:w!<CR>
inoremap <F2> <esc>:w!<CR>
vnoremap <F2> <esc>:w!<CR>
nnoremap <leader>s <esc>:w!<CR>
"inoremap <leader>s <esc>:w!<CR>
vnoremap <leader>s <esc>:w!<CR>
nnoremap <leader>f <esc>:w<CR>

" tab navigation mappings
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>
nnoremap tt :$tabnew<CR>

" move text lines and blocks
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" reselect text after indentation
vnoremap < <gv
vnoremap > >gv
nnoremap > <c-w>>
nnoremap < <c-w><

" para que cuando busquemos y presionemos n para ver la otra busqueda
" presione zz para que la linea donde esta la palabra la ponga en medio
nnoremap n nzzzv
nnoremap N Nzzzv

" clear search results
nnoremap <silent><space> :nohl<CR>

" select current line without indemtation 
nnoremap vv ^vg_

" duplicated line
nnoremap dl :t.<CR>

" remap up and down keys to navigate on warp lines
nnoremap j gj
nnoremap k gk

" repear t/T/f/F searh easily
" aki es la letra egne pero como mi teclado es Ingles jeje
nnoremap gn ;

" disable arrow keys
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" autocomplete marchs
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap < <><Esc>i
"inoremap ` ``<Esc>i


" ???
set complete=.,w,b,u,t
set completeopt=longest,menuone
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete

" this is for the portapapeles
set clipboard=unnamedplus

" this is for execute code for python
" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <leader>w :call SaveAndExecutePython()<CR>
vnoremap <silent> <leader>w :<C-u>call SaveAndExecutePython()<CR>

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python3 " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

"this is for execute a file .js with node
nmap <leader>n :! node %
map <F7> :q <CR>

" For execute python code
imap <leader>y <Esc>:w !python3<CR>
map <leader>y :w !python3<CR>

" NERDTree -------------------------------
" toggle nertree display
map <F3> :NERDTreeToggle<CR>
"" toggle nerdtree with the current file selected
nmap <F4> :NERDTreeFind<CR>
"" dont show this files
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']
"" show cursor line
let NERDTreeHighlightCursorline = 1

"" Autorefresh on tree focus
function! NERDTreeRefresh()
  if &filetype == "nerdtree"
    silent exe substitute(mapcheck("R"), "<CR>", "", "")

  endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-t>"

" Explorer Files Vim
let g:netrw_banner=0
nmap <leader>b I
let g:netrw_liststyle=3
let g:netrw_winzise=0
let g:netrw_preview=1

"" Tagbar ------------------------------------
"let g:tagbar_compat = 1
"let g:tagbar_sort = 1
"let g:tagbar_autoclose = 1
"let g:tagbar_foldlevel = 0
"let g:tagbar_width = 60
"" Open tagbar
"nnoremap <leader>t :TagbarToggle<CR>

