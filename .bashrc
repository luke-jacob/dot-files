
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Bundle 'lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
""Plugin 'Valloric/YouCompleteMe'
Plugin 'syntastic'
Plugin 'supertab'
Plugin 'the-nerd-commenter'
""Plugin 'ctrlp'
Plugin 'yggdroot/indentline'
Plugin 'klen/python-mode'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bash-support.vim'
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

""airplane configuration
set laststatus=2
let g:airline_theme='solarized'

""syntastic config
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*

"" powerline setup
""set guifont=inconsolata\ for\ powerline:h15
""let g:powerline_symbols = 'fancy'
""set fillchars+=stl:\ ,stlnc:\
""set term=xterm-256color
""set termencoding=utf-8

""nerd commentor
let g:nerdspacedelims = 1
"" indent line
" vim
let g:indentline_color_term = 245
"
" "gvim
let g:indentline_color_gui = '#a4e57e'
"
" " none x terminal
let g:indentline_color_tty_light = 7 " (default: 4)
let g:indentline_color_dark = 1 " (default: 2)

"" pymode
let g:pymode_trim_whitespaces = 1
let g:pymode_folding = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint_on_write = 0
let g:pymode_lint_ignore = "E501,E302,E261,E701,E241,E126,E127,E128,W801"
""let g:pymode_lint_cwindow = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
let g:syntastic_python_pylint_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" set colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history vim has to remember
set history=700
filetype on
filetype plugin on

" Backups in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Be smart when using tabs ;)
set smarttab

" Autocompletion
"set wildmode=list:longest
"set wildmenu
" Ignore compiled files
"set wildignore=*.o,*~,*.pyc

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set si

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set si |
    \ set fileformat=unix

au BufNewFile,BufRead *.sh
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set si |
    \ set fileformat=unix

au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.txt setlocal spell
au BufRead,BufNewFile README setlocal spell

set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keep at least 5 lines above/below
set scrolloff=5
" keep at least 5 lines left/right
set sidescrolloff=5

" redraw only when we need to
set lazyredraw
" Enable mouse support
set mouse=a

" highlight current Line
set cursorline

"" Expanded info on bottom
set ruler
set hidden

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"Set VIM title
set title

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader/remapping shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

"treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Remap VIM 0 to first non-blank character
map 0 ^

map <F2> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Search Optionn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch
runtime macros/matchit.vim

"Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Visual mode pressing * or # searches for the current selection
" " Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


