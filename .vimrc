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
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'plasticboy/vim-markdown'

call neobundle#end()

" Required:
filetype plugin indent on
set smartindent
set expandtab

set formatoptions=
set formatoptions+=r  " Continue comments by default
set formatoptions+=o  " Make comment when using o or O from comment line
set formatoptions+=q  " Format comments with gq
set formatoptions+=n  " Recognize numbered lists
set formatoptions+=2  " Use indent from 2nd line of a paragraph
set formatoptions+=l  " Don't break lines that are already long
set formatoptions+=c  " Format comments
set formatoptions+=t  " Wrap when using textwidth
set formatoptions+=1  " Break before 1-letter words
set formatoptions+=j  " Remove comment characters when joining lines
set formatlistpat=^\\s*\\(\\d\\+\\\|\\*\\\|-\\\|•\\)[\\]:.)}\\t\ ]\\s*

" Default to 2-space tabs. Other languages can override this default.
set tabstop=2
set shiftwidth=2

" If there are uninstalled bundles found on startup, this will conveniently
" prompt you to install them.
NeoBundleCheck

set nowrap

" Set swap-file location
set directory=$HOME/.vim/swapfiles//

" Use space as leader.
let mapleader=" "
nnoremap <space> <nop>

inoremap jk <esc>
inoremap <esc> <nop>

set splitbelow
set splitright

" Use double-leader to quickly switch between two latest files.
nnoremap <leader><leader> :w<cr><c-^>

" A set of functions to insert and remove lines above and below the cursor.
nnoremap <leader>k m`O<esc>``
nnoremap <leader>j m`o<esc>``
nnoremap <leader>dk m`kdd``
nnoremap <leader>dj m`jdd``

" Set font and color scheme
set t_Co=256
syntax on
" set guifont=Source\ Code\ Pro\ 21
set background=dark
let base16colorspace=256
colorscheme base16-default

" Show line numbers
set number


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

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

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

" Highlight a ruler at 80 characters.
set colorcolumn=80

" And add support for hard-wrapping to enforce that limit.
set textwidth=80
set tw=80

" Close YCM preview window
let g:ycm_autoclose_preview_window_after_completion = 1
let g:EclimCompletionMethod = 'omnifunc'
