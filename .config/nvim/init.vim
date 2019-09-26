" Map comma as <Leader> key.
    let mapleader = ","
    let g:mapleader = ","

    call plug#begin('~/.config/nvim/plugged')

        Plug 'junegunn/goyo.vim'                    " Distraction-free mode (':Goyo').
        Plug 'tomtom/tcomment_vim'                  " Toggle line comments('gcc' for current line).
        Plug 'thaerkh/vim-indentguides'             " Show level of indentation.
        Plug 'dylanaraps/wal.vim'                   " Color scheme from wal.
        Plug 'scrooloose/nerdtree'                  " Tree-like file explorer.
        Plug 'Xuyuanp/nerdtree-git-plugin'          " Git info in file explorer.
        Plug 'severin-lemaignan/vim-minimap'        " File minimap (yeah).
        Plug 'PotatoesMaster/i3-vim-syntax'         " i3config syntax highliting.
        Plug 'vim-airline/vim-airline'              " Statusline.
        Plug 'vim-airline/vim-airline-themes'       " Statusline themes.
        Plug 'mhartington/oceanic-next'  
        Plug 'liuchengxu/space-vim-theme'
        Plug 'joshdick/onedark.vim'

    call plug#end()

    filetype plugin indent on                       " Filetype detection.
    syntax on                                       " Enable syntax highlighting.
    colorscheme space_vim_theme                     " Set colorsheme.

" Turn off theme background. Needs to be after colorscheme setting.
    hi Normal guibg=NONE ctermbg=NONE               

    set nocompatible                                " Yes?
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
    set nolist                                      " Remove EOL/Tab visual indicators.
    set clipboard+=unnamedplus                      " Perform all copy-paste operations with system clipboard.
    set termguicolors                               " Seems like color scheme bg color finally works.
    set hidden                                      " Yes.

" Italic and bold fonts.
    let g:onedark_terminal_italics = 1
    let g:onedark_terminal_bold = 1

" Goyo.
    let g:goyo_width = 110

" Airline.
    let g:airline#extensions#tabline#enabled = 1                    " Tabline.
    let g:airline#extensions#tabline#show_splits = 1                " Show splits ib tabline.
    let g:airline#extensions#tabline#show_buffers = 0               " Don't show buffers in tabview.
    let g:airline#extensions#tabline#formatter = 'unique_tail'      " Path in tabs.
    let g:airline_powerline_fonts = 1                               " Use powerline symbols in statusline.
    let g:airline_theme = 'deus'                                    " Statusline theme.
    let g:airline#extensions#tabline#tab_nr_type = 1                " Show tab numbers.


" =================================================================================================
" =================================================================================================


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

    if has("vms")
        set nobackup
    else
          set backup
        if has('persistent_undo')
                set undofile
        endif
    endif

" Enable absolute line numbers on inactive windows.
    :augroup numbertoggle
        :  autocmd!
        :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    :augroup END

" Disable autocomment on newline.
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" When editing a file, always jump to the last known cursor position.  Don't do it when the position
" is invalid, when inside an event handler (happens when dropping a file on gvim) and for a commit
" message (it's likely a different one than last time).
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif

" Close nvim if only open window is file explorer.
    autocmd bufenter * if (winnr("$") == 1 && exists("b :NERDTree") && b:NERDTree.isTabTree()) 
                \ | q | endif


" =================================================================================================
" =================================================================================================


" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ':iunmap <C-U>'.
    inoremap <C-U> <C-G>u<C-U>

" Disable help button (due to lot of accidental presses on 'f1').
    noremap <f1> <Nop>

" Usual deletion keys will actually delete things instead of cutting.
    nnoremap x "_x
    nnoremap d "_d
    nnoremap D "_D
    vnoremap d "_d

" Use <leader> for default behaviour(cutting things).
    nnoremap <leader>d "+d
    nnoremap <leader>D "+D
    vnoremap <leader>d "+d

" <C-v> for pasting in insert mode.
    inoremap <C-v> <Esc>pi<Right>

" <C-x> for undoing in insert mode (keep in mind that vim's 'undo' is a bit coarse).
    inoremap <C-x> <Esc>ui

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

" Toggle distraction-free mode.
    noremap <leader>f :Goyo<CR>

" Alias replace all to S.
    nnoremap S :%s//g<Left><Left>

" Source nvim config file with 'sv'
    nnoremap sv :source ~/.config/nvim/init.vim <CR>
