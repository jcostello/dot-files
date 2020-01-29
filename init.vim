set nocompatible

" VUNDLE
  call plug#begin('~/.vim/plugged')

  " Colors
  Plug 'flazz/vim-colorschemes'

  " Nerd tree
  Plug 'scrooloose/nerdtree'

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " Autocomplete 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Vim ruby
  " Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

  " Vim rails
  " Plug 'tpope/vim-rails', { 'for': 'ruby' }

  " Vim Slim
  Plug 'slim-template/vim-slim', { 'for': 'slim' }

  " Vim Javascript
  " Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " Syntastic
  " Plug 'w0rp/ale'
  
  " Closes {} do end
  Plug 'tpope/vim-endwise'
  Plug 'jiangmiao/auto-pairs'

  " JS & React
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  
  " Snippets
  Plug 'honza/vim-snippets'

  " Commenter
  Plug 'tpope/vim-commentary'

  " Global finder
  Plug 'wincent/ferret'

  " Bar
  Plug 'vim-airline/vim-airline'

  call plug#end()
" END VUNDLE

  syntax on
  colorscheme dracula
  
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


" Autocomplete

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

  nnoremap <C-tab> :bprevious<CR>

  map <esc> :noh<cr>

" Undo

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

  " Plug Abrev
  " cnoreabbrev install PlugClean<bar>PlugInstall<bar>PlugUpdate

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
  " let g:ale_sign_warning = '▲'
  " let g:ale_sign_error = '✗'
  " let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
  " let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop']}
  " let g:ale_fix_on_save = 0

  " highlight link ALEWarningSign String
  " highlight link ALEErrorSign Title
  
  " ACK
  vmap <C-_> y :Ack <C-R>"

  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'
