" To activate, add the following to ~/.vimrc
" source $HOME/.vim/config.vim
"
" Add this before you include the config to enable light mode.
" let g:light_editor=1

" Make vim more useful. Just fixes quite a few compatibility issues.
set nocompatible

" Change the leader to something a bit easier to hit.
let mapleader=','

" Enable better indentation.
set autoindent smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

if !exists('g:light_editor')
	" Load Vundle. Manages all of the bundles.
	filetype off
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	
	" Specify all bundles.
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'Raimondi/delimitMate'
	Bundle 'Valloric/YouCompleteMe'
	Bundle 'gerw/vim-HiLinkTrace'
	Bundle 'gmarik/vundle'
	Bundle 'groenewege/vim-less'
	Bundle 'helino/vim-json'
	Bundle 'jelera/vim-javascript-syntax'
	Bundle 'jistr/vim-nerdtree-tabs'
	Bundle 'juvenn/mustache.vim'
	Bundle 'kien/ctrlp.vim'
	Bundle 'majutsushi/tagbar'
	Bundle 'mileszs/ack.vim'
	Bundle 'nathanaelkane/vim-indent-guides'
	Bundle 'scrooloose/nerdcommenter'
	Bundle 'scrooloose/nerdtree'
	Bundle 'scrooloose/syntastic'
	Bundle 'tpope/vim-fugitive'
	Bundle 'tpope/vim-markdown'
	Bundle 'tpope/vim-unimpaired'
	
	" Enable some syntax settings that had to be disabled for Vundle.
	filetype plugin indent on
	
	" Configure syntastic.
	let g:syntastic_mode_map={ 'mode': 'active',
		\ 'active_filetypes': [],
		\ 'passive_filetypes': ['html', 'cpp'] }
	let g:syntastic_check_on_open=1
	let g:syntastic_enable_highlighting=0
	
	" Shows the errors window. (e)
	nmap <silent> <leader>e :Errors<CR>
	
	" Tagbar commands. (t)
	nmap <silent> <leader>t :TagbarToggle<CR>
	
	" Toggle the NERDTree pane. (n)
	nmap <silent> <leader>n :NERDTreeTabsToggle<CR>
	
	" Use CtrlP to search tags. (p)
	nmap <silent> <leader>p :CtrlPTag<CR>
	
	" Enable indent guides on boot and allow colorschemes to style them.
	let g:indent_guides_enable_on_vim_startup=1
	let g:indent_guides_auto_colors=0
endif

" Improve the colours.
syntax on
set background=dark
set t_Co=256
colorscheme custom

" Enable the mouse in the terminal.
set mouse=a

" Add more syntax highlighting mappings.
au BufNewFile,BufRead *.webapp set filetype=json

" Improve the backspace key.
set backspace=indent,eol,start

" Improve completion.
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

" Stop hyphens being regarded as a word separator.
set iskeyword+=-

" Disabled code folding. It can be weird sometimes.
set nofoldenable

" Increase the history length.
set history=1000

" Clears the search. (m)
nmap <silent> <leader>m :nohlsearch<CR>

" Rebuild the tags. (F5/F6[JS])
set tags+=.tags
map <F5> :!/usr/bin/ctags -Rf ./.tags --python-kinds=-i --exclude=.git -L .srclist<CR><CR>
map <F6> :!jsctags -f ./.tags `cat .srclist`<CR><CR>

" Remove all comments. (q)
nmap <silent> <leader>q :%s/\/\*\_.\{-}\*\///g<CR> :%s/\([ \t]\)\/\/.*/\1/<CR>

" Add a line in the 81st column.
set colorcolumn=81

" Show the file name in the window title bar.
set title

" Remove backup and swap.
set nobackup
set noswapfile

" Disable the arrow keys in normal mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Enable line numbers.
set number

" Improve line breaking.
set nolist

" Show invisible characters.
set listchars=tab:▸\ ,trail:·
set list

" Highlight searches.
set hlsearch

" Highlight the current line.
set cursorline

" Ignore case of searches.
set ignorecase

" Highlight dynamically as pattern is typed.
set incsearch

" If the search contains an upper-case character, become case sensitive.
set smartcase

" Set the default encoding to UTF-8.
set enc=utf-8

" Configure the spelling language.
set spelllang=en_gb
set spell

" Disable error bells.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Don't reset cursor to start of line when moving around.
set nostartofline

" Always show status line.
set laststatus=2

" Show the cursor position.
set ruler

" Don't show the intro message when starting vim.
set shortmess=atI

" Disable the extra line at the end of files.
set binary
set noeol

" Start scrolling three lines before the horizontal window border.
set scrolloff=3