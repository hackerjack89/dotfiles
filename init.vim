set nocompatible "tell vim to run vim and not vi
filetype off
call plug#begin('~/.config/nvim/plugged')
Plug 'raimondi/delimitmate' "For adding automatic closing quotes, brackets, etc.
Plug 'mattn/emmet-vim' ", {'for': ['html', 'erb']} html tag generator
"{
  "let g:user_emmet_leader_key='<C-Q>'
"}
Plug 'pangloss/vim-javascript'
"{
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_conceal_function             = "ƒ"
  let g:javascript_conceal_null                 = "ø"
  let g:javascript_conceal_this                 = "@"
  let g:javascript_conceal_return               = "⇚"
  let g:javascript_conceal_undefined            = "¿"
  let g:javascript_conceal_NaN                  = "ℕ"
  let g:javascript_conceal_prototype            = "¶"
  let g:javascript_conceal_static               = "•"
  let g:javascript_conceal_super                = "Ω"
  let g:javascript_conceal_arrow_function       = "⇒"
  let g:javascript_conceal_noarg_arrow_function = "🞅"
  let g:javascript_conceal_underscore_arrow_function = "🞅"

  map <leader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
"}
Plug 'tpope/vim-surround'
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank' "highlight yanked text,because of this, no need of visual mode selection
Plug 'kshenoy/vim-signature'
Plug 'dyng/ctrlsf.vim' "For async searching in codebase.
"Plug 'lifepillar/vim-solarized8'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier'
Plug 'ryanoasis/vim-devicons'
" colorschemes
"{
  Plug 'morhetz/gruvbox'
  Plug 'sickill/vim-monokai'
  Plug 'tomasr/molokai'
  Plug 'joshdick/onedark.vim'
  Plug 'doums/darcula'
  Plug 'sainnhe/everforest'
  Plug 'rakr/vim-one'
  Plug 'nlknguyen/papercolor-theme'
"}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
Plug 'vim-test/vim-test'
"{
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>
"}

Plug 'bling/vim-airline' "Airline bar for vim
"{{{
  "Install powerline fonts from here and select ubuntu mono powerline derivative font
  "https://github.com/powerline/fonts from terminal font preference
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#coc#enabled = 1
  let g:airline#extensions#fzf#enabled = 1
  let airline#extensions#coc#error_symbol = '〤'
  let airline#extensions#coc#warning_symbol = 'ꟺ'
  let g:airline#extensions#coc#show_coc_status = 1
  let g:airline_theme='onedark'

"}}}
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'
"{
  let g:indentLine_char = '⎸'
"}

Plug 'majutsushi/tagbar'
"{
  nmap <F8> :TagbarToggle<CR>
"}

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
  "let g:NERDTreeIgnore=['\~$', 'node_modules', 'mochawesome-reports']

  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1

  let NERDTreeAutoDeleteBuffer = 1

  "let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
  "let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
  let NERDTreeNodeDelimiter = "\u263a" " smiley face
  let NERDTreeMinimalUI = 1 "removes the top bar of ? For help in nerdtree
"}}}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"{
  "CoC extensions
  "
  "Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  "Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  "fix coc-spellchecker
  vmap <leader>a <Plug>(coc-codeaction-selected)
  nmap <leader>a <Plug>(coc-codeaction-selected)
  let g:coc_global_extensions = ['coc-tsserver', 'coc-solargraph', '@yaegassy/coc-marksman', '@yaegassy/coc-nginx', 'coc-emmet', 'coc-highlight', 'coc-spell-checker', 'coc-pyright', 'coc-json']
"}

Plug 'moll/vim-node'
"{
  " open the file under the cursor in a new vertical split
  autocmd User Node
    \ if &filetype == "javascript" |
    \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
    \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
    \ endif
"}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"{
  "invoke fzf with key binding
   nnoremap <silent> <leader><space> :Files<CR>
   nnoremap <silent> <leader>b :Buffers<CR>
   nnoremap <silent> <leader>w :Windows<CR>
"}

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
Plug 'christoomey/vim-rfactory', {'for': ['rails', 'ruby']}
Plug 'chrisbra/csv.vim'

call plug#end()


filetype plugin indent on

syntax enable
set background=dark
colorscheme everforest

"Fix indentent and tab to two spaces
set tabstop=2 expandtab shiftwidth=2 foldmethod=indent

set list
set nu "Show line numbers

set cursorline "Hightlight the current line the cursor is on

"Make the cursor move one row of the screen up or down, rather than per line
"when a single line is wrapped on the multiple rows on the screen.
nmap j gj
nmap k gk

"Remove trailing spaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set history=100         " remember more commands and search history
set undolevels=100      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

autocmd BufWritePost,FileWritePost *.rb silent! !rubocop -a <afile>
set completeopt-=preview
