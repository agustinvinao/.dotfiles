" .vimrc

source ~/.vimrc.bundles

set encoding=utf-8
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I ttytype
set ignorecase
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
syntax on                         " show syntax highlighting
filetype plugin indent on
let mapleader=" "                 "Map Leader to space

"Disable swap/backup files
set nobackup
set nowritebackup
set noswapfile

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" set dark background and color scheme
let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256 " 256 color mode
set background=dark
colorscheme base16-tomorrow
"highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Make it obvious where 80 characters is
set textwidth=80


" Switch between the last two files
nnoremap <leader><leader> <c-^>


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Always use vertical diffs
set diffopt+=vertical

"Make vim multiple cursors compatible with neocomplete
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
" use silver searcher for ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"watch for changes in .vimrc and automatically reload the config.
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"NERDTree
silent! nmap <C-e> :NERDTreeTabsToggle<CR>
"let g:NERDTreeWinSize = 40

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>











"
" map Silver Searcher
map <leader>a :Ag!<space>
"
" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown

"" Enable spellchecking for Markdown
"autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" Tab completion
"will insert tab at beginning of line,
"will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"function! RunTests(filename)
  " Write the file and run tests for the given filename
  ":w
  ":silent !clear
  "if match(a:filename, '\.feature$') != -1
    "exec ":!bundle exec cucumber " . a:filename
  "elseif match(a:filename, '_test\.rb$') != -1
    "if filereadable("bin/testrb")
      "exec ":!bin/testrb " . a:filename
    "else
      "exec ":!ruby -Itest " . a:filename
    "end
  "else
    "if filereadable("Gemfile")
      "exec ":!bundle exec rspec --color " . a:filename
    "else
      "exec ":!rspec --color " . a:filename
    "end
  "end
"endfunction

"function! SetTestFile()
  "" set the spec file that tests will be run for.
  "let t:grb_test_file=@%
"endfunction

"function! RunTestFile(...)
  "if a:0
    "let command_suffix = a:1
  "else
    "let command_suffix = ""
  "endif
"
  " run the tests for the previously-marked file.
  "let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  "if in_test_file
    "call SetTestFile()
  "elseif !exists("t:grb_test_file")
    "return
  "end
  "call RunTests(t:grb_test_file . command_suffix)
"endfunction

"function! RunNearestTest()
  "let spec_line_number = line('.')
  "call RunTestFile(":" . spec_line_number . " -b")
"endfunction

" run test runner
"map <leader>t :call RunTestFile()<cr>
"map <leader>T :call RunNearestTest()<cr>

"THOUGHTBOT EXTRA CONFIGS
"set history=50
"set ruler         " show the cursor position all the time
"set showcmd       " display incomplete commands
"set incsearch     " do incremental searching
"set laststatus=2  " Always display the status line
"set autowrite     " Automatically :write before running commands

"augroup vimrcEx
  "autocmd!
"
  "" When editing a file, always jump to the last known cursor position.
  "" Don't do it for commit messages, when the position is invalid, or when
  "" inside an event handler (happens when dropping a file on gvim).
  "autocmd BufReadPost *
    "\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    "\   exe "normal g`\"" |
    "\ endif


" Run commands that require an interactive shell
"nnoremap <Leader>r :RunInInteractiveShell<space>

"" Set spellfile to location that is guaranteed to exist, can be symlinked to
"" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
"set spellfile=$HOME/.vim-spell-en.utf-8.add

" map . in visual mode
"vnoremap . :norm.<cr>

" map markdown preview
"map <leader>m :!open -a Marked %<cr><cr>

" map git commands
"map <leader>b :Gblame<cr>
"map <leader>l :!clear && git log -p %<cr>
"map <leader>d :!clear && git diff %<cr>
