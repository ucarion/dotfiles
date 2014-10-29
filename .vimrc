" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'hdima/python-syntax'

call neobundle#end()

" Required:
filetype plugin indent on
set smartindent
set expandtab

" If there are uninstalled bundles found on startup, this will conveniently
" prompt you to install them.
NeoBundleCheck

let mapleader=","

nnoremap <leader><leader> <c-^>

" A set of functions to insert and remove lines above and below the cursor.
nnoremap <leader>k m`O<esc>``
nnoremap <leader>j m`o<esc>``
nnoremap <leader>dk m`kdd``
nnoremap <leader>dj m`jdd``

" Set font and color scheme
set guifont=Consolas:h22
colorscheme lucius
set background=dark

" Have vim fill up the screen
set lines=9999 columns=999

" Highlight a ruler at 70 characters.
set colorcolumn=80

" And add support for hard-wrapping to enforce that limit.
set textwidth=80

" hi NonText guifg=DarkGray
