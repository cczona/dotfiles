source $HOME/.vimrc

" if has('gui_running')
"   " Always show file types in menu
"   let do_syntax_sel_menu=1
" endif


if has("gui_running") && has("menu") 
  let do_syntax_sel_menu = 1 
  autocmd VimEnter * map {lhs} {rhs} 
endif 


set ft=cpp 
set nolist

set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes


""""""""
" IMPORTANT: enabling these settings does bad things in MacVim
" set backup=on
" set syntax on
" set writebackup=on/off
""""""""
