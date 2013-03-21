set nocompatible

filetype off " required

" VUNDLE

set rtp+=~/.vim/bundle/vundle/
call vundle#rc() " let Vundle manage Vundle

" required
Bundle 'gmarik/vundle' 

" Command-T
Bundle 'Command-T'                
" Ack
Bundle 'ack.vim'                  
" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
" Ultisnips
Bundle 'SirVer/ultisnips'         
" Syntastic
Bundle 'scrooloose/syntastic'

filetype plugin indent on " required

" END VUNDLE

  syntax on
  colorscheme molokai

  filetype plugin on

  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

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
  set showmode
  set showcmd
  set hidden
  set wildmenu
  set wildmode=list:longest,full
  set completeopt=menu,menuone,longest
  set cursorline
  set ttyfast
  set ruler
  set backspace=indent,eol,start
  set laststatus=2
  set relativenumber
  set undofile
  set history=1000         " remember more commands and search history
  set undolevels=1000      " use many muchos levels of undo
  let g:loaded_matchparen=1 " diable matching brackets
" }

" Paste {
  if has ('x') && has ('gui') " on Linux use + register for copy-paste
      set clipboard=unnamedplus
  elseif has ('gui') " one mac and windows, use * register for copy-paste
      set clipboard=unnamed
  endif

  set pastetoggle=<F2>
" }

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
    if has('persistent_undo')
      set undofile                "so is persistent undo ...
      set undodir=~/.vim/.undo
      set undolevels=1000         "maximum number of changes that can be undone
      set undoreload=10000        "maximum number lines to save for undo on a buffer reload
    endif
" }

" Plugins {

  " Ack {
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  " }

  " Snippets {

    function! g:UltiSnips_Complete()
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        call UltiSnips_ExpandSnippet()
        if g:ulti_expand_res == 0
          if pumvisible()
            return "\<C-n>"
          else
            return "\<TAB>"
          endif
        endif
      endif
      return ""
    endfunction

    "function! g:UltiSnips_Complete()
    "  call UltiSnips_ExpandSnippet()
    "  if g:ulti_expand_res == 0
    "    call UltiSnips_JumpForwards()
    "    if g:ulti_jump_forwards_res == 0
    "      if pumvisible()
    "        return "\<C-n>"
    "      else
    "        return "\<TAB>"
    "      endif
    "    endif
    "  endif
    "  return ""
    "endfunction

    au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

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

  " EasyTags
    set tags=./tags;

  " You Complete Me
    let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
    let g:ycm_allow_changing_updatetime = 0
    let g:ycm_complete_in_comments = 1
    au BufWritePost *.c,*.cpp,*.h YcmForceCompileAndDiagnostics
    nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

    if has("autocmd")
      autocmd FileType cpp,c,ruby,python,java let g:easytags_include_members = 1
    endif
