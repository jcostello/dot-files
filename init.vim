set nocompatible

" VUNDLE
  call plug#begin('~/.vim/plugged')

  " Color schema
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Nerd tree
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }	

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " Vim ruby
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

  " Vim rails
  Plug 'tpope/vim-rails', { 'for': 'ruby' }

  Plug 'slim-template/vim-slim', { 'for': 'slim' }

  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " Syntastic
  Plug 'w0rp/ale'
  
  " Closes {} do end
  Plug 'tpope/vim-endwise'
  Plug 'jiangmiao/auto-pairs'

  " Ctags
  Plug 'ludovicchabant/vim-gutentags'

  " Commenter
  Plug 'tpope/vim-commentary'

  Plug 'wincent/ferret'

  Plug 'itchyny/lightline.vim'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
  let g:deoplete#enable_at_startup = 1

  " Track the engine.
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

  Plug 'janko-m/vim-test'

  call plug#end()
" END VUNDLE

  syntax on
  color dracula
  
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
  set splitright        "Split to the right
  set noeb vb t_vb=     "No Bell

" Clipboard

  set pastetoggle=<F10>
  inoremap <C-v> <F10><C-r>+<F10>

  vnoremap <C-c> "+y

  set clipboard=unnamedplus

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
  vnoremap / y /\v <C-R>"

  cnoreabbrev install PlugClean<bar>PlugInstall<bar>PlugUpdate

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
  nmap <silent> <leader>vo :vsp $MYVIMRC<CR>
  nmap <silent> <leader>vl :so $MYVIMRC<CR>


  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  map <esc> :noh<cr>

  set nobackup
  set noswapfile
  set history=1000         " remember more commands and search history
  if has('persistent_undo')
    set undofile                "so is persistent undo ...
    set undodir=~/.vim/.undo
    set undolevels=1000         "maximum number of changes that can be undone
    set undoreload=10000        "maximum number lines to save for undo on a buffer reload
  endif

" GUI

  if has("gui_running")
    set lines=999 columns=999
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=m
  endif

" Plugins 

  " Fzf
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }

  nnoremap <c-p> :FZF<cr>

  " Nerdtree
  
  nmap <C-N> :NERDTreeToggle<CR>
  nmap <C-Enter> :NERDTreeFind<CR>
  let NERDTreeShowHidden=1

  " Ale
  let g:ale_sign_warning = '▲'
  let g:ale_sign_error = '✗'
  let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
  let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop']}
  let g:ale_fix_on_save = 1

  highlight link ALEWarningSign String
  highlight link ALEErrorSign Title
  " ACK
  
  vmap <C-_> y :Ack <C-R>"

  function! GoBackToRecentBuffer()
    let startName = bufname('%')
    while 1
      exe "normal! \<c-o>"
      let nowName = bufname('%')
      if nowName != startName
        break
      endif
    endwhile
  endfunction

  nnoremap <silent> <C-tab> :call GoBackToRecentBuffer()<Enter>


  function! DockerTransform(cmd) abort
    " return test command wrapped in docker stuff
  endfunction

  let g:test#custom_transformations = {'docker': function('DockerTransform')}
  let g:test#transformation = 'docker'
