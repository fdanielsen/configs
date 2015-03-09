" Carefully hand crafted, to-be-awesome, vimrc by fdanielsen

" Turn off legacy support, engage IMproved
set nocompatible

" Turn on file type detection, and load any plugin files and
" indent definitions for detected file types
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Enable the statusline at all times.
" Default is 1, which means it'll only show with 2 or more splits.
set laststatus=2

" Configure indent defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Configure indent setting overrides for specific file formats
" autocmd Filetype * setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype python setlocal expandtab textwidth=79
autocmd Filetype html* setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab


" vim-pathogen setup
"
" Use Tim Pope's pathogen script for automatically activating
" plugins in .vim/bundle;
" Source: https://github.com/tpope/vim-pathogen

" Set up list to easily disable plugins if necessary
" Usage: `call add(g:pathogen_disabled, '<plugin-name>')`
let g:pathogen_disabled = []

" Initialize plugins
execute pathogen#infect()


" Plugin customization

set background=dark
colorscheme solarized

let g:syntastic_javascript_checkers = ['jsxhint']
