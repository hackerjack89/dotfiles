set nocompatible "tell vim to run vim and not vi
filetype off

"Include vundle runtime
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'slim-template/vim-slim.git'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'paranoida/vim-airlineish'
call vundle#end()

filetype plugin indent on  
syntax enable
"For solarized theme
set t_Co=256 "set terminal to use 256 bit color scheme
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set background=dark
colorscheme solarized

"For airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme = 'airlineish'

"for rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"Fix indentent and tab to two spaces
set tabstop=2
set expandtab
set shiftwidth=2

"Show number and incremental search
set number
set hlsearch
set incsearch

"NredTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR> 
