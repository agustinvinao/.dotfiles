"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/sergio/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/sergio/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/sessionman.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/restore_view.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mbbill/undotree'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'tpope/vim-rails'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/gist-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-markdown'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let &colorcolumn="80,".join(range(120,999),",")
let g:airline_powerline_fonts=1
set term=screen-256color
set hidden
set number
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
syntax on
color Tomorrow-Night