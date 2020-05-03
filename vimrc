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

" Color scheme
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

set autochdir

" Wim wiki


" Instant markdown


" mappings
" clipboard copy/paste
nnoremap <M-c> "+y
nnoremap <M-v> "+p
nnoremap <F2> :wa<cr>
nnoremap <F3> :source ~/.vimrc<cr>


nnoremap ; :
inoremap hh <Esc>
nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>bp :bprev<cr>
nnoremap <Leader>tn :tabn<cr>
nnoremap <Leader>tp :tabp<cr>
nnoremap <Leader>pdb oimport pdb; pdb.set_trace()<Esc>
nnoremap <Leader>pudb oimport pudb; pu.db<Esc>

map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

map <Leader>nt :NERDTree<cr>

" backspace
set backspace=indent,eol,start 

" Functions

function! FormatProse()
    set textwidth=79
    set formatoptions=at1
endfunction

function! FormatProseSe()
    call FormatProse()
    set spell spelllang=sv
endfunction

function! FormatProseEn()
    call FormatProse()
    set spell spelllang=en
endfunction

function! Spell()
    set spell spelllang=en
endfunction

function! NoSpell()
    set nospell
endfunction

function! FormatCode()
    set textwidth=79
    set formatoptions=cq
    set nospell
endfunction

" Commands

command! Prose call FormatProseSe()
command! ProseEn call FormatProseEn()
command! Code call FormatCode()

if has("win32") || has("win64")
    set directory=$TMP 
else
    set directory=~/tmp,.
end
