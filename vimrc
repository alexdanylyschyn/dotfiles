set nocompatible

" Enhance command-line completion
set wildmenu
 
" Enable syntax highlighting
syntax on

" Enable line numbers
:set number

" Make tabs as wide as two spaces
set tabstop=2

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Don't use swap files.  Move other files to ~/.vim
set swapfile!
set backupdir+=~/.vim/backup//
if exists('&undofile')
	set undodir=~/.vim/undo//
	set undofile
endif

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Netrw settings
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 4