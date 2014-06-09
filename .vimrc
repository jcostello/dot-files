set nocompatible

" VUNDLE

  filetype off " required

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc() " let Vundle manage Vundle

  " required
  Bundle 'gmarik/vundle' 
  " Command-T
  Bundle 'Command-T'                
  " Syntastic
  Bundle 'scrooloose/syntastic'
  " Vim Ruby
  Bundle 'vim-ruby/vim-ruby'

  Bundle 'ervandew/supertab'

  Bundle 'SirVer/ultisnips'

  Bundle 'honza/vim-snippets'
  
  Bundle 'jelera/vim-javascript-syntax'

  Bundle 'mileszs/ack.vim'

  filetype plugin indent on " required

" END VUNDLE

  syntax enable
  let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized
  
  filetype on           " Enable filetype detection
  filetype indent on    " Enable filetype-specific indenting
  filetype plugin on    " Enable filetype-specific plugins

" Basics

  set modelines=0
  set shiftwidth=2
  set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
  set expandtab
  set encoding=utf-8
  set scrolloff=3
  set autoindent    " always set autoindenting on
  set copyindent    " copy the previous indentation on autoindenting
  set showcmd
  set wildmenu
  set wildmode=list:longest,full
  set completeopt=menu,menuone,longest
  set cursorline
  set ttyfast
  set ruler
  set backspace=indent,eol,start
  set laststatus=2
  set relativenumber
  set autoread

" Search

  set ignorecase
  set smartcase
  set gdefault
  set incsearch
  set hlsearch
  set showmatch
  nnoremap <leader><space> :noh<cr>
  nnoremap <tab> %
  vnoremap <tab> %
  nnoremap / /\v
  vnoremap / /\v

" Mappings

  let mapleader = ","

  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>
  nnoremap j gj
  nnoremap k gk
  nnoremap ; :
  au FocusLost * :wa

  nnoremap <leader>w <C-w>v<C-w>l
  nnoremap <leader>q <C-w>q
  " Quickly edit/reload the vimrc file
  nmap <silent> <leader>vo :e $MYVIMRC<CR>
  nmap <silent> <leader>vl :so $MYVIMRC<CR>

  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

" Setting up the directories
"
  set nobackup
  set noswapfile
  set history=1000         " remember more commands and search history
  if has('persistent_undo')
    set undofile                "so is persistent undo ...
    set undodir=~/.vim/.undo
    set undolevels=1000         "maximum number of changes that can be undone
    set undoreload=10000        "maximum number lines to save for undo on a buffer reload
  endif

" Plugins 

  " Command-t

    set wildignore+=tmp/**
  
  " Ctags
    " ,rt -> regenerate tags, including objects/functions from installed gems
    " http://effectif.com/vim/using-ctags-with-bundler-gems
    map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R -f ./.tags <CR><C-M>
    
    " set tags-lookup-path
    set tags=.tags

    " do not regard "-" as word seperator (css Files!)
    set iskeyword+=-

  " Command-T
    nnoremap <silent> <c-p> :CommandT<CR>
    nnoremap <silent> <c-b> :CommandTBuffer<CR>
    noremap <F5> :CommandTFlush<CR>

    if &term =~ "xterm" || &term =~ "screen"
      let g:CommandTCancelMap = ['<ESC>', '<C-c>']
    endif

  " Syntastic
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_enable_highlighting=0
    let g:syntastic_auto_loc_list=1
    let g:syntastic_loc_list_height=5
