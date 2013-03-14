" Environment {
    " Basics {
    set nocompatible        " must be first line
	  set hidden
  	set wildmenu
  	set wildmode=list:longest
	  set t_Co=256
    colorscheme jellybeans
    set cf
    " }
" }

" Visual
   set showmatch  " Show matching brackets.
   set mat=5  " Bracket blinking.
        " Show $ at end of line and trailing space as ~

   set novisualbell  " No blinking .
   set noerrorbells  " No noise.
   set laststatus=2  " Always show status line
   set ruler  " Ruler on
   set nu  " Line numbers on

" General {
    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype off
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    set mousehide               " hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " on Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui') " one mac and windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set hidden                      " allow buffer switching without saving

    " Setting up the directories {
        set backup                      " backups are nice ...
        set backupdir=~/.vim/.backups
        set directory=~/.vim/.swap/
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undodir=~/.vim/.undo
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif
    " }
" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=2                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=2                   " an indentation every four columns
    set softtabstop=2               " let backspace delete indent
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set nocp incsearch
    set formatoptions=tcqr
    set cindent
    set smarttab 
    set expandtab
    set cinoptions=:0,p0,t0
    set cinwords=if,else,while,do,for,switch,case
    " Remove trailing whitespaces and ^M chars
" }
"
" VUNDLE

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  " required
  Bundle 'gmarik/vundle' 

  Bundle 'Shougo/neocomplcache.git'
  Bundle 'Shougo/neosnippet.git'
  Bundle 'janx/vim-rubytest'


" END VUNDLE
"
  set nocompatible      " We're running Vim, not Vi!
  syntax on             " Enable syntax highlighting
  filetype on           " Enable filetype detection
  filetype indent on    " Enable filetype-specific indenting

" Plugins {
  execute pathogen#infect()

  let g:neocomplcache_enable_at_startup = 1
  let g:neosnippet#snippets_directory='~/.vim/snippets'
  let g:neosnippet#enable_snipmate_compatibility = 1
  
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif"
  
 " Ctags {
    set tags+=./tags
    au BufRead,BufNewFile *.rb silent! call ReadCTags()
    au BufWritePost *.rb call CtagsUpdate()

    function! ReadCTags()
      setlocal tags+=./tags
"      :NeoComplCacheCachingTags
    endfunction

    function! CtagsUpdate()
      :silent !bash ~/.vim/tags.sh
      :redraw!
    endfunction
  " }

  " ctrlp {
    let g:ctrlp_map = '<c-t>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_switch_buffer = 'Et'
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_by_filename = 1
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$' }

    let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " MAPPINGS

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  map <C-c> <Plug>RubyTestRun
  map <C-x> <Plug>RubyFileRun
  map <Leader>/ <Plug>RubyTestRunLast
