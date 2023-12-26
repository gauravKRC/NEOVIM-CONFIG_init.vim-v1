" Enable "evil" mode:
let g:mapleader = ","
set termguicolors
syntax enable
set background=dark
set cursorline  " Highlight the current line
set clipboard=unnamedplus  " Enable system clipboard integration
set showmatch  " Highlight matching parentheses/braces
set pastetoggle=<F2>  " Toggle paste mode with F2
set cursorcolumn
set laststatus=2
set smartindent
set expandtab
let g:indentLine_enabled = 1

" Line Numbers
set number   " Show line numbers
set relativenumber  " Show relative line numbers

" Indentation and Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Mouse Support
set mouse=a  " Enable mouse support

" Auto Indentation
set autoindent


"""""""""""""""""""""""""""plugins"""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/site/plugged')

" Auto pairs and closing brackets
Plug 'jiangmiao/auto-pairs'

" File explorer
Plug 'preservim/nerdtree'

" Syntax highlighting and language support
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Statusline
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'morhetz/gruvbox'

" Syntax highlighting and language support
Plug 'sheerun/vim-polyglot'

" Statusline
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sjl/badwolf'
Plug 'vim-evil/vim-evil'

" Python Indentation According to PEP 8 Guidelines
Plug 'Vimjas/vim-python-pep8-indent'

" Autocompletion, Function Signatures, and More for Python
Plug 'davidhalter/jedi-vim'

" Python Linting Engine for Error Detection and Style Checking
Plug 'dense-analysis/ale'
""""""""""""""""""""""""
Plug 'kylechui/nvim-surround'
Plug 'Wansmer/treesj'
Plug 'kevinhwang91/nvim-bqf'
Plug 'https://github.com/f-person/git-blame.nvim'
Plug 'folke/trouble.nvim'
"PLUGINS FOR DOT OS


call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""keybindings""""""""""""""""""""""""""""""""
" NERDTree Mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" Save with Ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Undo, Cut, Copy, Paste Mappings (Normal Mode)
nnoremap <C-z> :undo<CR>
nnoremap <C-x> "x"+x
nnoremap <C-c> "y"+y
nnoremap <C-v> "*p

" Undo, Cut, Copy, Paste Mappings (Visual Mode)
vnoremap <C-z> :undo<CR>
vnoremap <C-x> "x"+x
vnoremap <C-c> "y"+y
vnoremap <C-v> "*p

" Delete Selection After Backspace
vnoremap <BS> d
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set colorscheme
"colorscheme gruvbox
colorscheme badwolf



let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" Configure Coc.nvim
let g:coc_global_extensions = [
  \ 'coc-tsserver',        
  \ 'coc-eslint',          
  \ 'coc-prettier',
  \ 'coc-json',            
  \ 'coc-html',            
  \ 'coc-css',            
  \ ]

" Set omnifunc for specific file types
autocmd FileType javascript,typescript,html,css,json setlocal omnifunc=coc#complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Whiteboard()
  let winnr = winnr()
  let tmpfile = tempname()
  let bufnr = bufnr(tmpfile)
  if bufnr == -1
    execute 'silent bufnew' tmpfile
  endif
  setlocal nobuflisted noswapfile
  setlocal modifiable
  colorscheme pencil
  call pencil#pencil_mode()
  setlocal cursorline
  au BufLeave <buffer> exe 'bw!' tmpfile
endfunction

command! Whiteboard call Whiteboard()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
