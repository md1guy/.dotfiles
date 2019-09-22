" Yes?
    set nocompatible

" Unmap default space key behaviour (<right>) and map it as <Leader> key.
    nnoremap <SPACE> <Nop>
    let mapleader = " "

    call plug#begin('~/.vim/plugged')

        Plug 'junegunn/goyo.vim'                    " Distraction-free mode (':Goyo')
        Plug 'tomtom/tcomment_vim'                  " Toggle line comments('gcc' for current line)
        Plug 'nathanaelkane/vim-indent-guides'      " Show level indentation
        Plug 'dylanaraps/wal.vim'                   " Color scheme from wal
        Plug 'scrooloose/nerdtree'                  " Tree-like file explorer
        Plug 'Xuyuanp/nerdtree-git-plugin'          " Git info in file explorer
        Plug 'severin-lemaignan/vim-minimap'        " File minimap (yeah)
        Plug 'PotatoesMaster/i3-vim-syntax'         " i3config syntax highliting

    call plug#end()

    filetype plugin indent on                       " Filetype detection.
    syntax on                                       " Enable syntax highlighting.
    colorscheme wal                                 " Use generated by pywal colorscheme

" Powerline.
    set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim 

    set backspace=indent,eol,start                  " Allow backspacing over everything in insert mode.
    set history=200                                 " Keep 200 lines of command line history.
    set ruler                                       " Show the cursor position all the time.
    set showcmd                                     " Display incomplete commands.
    set ttimeout                                    " Time out for key codes.
    set ttimeoutlen=100                             " Wait up to 100ms after Esc for special key
    set display=truncate                            " Show @@@ in the last line if it is truncated.
    set tabstop=4 shiftwidth=4 expandtab            " Tab == four spaces.
    set scrolloff=5                                 " Show a few lines of context around the cursor.
    set nrformats-=octal                            " Do not increase/decrease octal numbers.
    set textwidth=100                               " Wrap text at 100 symbols. FIGHT ME
    set lazyredraw                                  " Don't update the display while executing macros.
    set number                                      " Display line numbers.
    set wildmenu                                    " Enable enhanced command-line completion.
    set laststatus=2                                " Always show the status line.
    set switchbuf=usetab                            " :sb will open already opened view of buffer, if any.
    set splitbelow splitright                       " More natural split direction.
    set rnu                                         " Enable hybrid line numbers.
    set hidden                                      " Yes.

" Enable absolute line numbers on inactive windows.
    :augroup numbertoggle
        :  autocmd!
        :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    :augroup END

" Do incremental searching when it's possible to timeout.
    if has('reltime')
        set incsearch
    endif

" Turn on mouse controls in supported environments.
    if has('mouse')
        set mouse=a
    endif

" Switch on highlighting the last used search pattern.
    if &t_Co > 2 || has("gui_running")
          set hlsearch
    endif

" When editing a file, always jump to the last known cursor position.  Don't do it when the position
" is invalid, when inside an event handler (happens when dropping a file on gvim) and for a commit
" message (it's likely a different one than last time).
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

" Change cursor style accordingly to mode.
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"

" Set the thinniest indentation guides possible.
    let g:indent_guides_guide_size = 1
    let g:indent_guides_color_change_percent = 3
    let g:indent_guides_enable_on_vim_startup = 1

" Set width in Goyo mode.
    let g:goyo_width = 110

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
    inoremap <C-U> <C-G>u<C-U>

" Insert empty line before('ctrl-o') or after('return') caret without entering insert mode.
    nnoremap <C-o> O<Esc>
    nnoremap <CR> o<Esc>

" Hit Esc twice in normal mode to disable highlighting last search results.
    nnoremap <esc><esc> :silent! nohls<cr>

" Shorter shortcuts for split navigation.
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

" More adequate tab navigation.
    noremap <S-j> gT
    noremap <S-k> gt

" Toggle file explorer.
    noremap <leader>n :NERDTreeToggle<CR>

" Bindings for Copy/Paste from/to external programs(gvim-specific feature).
" <C-c> in visual mode to copy selected text.
    vnoremap <C-c> "*Y :let @+=@*<CR>
" <C-p> in normal mode to paste text.
    noremap <C-p> "+P
" <C-v> in insert mode to paste text.
    inoremap <C-v> <Right><esc>"+Pi<Right>

" Toggle distraction-free mode (Goyo)
    noremap <leader>f :Goyo<CR>

" Alias replace all to S.
    nnoremap S :%s//g<Left><Left>

" Write .vimrc with 'wv'
    nnoremap wv :w ~/.vimrc <CR>

" Source .vimrc with 'sv'
    nnoremap sv :source ~/.vimrc <CR>

" Open file explorer automatically when vim starts up without files specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open file explorer automatically when vim starts up opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
                \ | exe 'NERDTree' argv()[0] 
                \ | wincmd p 
                \ | ene 
                \ | exe 'cd '.argv()[0] 
                \ | endif

" Close vim if only open window is file explorer.
    autocmd bufenter * if (winnr("$") == 1 && exists("b :NERDTree") && b:NERDTree.isTabTree()) 
                \ | q | endif
