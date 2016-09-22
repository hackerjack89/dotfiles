set nocompatible "tell vim to run vim and not vi
filetype off

"Include vundle runtime
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim' "vundle itself
Plugin 'tpope/vim-rails' " Rails support
Plugin 'MarcWeber/vim-addon-mw-utils' " Utility library  
Plugin 'tomtom/tlib_vim' "utility library
Plugin 'mattn/emmet-vim' "html tag generator
Plugin 'slim-template/vim-slim.git' "slim plugin support
Plugin 'scrooloose/syntastic' "syntax checker
Plugin 'kchmck/vim-coffee-script' "Coffee script syntax support
Plugin 'leafgarland/typescript-vim' "type script syntax support
Plugin 'bling/vim-airline' "Airline bar for vim
Plugin 'paranoida/vim-airlineish' "Theme for vim airline
Plugin 'flazz/vim-colorschemes' "Colorschemes
Plugin 'altercation/vim-colors-solarized' "Colorschemes
Plugin 'scrooloose/nerdcommenter' "Commenting plugin
call vundle#end()

filetype plugin indent on  
"For solarized theme
syntax enable
let g:solarized_termcolors=256
set t_Co=256 "set terminal to use 256 bit color scheme
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set background=dark
colorscheme solarized

"For airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme = 'airlineish'

"For slim template
autocmd BufNewFile,BufRead *.slim set ft=slim

"Fix indentent and tab to two spaces
set tabstop=2
set expandtab
set shiftwidth=2

"Show number and incremental search
set number
set hlsearch
set incsearch
set ignorecase
set smartcase

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR> 
"Remove trailing white spaces for ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e
"Make the cursor move one row of the screen up or down, rather than per line
"basis when a single line is
"wrapped on the multiple rows on the screen.
nmap j gj
nmap k gk

