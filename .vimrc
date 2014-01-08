set nocompatible

filetype off " required

" VUNDLE

set rtp+=~/.vim/bundle/vundle/
call vundle#rc() " let Vundle manage Vundle

" required
Bundle 'gmarik/vundle' 

" Command-T
Bundle 'Command-T'                
" Ultisnips
Bundle 'SirVer/ultisnips'         
" Syntastic
Bundle 'scrooloose/syntastic'

filetype plugin indent on " required

" END VUNDLE

  syntax enable
  set background=dark
  colorscheme jellybeans
  

  filetype plugin on

  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" whitespaces
  autocmd Filetype html setlocal ts=2 sts=2 sw=2
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
  autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
  autocmd Filetype cpp setlocal ts=4 sts=4 sw=4

" Basics {
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
" }
"
" Search {
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
" }

" Mappings {
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
" }

" Setting up the directories {
    set nobackup
    set noswapfile
    set history=1000         " remember more commands and search history
    if has('persistent_undo')
      set undofile                "so is persistent undo ...
      set undodir=~/.vim/.undo
      set undolevels=1000         "maximum number of changes that can be undone
      set undoreload=10000        "maximum number lines to save for undo on a buffer reload
    endif
" }

" Plugins {

  " Snippets {
    let g:UltiSnipsExpandTrigger="<TAB>"
    let g:UltiSnipsJumpForwardTrigger="<TAB>"
    let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
    let g:UltiSnipsListSnippets="<c-e>"
  " }
 
  " Syntastic
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_enable_highlighting=0
    let g:syntastic_auto_loc_list=1
    let g:syntastic_loc_list_height=5
