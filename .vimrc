" NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/ulysse/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/ulysse/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" End NeoBundle Scripts-------------------------

" Use space as leader
let mapleader=" "

" Enable syntax highlighting
syntax on

" Enable mouse scrolling
set mouse=a

" Indent with tabs, default to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

"Enable hidden buffers
set hidden

" Show search results as they come, ignore case unless uppercase appears
set incsearch
set ignorecase
set smartcase

" Prefer 80-char width lines, highlight that position
set textwidth=80
set colorcolumn=+0

" Show line numbers
set number

" Aliases
inoremap kj <Esc>
nnoremap <Leader>k m`O<Esc>``
nnoremap <Leader>j m`o<Esc>``
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Specify a test program
function! MakeTestCmd(cmd)
  call feedkeys(":map <leader>t :w\\|:!" . a:cmd . "<cr>\n")
endfunction

" Delete trailing whitespace on write
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Activate airline by default
set laststatus=2

command! -nargs=1 MkTest call MakeTestCmd(<f-args>)
