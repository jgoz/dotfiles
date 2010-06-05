syntax on
set autoread
set nocompatible
set autoindent smartindent
set formatoptions-=tc
set formatoptions+=r
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=3
set backspace=indent,eol,start
set showfulltag
set noerrorbells
set linebreak
set undolevels=1000
set complete=.,w,b,u,U,t,i,d
set nobackup
set ruler
set numberwidth=1
set bg=dark

" timing
set timeout timeoutlen=0 ttimeoutlen=100
set matchtime=2

set guitablabel=%N/\ %t\ %M

filetype on
filetype indent on
filetype plugin on

set wildmode=longest:full
set wildignore+=*.o,*~,.lo,*.obj,*.bak,*.exe,*.pyc,*.swp
set wildmenu                  " menu has tab completion

"""" Messages, Info, Status
set shortmess+=a
set showcmd
set laststatus=2
set report=0
set confirm

set dictionary=/usr/share/dict/words " more words!

if has("gui_running")
    set guioptions-=T       " no toolbar
    set cursorline          " show the cursor line
end

""" Windows
if exists(":tab")
    " Try to move to other windows if changing buf
    set switchbuf=useopen,usetab
else
    " Try other windows & tabs if available
    set switchbuf=useopen
endif

"  searching
set incsearch                 " incremental search
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set matchtime=2               " For .2 seconds

"  less
au BufRead,BufNewFile *.less set ft=less

" NERDTree
let NERDTreeChDirMode=2

"  mouse
set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing
" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p

setlocal spelllang=en
nmap <LocalLeader>ss :set spell!<CR>

au FileType html,tex noremap <buffer> j gj
au FileType html,tex noremap <buffer> k gk

" tab navigation (next tab) with alt left / alt right
nnoremap  <a-right>  gt
nnoremap  <a-left>   gT

" Ctrl + Arrows - Move around quickly
nnoremap  <c-up>	 {
nnoremap  <c-down>   }
nnoremap  <c-right>  El
nnoremap  <c-down>   Bh

" Shift + Arrows - Visually Select text
nnoremap  <s-up>	 Vk
nnoremap  <s-down>   Vj
nnoremap  <s-right>  vl
nnoremap  <s-left>   vh

if &diff
" easily handle diffing 
   vnoremap < :diffget<CR>
   vnoremap > :diffput<CR>
else
" visual shifting (builtin-repeat)
   vnoremap < <gv					   
   vnoremap > >gv 
endif

" some useful mappings
" Y yanks from cursor to $
map Y y$
" for yankring to work with previous mapping:
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" correct type-o's on exit
nmap q: :q
" save and build
nmap <LocalLeader>wm  :w<cr>:make<cr>
" open all folds
nmap <LocalLeader>fo  :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc  :%foldclose!<cr>
" ,tt will toggle taglist on and off
nmap <LocalLeader>tt :Tlist<cr>
" When I'm pretty sure that the first suggestion is correct
map <LocalLeader>r 1z=

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" nerd tree toggle
map <F2> :NERDTreeToggle<CR>
