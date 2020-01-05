set background=dark
":colorscheme koehler
syntax on
set number
set nocompatible
set encoding=utf-8
set bs=2
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

" General behaviour
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells

"Allows to install vim plugins under ~/.vim/bundle
call pathogen#infect()

filetype plugin indent on
set ofu=syntaxcomplete#Complete
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Restoring cursor position
set viminfo='10,\"1000,:20,%,n~/.viminfo

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
	return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
