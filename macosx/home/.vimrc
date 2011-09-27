
" http://stackoverflow.com/questions/5904720/gvim-pathogen-issues

set nocompatible
" This must be first, because it changes other options as side effect set nocompatible
"
" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
call pathogen#infect()
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()
" filetype plugin indent on       " enable detection, plugins and indenting in one step


" http://nvie.com/posts/how-i-boosted-my-vim/


set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
" set autoindent    " always set autoindenting on
" set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
" set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

syntax enable
set background=dark
" set background=light
colorscheme solarized


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" let a='foo'
" let b='bar'

" let cfoo='hello'
" let cbar='bye'

" echo c{a}
" echo c{b}

" set mouse=a

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


