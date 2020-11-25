" This must be first, because it changes other options as side effect
set nocompatible
filetype off

set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'clones/vim-l9'
if executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  Plugin 'mileszs/ack.vim'
elseif executable('ack')
  Plugin 'mileszs/ack.vim'
endif
" General
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'spf13/vim-colors'
Plugin 'tpope/vim-surround'
" Plugin 'AutoClose'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'matchit.zip'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/csapprox'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'corntrace/bufexplorer'
Plugin 'mbbill/undotree'
" Plugin 'myusuf3/numbers.vim'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
if executable('ctags')
  Plugin 'majutsushi/tagbar'
endif
" Autocomplete
Plugin 'garbas/vim-snipmate'
Plugin 'ervandew/supertab'
" Legacy
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'nono/vim-handlebars'
Plugin 'groenewege/vim-less'
Plugin 'junegunn/goyo.vim'
" Plugin 'amix/vim-zenroom2'
Plugin 'junegunn/limelight.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wikitopian/hardmode'
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'thoughtbot/vim-rspec'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/seoul256.vim'
Plugin 'heartsentwined/vim-emblem'
Plugin 'elixir-editors/vim-elixir'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'dense-analysis/ale'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'towolf/vim-helm'
Plugin 'google/vim-jsonnet'
Plugin 'TovarishFin/vim-solidity'
Plugin 'editorconfig/editorconfig-vim'

" Quickly edit/reload the vimrc file
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>p :NERDTreeFind<CR>
nmap <silent> <leader>st :%s/\t/  /g<CR>
nmap <silent> ,/ :nohlsearch<CR>
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <silent> <leader>z :Goyo<CR>

" Save without trailing space
autocmd BufWritePre * :%s/\s\+$//e
" HTML5 Syntax Highlight for erb
autocmd BufRead,BufNewFile *.html.erb set filetype=eruby.html
autocmd BufRead,BufNewFile *.js.erb set filetype=eruby.javascript
autocmd BufRead,BufNewFile *.rabl set filetype=ruby
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile *.axlsx set filetype=ruby
autocmd BufRead,BufNewFile *.variables set filetype=less
autocmd BufRead,BufNewFile *.overrides set filetype=less

set hidden        " Open a new file using :e, without being forced to write or undo your changes first
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab     " soft tab
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set cursorline    " highlight current line"

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmode=longest,list
set wildmenu
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

call vundle#end()
filetype plugin indent on

set background=dark
color seoul256
if has("gui_macvim")
  if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=256
    color solarized
  endif
endif
if has("gui_vimr")
  if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=256
    color solarized
  endif
endif
syntax on

set list
set listchars=tab:>.,trail:~,extends:#,nbsp:.
autocmd FileType go setlocal nolist

set pastetoggle=<F2>
" set mouse=a

nnoremap ; :
nnoremap j gj
nnoremap k gk

cmap w!! w !sudo tee % >/dev/null

function! s:goyo_enter()
  " silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction
function! s:goyo_leave()
  " silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

" nerdtree
" let g:nerdtree_tabs_open_on_gui_startup=0

" vim-rails projection
let g:rails_projections = {
      \ "app/forms/*_form.rb": {
      \   "command": "form"
      \ },
      \ "app/services/*_service.rb": {
      \   "command": "service"
      \ },
      \ "app/serializers/*_serializer.rb": {
      \   "command": "serializer"
      \ },
      \ "app/workers/*_worker.rb": {
      \   "command": "worker"
      \ }}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ "javascript": ["eslint"],
      \ "typescript": ["eslint"],
      \ "solidity": ["prettier"],
      \ "ruby": ["rubocop", "prettier"],
      \ }
" let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5'

let g:terraform_fmt_on_save=1
