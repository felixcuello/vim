" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"
"  VIM Configuration File Optimized for Programming
"
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


" - - - - - - - - - - - - -
"  1. Introduction
" - - - - - - - - - - - - -
"
"  After some time writing code with VIM I have arrived to this configuration
"  file with match most of my needs when coding both Perl and Ruby.
"
"  It's clearly not a definitive file and I will change from time to time
"  but if you get this file I hope it will help you to code faster :-)
"
"  This file come to you with absoulte NO warranty
"  ( specially if you are a bad coder ;) )
"



" - - - - - - - - - - - - - - - - - - - -
"  2. Installation Instructions
" - - - - - - - - - - - - - - - - - - - -
"
"
" 1. Create new backup directories
"  $ mkdir -p ~/.vim/{backup_files,swap_files,undo_files,colors}
"
"
" 2. Download Plugged (which is the plugin manager I decided to use)
"  $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"
" 3. Link to monokai  (you can use molokai if you want)
"  $ ln -s ~/.vim/plugged/molokai/colors/molokai.vim ~/.vim/colors
"  $ ln -s ~/.vim/plugged/vim-monokai/colors/monokai.vim ~/.vim/colors
"


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"  3. Shortcuts!
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
let mapleader = ","                     " Yes!, comma must be the leader

" Fuzzy Finder
map <C-p> :FZF<CR>
map <C-f> <leader>vV
map <leader>a :tabprevious<CR>
map <leader>s :tabnext<CR>
map <leader>q :cp<CR>
map <leader>w :cn<CR>
map <leader>c :SyntasticCheck<CR>
map <leader>d :TagbarToggle<CR><C-w><C-w>
map <Leader>r :RuboCop<CR>
map <leader>t :NERDTree<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"  Don't like backup/swap files everywhere, so I confined them here
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set backupdir=~/.vim/backup_files/
set directory=~/.vim/swap_files/
set undodir=~/.vim/undo_files/

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"  General Vim Configuration
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
syntax on                               " Who can work without syntax highlighting ?
colorscheme molokai

set binary                              " Don't remember :-) (?)
set backspace=2                         " Because I like this backspace behavior
set laststatus=2                        " Status line always present
set nowrap                              " If you're a good coder, you shouldn't note the difference
set noeol                               " Not end of line (?)
set number                              " Numbering lines
set t_Co=256                            " Terminal Colors (Yeah 256 colors is enough)
set wildmenu                            " show a navigable menu for tab completion
set wildmode=longest,list,full          " More configurations for wild-menu


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"  Search Configuration
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set hlsearch                            " Highlight search (sometimes is awful)
set ignorecase                          " Use iwth smart case for best searching experience"
set incsearch                           " Incremental search
set smartcase                           " Use case sensitive smart



" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" To Tab Or Not To Tab, that's the flame-war
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set autoindent                          " Autoindent
set expandtab                           " Use spaces instead tab
set nocindent                           " Good autoindent :-)
set softtabstop=2                       " insert mode tab and backspace 
set shiftwidth=2                        " Don't Remember
set tabstop=2                           " Tab should be 4


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"  Plugins! (and its configurations)
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'                                            " airline - a very nice statys line
Plug 'vim-airline/vim-airline-themes'                               " airline - themes
let g:airline_theme = 'papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
Plug 'dkprice/vim-easygrep'                                         " easygrep
let g:EasyGrepRecursive=1
Plug 'Raimondi/delimitMate'                                         " delimitmate - Autocomplete braces and quotes
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }  " fuzzyfinder - FZF probably the best vim-plugin
Plug 'airblade/vim-gitgutter'                                       " gitgutter - To see git changes beside line numbers
Plug 'tomasr/molokai'                                               " molokai - Sublime like colorscheme
Plug 'sickill/vim-monokai'                                          " monokai - Nice colorscheme
Plug 'scrooloose/nerdtree'                                          " nerdtree - Very nice file manager
Plug 'galli-a/persistentvisuals'                                    " persistentvisuals - This is nice when you use < or > to reindent
Plug 'ngmy/vim-rubocop'                                             " rubocop - Ruby specific to check syntax
let g:vimrubocop_config = '~/rubocop.yml'
let g:vimrubocop_keymap = 0
Plug 'scrooloose/syntastic'                                         " syntastic - Syntax Checker
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
Plug 'majutsushi/tagbar'                                            " tagbar
Plug 'bronson/vim-trailing-whitespace'                              " trailing-whitespace - Mark trailing whitespaces in red

call plug#end()
