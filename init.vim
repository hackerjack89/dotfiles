set nocompatible "tell vim to run vim and not vi
filetype off
call plug#begin('~/.config/nvim/plugged')
Plug 'raimondi/delimitmate' "For adding automatic closing quotes, brackets, etc.
"Plug 'mattn/emmet-vim', {'for': 'html'} "html tag generator
"Plug 'elzr/vim-json' "Better json for vim
Plug 'Shougo/neosnippet' "for js snippets
Plug 'Shougo/neosnippet-snippets' "for js snippets
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'carlitux/deoplete-ternjs' "For js autocompletion
Plug 'tpope/vim-surround'
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'machakann/vim-highlightedyank' "highlight yanked text,because of this, no need of visual mode selection
Plug 'kshenoy/vim-signature'
Plug 'dyng/ctrlsf.vim'
"Plug 'lifepillar/vim-solarized8'
"Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'ryanoasis/vim-devicons'
" Colorscheme (includes its own airline theme)
Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'

Plug 'bling/vim-airline' "Airline bar for vim
"{{{
  "Install powerline fonts from here and select ubuntu mono powerline derivative font
  "https://github.com/powerline/fonts from terminal font preference
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'

  let g:airline#extensions#ale#error_symbol='〤'
  let g:airline#extensions#ale#warning_symbol='W:'
"}}}

Plug 'Yggdroot/indentLine'
"{{{
  let g:indentLine_char = '⎸'
"}}}

Plug 'w0rp/ale' "Check code for erros in realtime
"{{{
  "For fixing errors by ale
  " Fix files with ESLint.
  let g:ale_fixers = ['eslint']

  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

  let g:ale_sign_error = '✖︎'
  let g:ale_sign_warning = 'ꟺ'
  let g:ale_sign_info = 'i'

  "enabling ale highlighting
  let g:ale_set_highlights = 1

  " Set this variable to 1 to fix files when you save them.
  let g:ale_fix_on_save = 1

  "color for highlight of error/warning sign
  "highlight clear ALEErrorSign
  "highlight clear ALEWarningSign

  "Show fix list in a widow
  "let g:ale_open_list = 1

  "Ale next and previous error key binding
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
"}}}

Plug 'majutsushi/tagbar'
"{{{
  nmap <F8> :TagbarToggle<CR>
"}}}

Plug 'mhinz/vim-startify'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"{{{
  "open nerdtree with ctrl+n
  map <C-n> :NERDTreeToggle<CR>
  "open nerdtree when dir is opened
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  "close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  "nerdtree ignore files
  let g:NERDTreeIgnore=['\~$', 'node_modules', 'mochawesome-reports']

  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1

  let NERDTreeAutoDeleteBuffer = 1

  let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
  let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
  let NERDTreeNodeDelimiter = "\u263a" " smiley face
  "let NERDTreeMinimalUI = 1 "removes the top bar of ? For help in nerdtree
"}}}


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"{{{
  let g:deoplete#enable_at_startup = 1 " Use deoplete.
  " Plugin key-mappings. Note: It must be 'imap' and 'smap'.  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior. Note: It must be 'imap' and 'smap'.  It uses <Plug> mappings.
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  "Deoplete ternjs Whether to include the types of the completions in the result data. Default: 0
  let g:deoplete#sources#ternjs#types = 1
"}}}

Plug 'moll/vim-node', {'for': 'javascript'}
"{{{
  " open the file under the cursor in a new vertical split
  autocmd User Node
    \ if &filetype == "javascript" |
    \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
    \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
    \ endif
"}}}

Plug 'junegunn/fzf.vim'
"{{{
  "invoke fzf with key binding
   nnoremap <silent> <leader><space> :Files<CR>
   nnoremap <silent> <leader>b :Buffers<CR>
   nnoremap <silent> <leader>w :Windows<CR>
 "}}}

Plug 'junegunn/vim-easy-align' "A simple, easy-to-use Vim alignment plugin.
"{{{
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ea <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ea <Plug>(EasyAlign)
"}}}

Plug 'ap/vim-css-color', {'for': 'css'} "Preview color in source code
Plug 'mustache/vim-mustache-handlebars', {'for': ['hbs','mustache', 'handlebars']} "For handlebar and mustache
Plug 'tpope/vim-rails', {'for': ['rails', 'ruby']} "Rails support
Plug 'scrooloose/nerdcommenter'

call plug#end()


filetype plugin indent on

syntax enable
set background=dark
colorscheme gruvbox

"Fix indentent and tab to two spaces
set tabstop=2 expandtab shiftwidth=2 foldmethod=indent

"Set absolute number when window not in focus otherwise relative number as
"stated above
set list
set nu "Show line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set cursorline "Hightlight the current line the cursor is on

"Make the cursor move one row of the screen up or down, rather than per line
"when a single line is wrapped on the multiple rows on the screen.
nmap j gj
nmap k gk

"Remove trailing spaces before saving
autocmd BufWritePre * %s/\s\+$//e

"For slim template
"autocmd BufNewFile,BufRead *.slim set ft=slim


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

"when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
"This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null
