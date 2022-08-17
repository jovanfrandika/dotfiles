" Initialize autocmd
" autocmd!

if has('nvim')
    let g:plugInstallPath = '~/.local/share/nvim/site/autoload/plug.vim'
    let g:pluggedPath = '~/.local/share/nvim/plugged'
else
    let g:plugInstallPath = '~/.vim/autoload/plug.vim'
    let g:pluggedPath = '~/.vim/plugged'
endif

source ~/.config/nvim/plug.vim

" Turn backup and swap files off
set nobackup
set nowb
set noswapfile
set history=750

" Enable syntax highlighting
syntax on
set encoding=utf8
set ffs=unix,dos,mac

"" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256

" Set vim theme 
set termguicolors
colorscheme onedark

" Cursor style
set cursorline
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr    cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" Hide intro message
set shortmess=I

" Hide foldcolumn
:setlocal foldcolumn=0

" Ignore case when searching 
set ignorecase 

" Set clipboard to be able to yank into OS clipboard
set clipboard=unnamedplus

" Enable filetype plugins
filetype plugin on
filetype indent on

" Show line numbers 
set number

" Set relative numbering
set relativenumber

" Set vim background transparency
hi Normal guibg=NONE ctermbg=NONE

source ~/.config/nvim/maps.vim

" INDENTATION 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Turn on smart tab feature
set smarttab

" Set tab to spaces value
set shiftwidth=2
set tabstop=2

" Set indentation options
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" INDENTLINE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent removing quotes from json
autocmd Filetype json let g:indentLine_setConceal = 0

let g:indentLine_indentLevel = 10

" Conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "incv"
let g:indentLine_conceallevel = 2

let g:indentLine_char = '|'

let g:indentLine_leadingSpaceChar = "•"

" 16 Color
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" 256
let g:indentLine_color_term = 239

" True Color
let g:indentLine_color_gui = '#616161'

source ~/.config/nvim/gitgutter.vim
source ~/.config/nvim/svelte.vim
source ~/.config/nvim/vim-closetag.vim
source ~/.config/nvim/defx.vim
source ~/.config/nvim/fzf.vim

lua <<EOF
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
EOF
