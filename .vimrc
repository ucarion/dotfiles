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
NeoBundle 'tpope/vim-sensible'
NeoBundle 'wting/rust.vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'tmhedberg/matchit'

call neobundle#end()

" Required:
filetype plugin indent on
set smartindent
set expandtab

" Default to 2-space tabs. Other languages can override this default.
set tabstop=2
set shiftwidth=2

" If there are uninstalled bundles found on startup, this will conveniently
" prompt you to install them.
NeoBundleCheck

set nowrap

" Use space as leader.
let mapleader=" "
nnoremap <space> <nop>

inoremap jk <esc>
inoremap <esc> <nop>

" Use double-leader to quickly switch between two latest files.
nnoremap <leader><leader> <c-^>

" A set of functions to insert and remove lines above and below the cursor.
nnoremap <leader>k m`O<esc>``
nnoremap <leader>j m`o<esc>``
nnoremap <leader>dk m`kdd``
nnoremap <leader>dj m`jdd``

" Set font and color scheme
set t_Co=256
syntax on
" set guifont=Source\ Code\ Pro\ 21
colorscheme zenburn

" Show line numbers
set number

" Highlight a ruler at 80 characters.
set colorcolumn=80

" And add support for hard-wrapping to enforce that limit.
set textwidth=80

" Highlight current line
set cursorline

" Remove trailing whitespace on save.
fun! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

function! MakeTestCmd(cmd)
  call feedkeys(":map <leader>t :w\\|:!" . a:cmd . "<cr>\n")
endfunction

command! -nargs=1 MkTest call MakeTestCmd(<f-args>)

" Get CtrlP to ignore gitignored files.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Stuff from Gary Bernhardt.

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":!bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
" map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>

" End of Gary stuff.
