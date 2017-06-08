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
Plugin 'leafgarland/typescript-vim' "type script syntax support
Plugin 'bling/vim-airline' "Airline bar for vim
Plugin 'paranoida/vim-airlineish' "Theme for vim airline
Plugin 'altercation/vim-colors-solarized' "Colorschemes
Plugin 'raimondi/delimitmate' "For adding automatic closing quotes, brackets, etc.
Plugin 'nathanaelkane/vim-indent-guides' "For Showing indent guidelines
Plugin 'elzr/vim-json' "Better json for vim
Plugin 'bronson/vim-trailing-whitespace' "Warn about trailing white spaces
Plugin 'ap/vim-css-color' "Preview color in source code
Plugin 'Shougo/vimproc.vim' "Plugin to run procs inside vim. Please run 'make' command in plugin root dir.
Plugin 'Quramy/tsuquyomi' "Typescript autocompletion
call vundle#end()

filetype plugin indent on

"For solarized theme
"select solarized dark theme from terminal preference menu.
syntax enable
"let g:solarized_termcolors=256 "Degrades colors to 256 bits for solarized
"set t_Co=256 "set terminal to use 256 bit color scheme
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set background=dark
colorscheme solarized

" For Indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"For Ctrlp Plugin key mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"For airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_theme = 'airlineish'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_symbols_readonly = ''
let g:airline_symbols_linenr = ''


"Install powerline fonts from here and select 
"ubuntu mono powerline derivative font from terminal font preference
"https://github.com/powerline/fonts

"For slim template
autocmd BufNewFile,BufRead *.slim set ft=slim

"Fix indentent and tab to two spaces
set tabstop=2
set expandtab
set shiftwidth=2

"Show number and incremental search
set number "Show line numbers
set hlsearch "Highlight search
set incsearch "Enable incremental search
set ignorecase "Ignore case while searching
set smartcase "Ignore case while searching except when first char is capital
set cursorline "Hightlight the current line the cursor is on
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
"Remove trailing white spaces for ruby files
autocmd BufWritePre *.rb :%s/\s\+$//e
"Make the cursor move one row of the screen up or down, rather than per line
"basis when a single line is
"wrapped on the multiple rows on the screen.
nmap j gj
nmap k gk

"to open ctrl-p files in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
