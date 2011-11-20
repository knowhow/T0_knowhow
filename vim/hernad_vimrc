
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

" status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]

" now set it up to change the status line based on mode
if version >= 700
  "au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertEnter * hi StatusLine term=reverse ctermfg=2 ctermbg=2 gui=underline guisp=White
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=0 gui=bold,reverse

endif


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


" http://mutelight.org/articles/dbext-the-last-sql-client-youll-ever-need

" SQLite
let g:dbext_default_profile_sqlite_for_rails = 'type=SQLITE:dbname=/Users/hernad/sqlite_1.db'


" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

let mapleader = ","

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" sa ,W skloni sve suvisne white space-ove
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" sa ,<strelica dole> idi na kraj tekuceg buffer-a
" nnoremap <leader><down> 10000000gg


let g:github_user = 'hernad'
let g:github_token = 'xxxxxxx'

" http://newbiedoc.sourceforge.net/tutorials/vim/example-vim.html.en
map! ,h1 <h1></h1><ESC>2ba
map tv :echo 'Tekuće vrijeme je ' . strftime('%c')<CR>


" https://gist.github.com/971862

if has("XXX_mac") || has("XXX_macunix")

map å <M-a>
map ∫ <M-b>
map ç <M-c>
map ∂ <M-d>
map ´ <M-e>
map ƒ <M-f>
map © <M-g>
map ˙ <M-h>
map ˆ <M-i>
map ∆ <M-j>
map ˚ <M-k>
map ¬ <M-l>
map µ <M-m>
map ˜ <M-n>
map ø <M-o>
map π <M-p>
map œ <M-q>
map ® <M-r>
map ß <M-s>
map † <M-t>
map ¨ <M-u>
map √ <M-v>
map ∑ <M-w>
map ≈ <M-x>
map ¥ <M-y>
map Ω <M-z>

map Å <M-A>
map ı <M-B>
map Ç <M-C>
map Î <M-D>
map ´ <M-E>
map Ï <M-F>
map ˝ <M-G>
map Ó <M-H>
map ˆ <M-I>
map Ô <M-J>
map  <M-K>
map Ò <M-L>
map Â <M-M>
map ˜ <M-N>
map Ø <M-O>
map ∏ <M-P>
map Œ <M-Q>
map ‰ <M-R>
map Í <M-S>
map ˇ <M-T>
map ¨ <M-U>
map ◊ <M-V>
map „ <M-W>
map ˛ <M-X>
map Á <M-Y>
map ¸ <M-Z>

endif

map <A-a> :ChefFindAny<CR> 


" autocmd VimEnter waits until all initialization is finished (plugins are loaded)
" autocmd VimEnter * NERDTree
" wincmd p puts the cursor in the main window (rather than the NERDTree window)
" autocmd VimEnter * wincmd p

set wrap
"map <F1> :NERDTree<CR>:wincmd p<CR>
noremap nt :NERDTreeToggle<CR>
map <F3> <C-]>
map <F2> <C-O>

au! BufWritePost .vimrc source %



set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Headlights'

" My Bundles here:
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required! 
"
" Brief help
"
" :BundleInstall  - install bundles (won't update installed)
" :BundleInstall! - update if installed
"
" :Bundles foo    - search for foo
" :Bundles! foo   - refresh cached list and search for foo
"
" :BundleClean    - confirm removal of unused bundles
" :BundleClean!   - remove without confirmation
"
" see :h vundle for more details
" or wiki for FAQ
" Note: comments after Bundle command are not allowed.:.
"

" set runtimepath+=~/.vim/bundle/vam
" call vam#ActivateAddons(["snipmate-snippets","vimdevplugin"])

" try 
" call vam#ActivateAddons(["snipmate-snippets"])
" catch /^Vim\%((\a\+)\)\=:E749/
"	echo "ulovio"
" finally
"	echo "finally"
" endtry

" http://vim.wikia.com/wiki/Find_files_in_subdirectories
" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")


function! CompleteEmails(findstart, base) 
	if a:findstart
	   " locate the start of the word 
	   let line = getline('.') 
	   let start = col('.') - 1 
	   while start > 0 && line[start - 1] =~ '\a'
	      let start -= 1 
	   endwhile
	   return start 
    else
	   " find contact names matching with "a:base" 
	   let res = [] 
	   " we read contactlist file and sort the result 
	   for m in sort(readfile('/Users/hernad/contacts.txt'))
	       if m =~ '^' . a:base 
		  	  let contactinfo = split(m, '|')
			  " show names in list, but insert mail address
			  call add(res, {'word': contactinfo[1],
					\ 'abbr': contactinfo[0].' <'.contactinfo[1].'>', 
					\ 'icase': 1} )
		   endif
	    endfor
	    return res
     endif
endfunction

let g:NERDCustomDelimiters = {
        \ 'coffee': { 'left': '# '}
    \ }


" dupliciraj rijec iznad
"nmap dup <ESC>kyWjP<SPACE>
nmap dup <ESC>kvWyjP

" select all
imap <c-a> <ESC>ggVG<CR>


" http://vim.wikia.com/wiki/Enhanced_Ctrl-A
function! AddSubtract(operation, direction)
  if &nrformats =~ 'alpha'
    let pattern = '[[:alpha:][:digit:]]'
  else
    let pattern = '[[:digit:]]'
  endif
  if 'b' == a:direction
    call search(pattern, 'bcw')
  else
    call search(pattern, 'cw')
  endif
  if 'a' == a:operation
    execute 'normal! ' . v:count1 . "\<C-a>"
    silent! call
        \ repeat#set(":\<C-u>call AddSubtract('a', '" .a:direction. "')\<CR>")
  else
    execute 'normal! ' . v:count1 . "\<C-x>"
    silent! call
        \ repeat#set(":\<C-u>call AddSubtract('s', '" .a:direction. "')\<CR>")
  endif
endfunction
nnoremap <silent>         <C-a> :<C-u>call AddSubtract('a', 'f')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract('a', 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract('s', 'f')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract('s', 'b')<CR>

" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line

"function! HandleURI()
  "let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  "echo s:uri
  "if s:uri != ""
	  "exec "!open \"" . s:uri . "\""
  "else
	  "echo "No URI found in line."
  "endif
"endfunction
"map <Leader>w :call HandleURI()<CR>

ruby << EOF
  def open_uri
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line

    if url = line[re]
      system("open", url)
      VIM::message(url)
    else
      VIM::message("No URI found in line.")
    end
  end
EOF

if !exists("*OpenURI")
  function! OpenURI()
    :ruby open_uri
  endfunction
endif
map <Leader>w :call OpenURI()<CR>

function! ToogleToolBar()

if &guioptions =~# 'T' 
	set guioptions-=T 
"	set guioptions-=m
	echo "no toolbar/menu"
else 
	set guioptions+=T
"	set guioptions+=m
    echo "toolbar/menu are here"
endif

endfunction

"map <silent> <c-t> :call ToogleToolBar()<CR>

nmap <CR> <C-]>
nmap <BS> <C-T>

" window zoom - zatvori sve ostale prozore 
nmap zoom <C-W>o

" otvori vimrc i pozicioniraj se na kraj
nmap vimrc :ed ~/.vimrc<CR>GGo

nmap tb :TagbarToggle<CR>

" iabbrev hernad Ernad Husremovic
iabbrev jq14 <script src="development-bundle/jquery-1.4.4.js"> </script>
iabbrev jq16 <script src="development-bundle/jquery-1.6.2.js"> </script>


" For HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" For Ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo


function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set tabstop=4
set shiftwidth=4
set expandtab

nmap h1  :r !cat ~/header_knowhow_erp_harbour.txt<CR>gg1dd<INS>

nmap <C-P> :exe '!ptxt ' . substitute(@%, '.conv.txt', '', 'y') . ' /p'<CR>

" set fileencodings=utf-8,latin1,cp852
