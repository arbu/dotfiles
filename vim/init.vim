" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
set fileencodings=utf-8 " ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set softtabstop=4

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.

set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.

set showcmd         " Show (partial) command in status line.

set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.

set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

set ignorecase      " Ignore case in search patterns.

set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.

set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.

"set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set smartindent

"set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.

set formatoptions=c,q,r " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode.
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.

set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.

set number

set laststatus=2

set list
set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

filetype plugin indent on
syntax on

set ttyfast
set autoread
set magic
set showcmd
set nofoldenable

let g:tex_flavor='latex'

if has('autocmd')
    augroup resCur
      autocmd!
      autocmd BufReadPost * call setpos(".", getpos("'\""))
    augroup END

    autocmd FileType markdown nnoremap <buffer> <F3> :w<enter>:Pandoc pdf<enter>
    autocmd FileType python nnoremap <buffer> <F4> :w<enter>:exec '!python' shellescape(@%, 1)<enter>

    au BufWinEnter * normal zR
end

if has('nvim')
    set mouse=c
    " set nocompatible
end

call plug#begin()
    Plug 'peterhoeg/vim-qml'
    Plug 'artoj/qmake-syntax-vim'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'dpelle/vim-LanguageTool'
    Plug 'w0rp/ale'

    " Markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    set conceallevel=2

    " LaTeX
    Plug 'LaTeX-Box-Team/LaTeX-Box'
    let maplocalleader = "\\"
call plug#end()

if has('persistent_undo')
    set undofile                        " Save undo's after file closes
    set undodir=$HOME/.config/nvim/undo " where to save undo histories
    set undolevels=1000                 " How many undos
    set undoreload=10000                " number of lines to save for undo
end
