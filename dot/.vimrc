""" Plugins
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript' " JS highligting
Plug 'digitaltoad/vim-pug' " PUG highligting
Plug 'leafgarland/typescript-vim' " TS highlighting
Plug 'hashivim/vim-terraform' " TF highlighting

call plug#end()

""" Display options
if has("gui_running")
	set background=light
else
"	set background=dark
	colorscheme desert
  " Hack: Override colorscheme desert light background
  " Ref: highlight Normal ctermfg=231 ctermbg=236 guifg=#ffffff guibg=#333333
  highlight Normal ctermfg=231 ctermbg=16 guifg=#ffffff guibg=#000000
endif
set ruler
" WIP: Disable "syntax" as it conflicts with "colorscheme"
"syntax on

""" Filetype settings
filetype plugin on
filetype indent on

" c files settings (modifies ~/.vim/syntax/c.vim)
let c_space_errors=1
set modeline

" Set specific unknown file extensions to file types
augroup filetypedetect
  au BufRead,BufNewFile *.inc set filetype=htmldjango
augroup END

" Write files as they are, don't mess with line endings etc.
set binary
set noswapfile

"" Indent Spacing

" 2 width spaces default
set shiftwidth=0
set tabstop=2
set expandtab
set shiftround

" 4 width tabs for
"  - djangohtml
autocmd Filetype htmldjango setlocal ts=4 noexpandtab

" 4 width spaces for
"  - python
autocmd Filetype python setlocal ts=4 expandtab
"  - pug
autocmd Filetype pug setlocal ts=4 expandtab

" 2 width spaces for
"  - javascript
autocmd Filetype javascript setlocal ts=2 expandtab
autocmd Filetype typescript setlocal ts=2 expandtab
"  - terraform
autocmd Filetype terraform setlocal ts=2 expandtab

" 8 width tabs for
"   - golang
autocmd Filetype go setlocal ts=8 sw=8 noexpandtab

""" Code Navigation

" tags settings
let &tags=$MYCTAGSFILE

""" Search options
set ignorecase
set smartcase
set hlsearch

""" FUNCTIONS

" Convert Windows punctuation to Unix punctuation
function Dosp2unix()
	echo "Converting Windows punctuation to Unix punctuation"
	%s/“/"/g
	%s/”/"/g
	%s/’/'/g
	%s/•/\*/g
endf
