
" Set autoreload
set autoread

" Set compatibility to VIM only
set nocompatible

" Force plugins to load correctly
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'preservim/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'


call vundle#end()

" Plugins to load correctly
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Dont write to backup file
set noswapfile

" Set encoding
set encoding=utf-8

" Turn off bells and do visual bell
set noerrorbells
set visualbell

" Tabbing with 4 spaces
set tabstop=4 softtabstop=4

" Highlight line under cursor
set cursorline

" Increase the undo limit
set history=1000

" Automatically wrap text 
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Display 5 lines above/below the cursor when scrolling
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speedup scrolling the VIM
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Show line numbers
set number relativenumber

" Highlight matching search
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only upppercase words with uppercase search term
set smartcase

" Show line and column number of cursor
set ruler

" Use system clipboard
set clipboard=unnamed

" Autosave when switching buffers
set autowrite
set autowriteall

" Set our color scheme/theme
" set termguicolors 
" colorscheme monokai_pro

" Disable mouse
set mouse=

" Switch tabs
map 8 <Esc>:tabe 
map 9 gT
map 0 gt


" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <F9> <Esc><C-W>gF<CR>:tabm<CR>

" Set mapleader to Spacebar
nnoremap <SPACE> <Nop>
let mapleader=" "


