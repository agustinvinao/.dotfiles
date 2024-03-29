call plug#begin()

Plug 'sonph/onehalf', { 'rtp': 'vim' }                                                " themes
" Plug 'preservim/nerdcommenter'                                                        " commenter
Plug 'ryanoasis/vim-devicons'                                                         " icons and symbols
Plug 'vim-airline/vim-airline'                                                        " Status bar
Plug 'preservim/nerdtree'                                                             " file tree navifation
Plug 'ap/vim-css-color'                                                               " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes'                                                  " Retro Scheme
Plug 'tc50cal/vim-terminal'                                                           " Vim Terminal
Plug 'preservim/tagbar'                                                               " Tagbar for code navigation
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}              " code autompletion
Plug 'jiangmiao/auto-pairs'                                                           " autoclose pairs
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
      \   'do': 'yarn install --frozen-lockfile --production',
      \   'for': [
      \     'javascript',
      \     'typescript',
      \     'css',
      \     'less',
      \     'scss',
      \     'json',
      \     'graphql',
      \     'markdown',
      \     'lua',
      \     'python',
      \     'ruby',
      \     'html',
      \     'solidity'
      \   ]
      \ } " prettier support
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }               " markdown preview
Plug 'tomlion/vim-solidity'                                                           " Syntax files for solidity 
Plug 'tpope/vim-commentary'                                                           " Code commenter 

" not in use
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

call plug#end()


"key mapping
let mapleader = ","

"BASIC UNIVERSAL SETTINGS
set encoding=utf-8

"tab and shiftwidth defaults
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab character
set autoindent

"deal with the lefthand columns
set number                        " show line numbers
set numberwidth                   " show syntax highlighting

"Disable swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Make it obvious where 80 characters is
set textwidth=80

"vim indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"clipboard
set clipboard+=unnamedplus

" A comma-separated list of options for Insert mode completion
set completeopt-=preview " For No Previewvs

" colors / theme
function! LookAndFeelInit()
  syntax on
  set t_Co=256
  set cursorline
  colorscheme onehalfdark
  let g:airline_theme='onehalfdark'
" set dark background and color scheme
" let colorspace=256 " Access colors present in 256 colorspace
" set background=dark
endfunction

" files navigation settings
function! TreeNavigationInit()
  "CHADtree
  " nnoremap <leader>d <cmd>CHADopen<cr>
  " NERDTree
  nnoremap <leader>n :NERDTreeFocus<CR>
  "nnoremap <leader>n :NERDTreeToggle<CR>
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>
endfunction

" tagbar settings
function! TagBarInit()
  nnoremap <C-l> :TagbarToggle<CR>
endfunction


" Airline settings
function! AirlineInit()
  :let g:airline_statusline_ontop = 1
endfunction

" Prettier
" autoformat on save
function! PrettierInit()
 let g:prettier#autoformat = 1
 let g:prettier#autoformat_require_pragma = 0
endfunction

function! CocInit()
  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
endfunction

" function! AleInit()
  " use quickfix list instead of the loclist
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1

  " let g:ale_open_list = 1
  " Set this if you want to.
  " This can be useful if you are combining ALE with
  " some other plugin which sets quickfix errors, etc.
  " let g:ale_keep_list_window_open = 1

  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '.'

  " let g:ale_fixers = {
  "       \   'javascript': ['prettier', 'eslint'],
  "       \   'css': ['prettier', 'eslint'],
  "       \   'sol': ['prettier', 'eslint']
  "       \ }
  " let g:ale_linters = {
  "       \  'solidity': ['solc', 'solhint', 'solium']
  "       \ }
  

  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines','trim_whitespaces'],
  \   'javascript': [
  \       'eslint',
  \       'prettier',
  \   ],
  \   'typescript': [
  \       'eslint',
  \       'prettier',
  \   ],
  \   'html': [
  \       'angular',
  \       'htmlhint',
  \   ]
  \}

  let b:ale_fixers = ['prettier', 'eslint']
  " let g:ale_fixers = {
  "       \ '*': ['remove_trailing_lines','trim_whitespaces'],
  "       \  'javascript': ['prettier', 'eslint'],
  "       \  'solidity': ['prettier', 'eslint']
  "       \ }
  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save = 1

" endfunction

autocmd VimEnter * call AirlineInit()
autocmd VimEnter * call LookAndFeelInit()
autocmd VimEnter * call TreeNavigationInit()
autocmd VimEnter * call TagBarInit()
autocmd VimEnter * call PrettierInit()
autocmd VimEnter * call CocInit()
" autocmd VimEnter * call AleInit()

