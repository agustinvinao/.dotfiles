call plug#begin()

" themes
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" files tree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'preservim/nerdtree'

" commenter
Plug 'preservim/nerdcommenter'

" icons and symbols
Plug 'ryanoasis/vim-devicons'
" Plug 'https://github.com/adelarsq/vim-devicons-emoji'

call plug#end()



"key mapping
let mapleader = ","

"BASIC UNIVERSAL SETTINGS
set encoding=utf-8

"tab and shiftwidth defaults
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab character

"deal with the lefthand columns
set number                        " show line numbers
set numberwidth                   " show syntax highlighting

" colors / theme
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

"Disable swap/backup files
set nobackup
set nowritebackup
set noswapfile

" set dark background and color scheme
" let colorspace=256 " Access colors present in 256 colorspace
" set background=dark

" Make it obvious where 80 characters is
set textwidth=80

"vim indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"clipboard
set clipboard+=unnamedplus

"CHADtree
nnoremap <leader>d <cmd>CHADopen<cr>
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
