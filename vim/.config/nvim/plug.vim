if empty(glob(g:plugInstallPath))
    silent execute '!curl -fLo ' . g:plugInstallPath . ' --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:pluggedPath)
  " Autocompletion
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Easymotion
  Plug 'easymotion/vim-easymotion'

  " Theme
  Plug 'tomasiser/vim-code-dark'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'coreyja/fzf.devicon.vim'

  " File Explorer
  Plug 'Shougo/defx.nvim'
  Plug 'kristijanhusak/defx-icons'
  Plug 'kristijanhusak/defx-git'

  " Search helpers
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  " Editing helpers
  Plug 'tpope/vim-commentary' 
  Plug 'yggdroot/indentline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Snippets
  Plug 'honza/vim-snippets'

  " Language Syntax
  Plug 'yuezk/vim-js', { 'for': ['javascript', 'javascriptreact'] }
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascriptreact' }
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  Plug 'jparise/vim-graphql'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  Plug 'dag/vim-fish', { 'for': 'fish' }

call plug#end()
