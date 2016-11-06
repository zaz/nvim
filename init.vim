call plug#begin('~/.config/nvim/plugged')

" Plugins {
" defaults everyone can agree on.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'

" ctrl-p is a fuzzy file finder.
Plug 'kien/ctrlp.vim'
" airline is a better status line and a tab-bar for nvim.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
" }

call plug#end()

" Map the leader key to ,
let mapleader=","

" General {
" }

" Search {
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Formatting {
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set number              " Show the line numbers on the left side.
set relativenumber      " ... relative to cursor

set esckeys             " Cursor keys in insert mode.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
	set scrolloff=3       " Show next 3 lines while scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

set list                " Show problematic characters.
set listchars=tab:│\ ,trail:◦,extends:#,nbsp:◯ " Highlight problematic whitespace

set spell
set spelllang=en,ru

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" }

" Configuration {
set autochdir           " Switch to current file's parent directory.
set foldenable                  " Auto fold code

" Remove special characters for filename
set isfname-=:
set isfname-==
set isfname-=+

if &undolevels < 200
	set undolevels=200    " Number of undo levels.
endif

" Path/file expansion in colon-mode.
set wildmode=list:longest
set wildchar=<TAB>

" Diff options
set diffopt+=iwhite

" Stop cursor from jumping over wrapped lines
nnoremap j gj
nnoremap k gk
" }

" UI Options {
set cursorline                  " Highlight current line

if has('cmdline_info')
	set ruler                   " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd                 " Show partial commands in status line and
endif

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\                     " Filename
	set statusline+=%w%h%m%r                 " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " Filetype
	set statusline+=\ [%{getcwd()}]          " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Colorscheme options.
set bg=dark
colorscheme solarized

" Relative numbering
function! NumberToggle()
	if(&relativenumber == 1)
		set nornu
		set number
	else
		set rnu
	endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>t :call NumberToggle()<cr>

" Sets a status line. If in a Git repository, shows the current branch.
" Also shows the current file name, line and column number.
"if has('statusline')
"    set laststatus=2

"    " Broken down into easily includeable segments
"    set statusline=%<%f\                     " Filename
"    set statusline+=%w%h%m%r                 " Options
"    "set statusline+=%{fugitive#statusline()} " Git Hotness
"    set statusline+=\ [%{&ff}/%Y]            " Filetype
"    set statusline+=\ [%{getcwd()}]          " Current dir
"    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"endif
" }

" Keybindings {
nnoremap <silent> <C-H> :set tabstop-=1<CR> :set shiftwidth-=1<CR>
nnoremap <silent> <C-C> :set tabstop+=1<CR> :set shiftwidth+=1<CR>

" Save file
nnoremap <Leader>u :update<CR>
"Copy and paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Move between buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>
" }


nmap <Leader>/ :%s##<Left>
nmap <Leader>? :%s##c<Left><Left>
nnoremap <space> za
nnoremap <leader>vrc :tabe ~/.config/nvim/init.vim<cr>
nnoremap Y y$
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
map <Leader>= <C-w>=

" Plugin Settings {
" Airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'solarized'
" }

let g:ycm_always_populate_location_list = 1

" CtrlP {
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
map <C-E> :CtrlPClearCache<CR>
" }
" }

" vim:set ft=vim sw=2 ts=2:
