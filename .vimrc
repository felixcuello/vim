" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"
"  VIM Configuration File Optimized for Perl Programming
"
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


" - - - - - - - - - - - - - - - - -
"
"  INSTALLATION INSTRUCTIONS
"
" - - - - - - - - - - - - - - - - -

" 1. Create new backup directories
" mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

" 2. Download Plugged
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" 3. Link molokai && monokai
" mkdir ~/.vim/colors && ln -s ~/.vim/plugged/molokai/colors/molokai.vim ~/.vim/colors && ln -s /home/vagrant/.vim/plugged/vim-monokai/colors/monokai.vim ~/.vim/colors


" - - - - - - - - - - - - - - - - -


" To move backup files to other directories:
" mkdir -p ~/.vim/{backup_files,swap_files,undo_files}
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

set nowrap


" - - - - - - - - - - - - - - - -
"
"  General VIM configuration
"
" - - - - - - - - - - - - - - - -
syntax on                       " Syntax highlighting
colorscheme monokai             " I can't believe it's not sublime

set t_Co=256
set number                      " Numbering lines
set noeol                       " Not end of line
set binary                      " Binary
set hlsearch                    " Highlight search"
set autoindent                  " Autoindent
set nocindent                   " Good autoindent :-)
set tabstop=2                   " Tab should be 4
set softtabstop=2               " insert mode tab and backspace 
set shiftwidth=2
set expandtab                   " Use spaces instead tab
set incsearch                   " Incremental search
set smartcase                   " Use case sensitive smart
set ignorecase                  " Use iwth smart case for best searching experience"
set backspace=2                 " Because I like this backspace behavior
set tags=~/tm/master/tags       " Tags for TMOL
set laststatus=2                " Status line always present
set wildmenu                    " show a navigable menu for tab completion
set wildmode=longest,list,full

let mapleader = ","             " Oh yeah!   ,  should be the map leader
let perl_include_pod = 1        " Include POD in Syntax Highlight
let perl_extended_vars = 1      " Highlight complex structures


"- - - - - - - - - - - - - - - -
"
"   Shortcuts
"
"- - - - - - - - - - - - - - - -
map <C-n> <leader>vv
map <C-p> :FZF<CR>
map <C-c> :SyntasticCheck<CR>
nnoremap <leader>a :tabprevious<CR>
nnoremap <leader>s :tabnext<CR>
nnoremap <leader>n :tabedit 
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>t :NERDTree<CR>
map <leader>r :!ctags -R ~/tm/master/*web*/lib/perl/ && mv tags ~/tm/mater/tags
nnoremap <leader>d :TagbarToggle<CR><C-w><C-w>
nnoremap <leader>. :CtrlPTag<cr>

"- - - - - - - - - - - - - - - -
"
"   Plugin Section
"
" - - - - - - - - - - - - - - - -

call plug#begin('~/.vim/plugged')

"" Fuzzy Finder (I like this more than ctrlP), so you decide what to use :-)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

"" Perl code completion
Plug 'c9s/perlomni.vim'

"" AUtomatic autocomplete
Plug 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1

"" Grep in all files
Plug 'dkprice/vim-easygrep'

"" CtrlP
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-o>'

"" FuzzyFinder is faster than CtrlP
Plug 'junegunn/fzf'

"" CTAGs 
Plug 'majutsushi/tagbar'

"" Check syntax on the fly
Plug 'scrooloose/syntastic'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_perl_lib_path = [ '/mgr/shared/home/tmweb/tm/master/tmweb/lib/perl', '/mgr/shared/home/tmweb/tm/master/webcore/lib/perl' ]

"" Supertab (to autocomplete using tab)
Plug 'ervandew/supertab'

"" 256 colorscheme
Plug 'sickill/vim-monokai'      " This is a 'sublime' like colorscheme
Plug 'tomasr/molokai'           " This is the REAL sublime like colorscheme
Plug 'jpo/vim-railscasts-theme' " This is a theme to test

"" Better Status Line
Plug 'bling/vim-airline'
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"" Persistent visuals in vim
Plug 'galli-a/persistentvisuals'

"" Git Wrapper
Plug 'tpope/vim-fugitive'

"" Autocomplete quotes, braces, parens, etc.
Plug 'Raimondi/delimitMate'

"" VIM Perl various syntaxes :-)
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
autocmd BufNewFile,BufRead *.tt setf tt2    " This activate template toolkit syntax highlighting

"" Git diff in real time
Plug 'airblade/vim-gitgutter'

"" JSON syntax highlight
Plug 'elzr/vim-json'

"" Indentation Lines
Plug 'Yggdroot/indentLine'

"" Configuration for Cucumber
Plug 'tpope/vim-cucumber'
au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/cucumber.vim

"" This is to learn GoLang in my free time 
Plug 'fatih/vim-go'

"" Nerd Tree
Plug 'scrooloose/nerdtree'

"" GraphViz Plugin
Plug 'wannesm/wmgraphviz.vim'

"" Highlight Trailing Spaces in Red
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

