set nocompatible          "not compatible with vi

" Automatic installation for vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" START: vim-plug configuration
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Autocomplete plugin
Plug 'zxqfl/tabnine-vim'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'kchmck/vim-coffee-script'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-webdevicons'

call plug#end()
" END: vim-plug configuration

set incsearch             "Incremental search
set hlsearch
syntax on                 "allow colorize filetype and indent it
set number                "show number lines in files
set t_Co=256              "256 color mode
colorscheme jellybeans

set encoding=utf-8        "Encoding UTF8
set fileencoding=utf8     "Unicode man

set re=1                  " Force to use a newer regex engine
set ls=2                  "Always show status line in all windows
set autoindent            "Auto indent on new line
set expandtab             "tabs to spaces
set smarttab              "tabs to spaces
set tabstop=2             "Tabs are 2 spaces in width
set shiftwidth=2          "Autodindent to 2 spaces width
set softtabstop=2         "Autodindent to 2 spaces widt
set scrolloff=10          "Start scrolling when 10 lines close to the bottom
set smartindent
set ruler                 "Shows current file position
" set statusline=%<%f\ %h%m%y%r%=%-14.(%l,%c%V%)\ %P

set cursorcolumn          "Highlight current column
set cursorline            "Highlight current row
set novisualbell          "Don't shake the screen
set number                "show line numbers
set title                 "Change title of window based on file
set ttyfast               "Smoother display for fast terminals
set hidden                "Don't close buffers when changing files
set wildchar=<Tab>        "Tab expands wildcards

set backspace=indent,eol,start "Allow backspacing over tabs end of lines and start of insert
set wildmenu              "as above
set wildmode=longest:full,full "Better tab completion of filenames (like bash)
set foldmethod=indent
set foldlevel=999
set nowrap

" color column config
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

:let mapleader = ","

function AddDebug()
  execute "normal Orequire 'pry'; binding.pry;\<Esc>"
endfunction
map <leader>b :call AddDebug()<cr>

:command WQ wq
:command Wq wq
:command WA wa
:command Wa wa
:command W w
:command Q q
:command Qa qa

" custom colors
function SetLinesDefault()
  hi CursorLine   cterm=NONE ctermbg=88
  hi CursorColumn cterm=NONE ctermbg=88
endfunction
function SetLinesHighlight()
  hi CursorLine   cterm=NONE ctermbg=28 ctermfg=15
  hi CursorColumn cterm=NONE ctermbg=28 ctermfg=15
endfunction

hi clear CursorColumn
call SetLinesDefault()
autocmd InsertEnter * call SetLinesHighlight()
autocmd InsertLeave * call SetLinesDefault()

" Only highlight current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorline
  au WinLeave * setlocal nocursorcolumn
augroup END

set nobackup
set writebackup
set backupdir=~/.vim/tmp//  "Store backups in same dir
set directory=~/.vim/tmp//  "Store swps in same dir
set ignorecase
set smartcase
set sidescrolloff=5

"Custom filetypes
au BufNewFile,BufRead *.ctp set filetype=html
au BufNewFile,BufRead *.ui set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Fudgefile set filetype=ruby

" disable F1 for show help, we can show it wiht :help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Nerdcommenter options
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"NERDTree toggle
map <c-T> :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<cr>
let NERDTreeWinPos='right'
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 30

" <F2> set paste toggle
set pastetoggle=<F2>
set showmode

" CtrlP plugin config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

" Tagbar plugin config
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left=1

" vim-indent-guides plugin config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'flog']
let g:syntastic_javascript_checkers = ['eslint']
" Not needed we have to configure manually eslint
" let g:syntastic_javascript_eslint_exec = '~/sites/gac/s1_gac_ui/node_modules/.bin/eslint'

" Get yankring out of the way
let g:yankring_history_dir = '~/.vim/tmp'

" Set minium window size
set wmh=0

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufRead *.erb set filetype=eruby
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

