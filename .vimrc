if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup
else
  set backup
  if has('persistent_undo')
    set undofile
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Display line numbers
set number

" Enable syntax highlighting
syntax on

" More intuitive split direction than default
set splitbelow splitright

" Powerline
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

" Always show the status line
set laststatus=2

" Shorter shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Bindings for Copy/Paste from/to external programs(gvim-specific feature)
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

" Change cursor style accordingly to mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Enable hybrid line numbers
set rnu

" Enable absolute line numbers on inactive windows
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
"Plug 'wincent/terminus'

call plug#end()

colorscheme wal
