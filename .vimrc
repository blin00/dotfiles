set nocompatible
set backspace=2
set background=dark
syntax on
set nomodeline

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
filetype plugin indent on

au BufRead,BufNewFile *.nix set filetype=nix
autocmd FileType nix setlocal tabstop=2 softtabstop=2 shiftwidth=2
