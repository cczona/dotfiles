call pathogen#infect()
syntax on
filetype plugin indent on
runtime macros/matchit.vim
set t_Co=256
set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set incsearch
set hlsearch
set number
set ruler
set directory=/tmp
set title
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set novisualbell
set noerrorbells
set pastetoggle=<F2>
set showbreak=...
set wrap linebreak nolist
"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TagbarToggle<CR>

let g:ctrlp_map = '<c-p>'

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"add some line space for easy reading
set linespace=4

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
" for C
au FileType c setl ts=8 sw=4 softtabstop=4 noexpandtab
set autoindent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=254
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=255

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set mouse=
set ttymouse=xterm2

set hidden

" Map ctrl-movement keys to window switching
nnoremap <c-k> <C-w><Up>
nnoremap <c-j> <C-w><Down>
nnoremap <c-l> <C-w><Right>
nnoremap <c-h> <C-w><Left>

" Map - and = to resize window
nnoremap - <C-W>_
nnoremap = <C-W>=
