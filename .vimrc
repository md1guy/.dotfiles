" Yes? Required by Vundle
set nocompatible
" Required by Vundle
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " Distraction-free mode (':Goyo')
  Plugin 'junegunn/goyo.vim'

  " Toggle line comments(highlight+'gc'; 'gcc' for current line)
  Plugin 'tomtom/tcomment_vim'

  " Show git changes over lines (toggle with '<Leader>ig')
  Plugin 'vim-gitgutter'

  " Show level indentation
  Plugin 'nathanaelkane/vim-indent-guides'

  " Color scheme from wal
  Plugin 'dylanaraps/wal.vim'
  
  " Tree-like file explorer
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  
call vundle#end()

" Filetype detection & loading type-specific indentation preferences and
" plugin. Required by Vundle
filetype plugin indent on

if v:progname =~? "evim"
  finish
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Turn on mouse controls in supported environments 
if has('mouse')
  set mouse=a
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

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

" Hit Esc twice in normal mode to disable highlighting last search results 
nnoremap <esc><esc> :silent! nohls<cr>

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

" Don't update the display while executing macros
set lazyredraw

" Display line numbers
set number

" Enable syntax highlighting
syntax on

" Enable enhanced command-line completion
set wildmenu

" More intuitive split direction than default
" set splitbelow splitright

" Powerline
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

" Always show the status line
set laststatus=2

" Yes.
set hidden

" Switch to already opened buffer in another window/tab instead of creating
" new window (works with :sb/:sbuffer)
set switchbuf=usetab

" Shorter shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Toggle file explorer
map <C-n> :NERDTreeToggle<CR>

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

colorscheme wal

" Set the thinniest indentation guides possible
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
