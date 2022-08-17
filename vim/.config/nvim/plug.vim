if empty(glob(g:plugInstallPath))
    silent execute '!curl -fLo ' . g:plugInstallPath . ' --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:pluggedPath)
  " Autocompletion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'

  " LSP Support
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

  " LSP Setup
  Plug 'VonHeikemen/lsp-zero.nvim'

  " Easymotion
  Plug 'easymotion/vim-easymotion'

  " Theme
  Plug 'joshdick/onedark.vim'
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

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'

  " Language Syntax
  Plug 'yuezk/vim-js', { 'for': ['javascript', 'javascriptreact'] }
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascriptreact' }
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  Plug 'jparise/vim-graphql'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
