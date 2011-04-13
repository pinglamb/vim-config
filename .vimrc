" This must be first, because it changes other options as side effect
set nocompatible
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Quickly edit/reload the vimrc file
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>t :FufFile<CR>
nmap <silent> <leader>p :NERDTreeFind<CR>
nmap <silent> <leader>m :MRU<CR>

" Save without trailing space
autocmd BufWritePre * :%s/\s\+$//e

set hidden        " Open a new file using :e, without being forced to write or undo your changes first
set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
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

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmode=longest,list,full
set wildmenu
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

filetype plugin indent on
if &t_Co >= 256 || has("gui_running")
  colorscheme mustang
end
syntax on

set list
set listchars=tab:>.,trail:~,extends:#,nbsp:.

set pastetoggle=<F2>
set mouse=a

nnoremap ; :

nnoremap j gj
nnoremap k gk

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null
