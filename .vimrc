set rtp+=~/.vim/autoload/

call plug#begin('~/.vim/autoload')

Plug 'nanotech/jellybeans.vim',
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
Plug 'scrooloose/nerdtree',
Plug 'neovimhaskell/haskell-vim',
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-surround',
Plug 'tpope/vim-sensible',
Plug 'tpope/vim-unimpaired',
Plug 'ervandew/supertab',
Plug 'bronson/vim-trailing-whitespace',
Plug 'jiangmiao/auto-pairs',
Plug 'chr4/nginx.vim',
Plug 'rbgrouleff/bclose.vim',
Plug 'pearofducks/ansible-vim'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1"
colorscheme jellybeans

syntax on
filetype plugin indent on

set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2
set noshowmode
set incsearch
set hlsearch
set shortmess+=A
set encoding=utf-8
set completeopt-=preview
set nospell
set noswapfile
set noerrorbells
set novisualbell
set autowrite
set autowriteall
set autoread
set list
set nowrap
set ruler
set updatetime=100
set ttyfast
set lazyredraw

" KEYBINDIGS
inoremap <S-Insert> <C-r>*
inoremap <C-v> <C-r>*
cnoremap <S-Insert> <C-r>*
cnoremap <C-v> <C-r>*
nnoremap <C-S> :update
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-c> "+y
vnoremap <C-d> "+d
map <C-n> :NERDTreeToggle<CR>


" Unmap Arrows
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
"
"Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
