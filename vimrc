" Carefully hand crafted, to-be-awesome, vimrc by fdanielsen
"
" Some of these settings are inspired by Tim Pope's vim-sensible,
" after both understanding what it does and agreeing with the setting.
" Source: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
"
" Other inspirational sources:
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://benmccormick.org/2014/07/21/learning-vim-in-2014-getting-more-from-vim-with-plugins/

" Turn off legacy support, engage IMproved, must be set before
" other options since it might change their behavior.
set nocompatible

" Set a more comfortable leader key than default \
let mapleader=","

" Turn on file type detection, and load any plugin files and
" indent definitions for detected file types
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Enable hiding instead of closing buffers, which means buffers can
" have unwritten changes in the background.
set hidden

" Configure indent defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Use shiftwidth when using <Tab> in front of a line
set smarttab

" Enable automatic indenting of new lines
set autoindent

" Disable soft wrap of lines
set nowrap

" Configure indent setting overrides for specific file formats
" autocmd Filetype * setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype python setlocal expandtab textwidth=79
autocmd Filetype html* setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab

" Configure font family and size for GUI Vim (gvim, MacVim)
" NOTE: The powerline fonts are finicky about size to display symbols
" nicely. This Inconsolata font works good at 12 or 16 at least.
if has('gui_running')
	set guifont=InconsolataForPowerline-dz:h16
endif

" Enable the statusline at all times.
" Default is 1, which means it'll only show with 2 or more splits.
set laststatus=2

" Show (partial) command in the last line of the screen
set showcmd

" Show a menu of possible command completions
set wildmenu

" Ignore some common dot files in path expansions
set wildignore=*.pyc,*.class

" Make sure there's always one line visible above/below current line,
" unless current line is the first or last line of course. Also make
" sure there's always 5 characters before/after the cursor position.
set scrolloff=1
set sidescrolloff=5

" Highlight trailing or non-breaking spaces with a special character,
" and show # when a line extends past the window width.
" TODO: Investigate if it's possible to color the background or text for
" these characters to make the pop even more.
set list
set listchars=trail:•,extends:#,nbsp:•

" Set utf-8 as current encoding if file has been detected as latin1
if &encoding ==# 'latin1' && has('gui_running')
	set encoding=utf-8
endif

" Make sure bash is shell inside vim, otherwise syntastic (and possibly
" other plugins) won't work correctly
if &shell =~# 'fish$'
	set shell=/bin/bash
endif

" Automatically re-read in open files that have changed outside of Vim
set autoread

" Add Mac line endings to the list of detected end-of-line formats.
" Unix is by default first, and will be chosen for new files.
set fileformats+=mac

" Don't create .swp swap files, or backup before writing files
set nobackup
set noswapfile

" Increase history list of commands, search strings, etc.
set history=1000

" Set high number of undo levels
set undolevels=1000

" Disable storing of options and mappings set during a session.
set sessionoptions-=options

" Show matches to a search immediately while typing, instead of waiting
" until <Enter> is hit, and highlight matches for current search.
set incsearch
set hlsearch

" Make searches case insensitive if search string is lower case
set ignorecase
set smartcase

" Enable improved regular expression handling, without the need to escape
" special characters like $, *, period etc. to enable their special meaning.
set magic

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" 21st century terminal speed... Makes VIm assume a fast "terminal
" connection", so it sends more characters to the screen at a time.
set ttyfast

" Show relative number of lines from current line infront of each line.
set relativenumber

" Put text deleted by ctrl-U in the undo list to avoid losing it completely.
" More info: http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-U> <C-G>u<C-U>

" Enable VIm hardcore mode. This will disable any usage of the arrow keys,
" forcing the usage of hjkl on the home row instead.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

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

" Should not need to set Solarized term colors to 256 as far as documentation
" says, but I haven't been able to successfully use Solarized in non-GUI vim
" without setting this, yet..
let g:solarized_termcolors=256

set background=dark
colorscheme solarized

" Force usage of jsxhint over jshint
let g:syntastic_javascript_checkers = ['jsxhint']
" Enable JSX syntax highlighting in normal .js files
let g:jsx_ext_required = 0

" Let vim-airline know we're using a Powerline compatible font
" with special symbols
let g:airline_powerline_fonts = 1
