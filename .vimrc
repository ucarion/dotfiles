" Use space as leader
let mapleader=" "

" Enable syntax highlighting
syntax on

" Indent with tabs, default to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Show line numbers
set number

" Aliases
inoremap kj <Esc>
nnoremap <Leader>k m`O<Esc>``
nnoremap <Leader>j m`o<Esc>``

" Specify a test program
function! MakeTestCmd(cmd)
  call feedkeys(":map <leader>t :w\\|:!" . a:cmd . "<cr>\n")
endfunction

command! -nargs=1 MkTest call MakeTestCmd(<f-args>)

" NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/ulyssecarion/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/ulyssecarion/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'bling/vim-airline'

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
