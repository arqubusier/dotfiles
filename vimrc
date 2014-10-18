" line numbers
set number

" various settings
filetype on
filetype indent plugin on
let mapleader=","

" Pathogen
execute pathogen#infect()

" gui widgets
"set go-=m "remove menu bar
set go-=T "remove toolbar
set go-=r "remove scrollbars
set go-=L 

" solarized
syntax enable
set background=dark
colorscheme solarized

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
set expandtab


set autoindent

" mappings
" clipboard copy/paste
nnoremap <M-c> "+y
nnoremap <M-v> "+p
nnoremap <F2> :w<cr>


nnoremap ; :
inoremap hh <Esc>
nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>bp :bprev<cr>
nnoremap <Leader>tn :tabn<cr>
nnoremap <Leader>tp :tabp<cr>
nnoremap <Leader>pdb aimport pdb; pdb.set_trace()<Esc>

" backspace
set backspace=indent,eol,start 

" Functions

function! FormatProse()
    set textwidth=79
    set formatoptions=at1
    set spell spelllang=sv
endfunction

function! FormatCode()
    set formatoptions=cq
    set nospell
endfunction

" Commands

command! Prose call FormatProse()
command! Code call FormatCode()

if has("win32") || has("win64")
    set directory=$TMP 
else
    set directory=~/tmp,.
end
