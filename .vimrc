" colorscheme slate

" Plugins, managed with Vundle
set nocompatible
filetype off

" Make runtime path include vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

" Plugins must go below this line
" ===============================
call vundle#begin()

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Jedi-vim for python autocompletion
Plugin 'davidhalter/jedi-vim'

" mdnav for traversing links in markdwon files
Plugin 'chmp/mdnav'

" surround for the surround text objects
Plugin 'tpope/vim-surround'

" vim-bullets for bullets in markdown (and others)
Plugin 'dkarter/bullets.vim'

" for moving quickly around files and words
Plugin 'easymotion/vim-easymotion'

" for commenting out liine of code
Plugin 'tpope/vim-commentary'

" git integration in vim (better than :!git)
Plugin 'tpope/vim-fugitive'

" insert mode completions uses tab
Plugin 'ervandew/supertab'

" fzf integrations
Plugin 'junegunn/fzf.vim'

call vundle#end()
" ===============================
" Plugins must go above this line

" Basic always-use options
set nocompatible            " Vim mode instead of just vi mode
filetype plugin indent on   " enable syntax highlghting and indentation based on filetype
syntax on                   " enable color syntax highlighting

" Search Options
set incsearch               " Incremental search (shows matches for partially typed searches)
set hlsearch                " Highlights searches (use :noh to turn off)
set ignorecase              " Case-insensitive search
set smartcase               " Enable case-senstive search is capitals in search

" Indentation Options
set tabstop=8               " This sets the width that a tab character appears in vim
set expandtab               " Insert spaces when you press the tab key
set shiftwidth=4            " A tab inserts 4 spaces
set softtabstop=4           " The backspace key also interprets 4 spaces as a tab
set autoindent              " Matches indentation level when on new line for non-code file
set shiftround              " Round indentation to nearest multiple of the shift width

" Other options
set number relativenumber   " Shows line numbers on the current line, and offsets for jumps
set wildmenu                " Autocompleting commands shows a list of options to tab in
set path+=**                " Vim searches through all sub-directories for files
set backspace=indent,eol,start    

" Also save the buffer list after closing vim
set viminfo+=%

let mapleader=" "
nnoremap <SPACE> <Nop>
map <Leader> <Plug>(easymotion-prefix)

" Disable the <leader>s command so I can use <leader><leader>s for easymotion
let g:jedi#goto_stubs_command = ""

" Make supertab go forward through suggestions like is reasonable
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Map kj to the escape key (so much faster!)
inoremap kj <ESC>
vnoremap kj <ESC>

" Disable Arrow keys in Insert mode (helped me avoid using the arrow keys)
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Disable arrow keys in normal mode to encourage C-D/C-U, not trackpad
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Fast copy to system clipboard mapping
" Type cp followed by the text object or motion
nnoremap cp "+y

" Quit from the terminal more easily {no CTRL-W or ! to quit}
tnoremap :q <C-w>:q!

" Set indentation to 2 spaces for js and html files
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2

" I have set a mark V to access this file
" Custom mapping to open URLs that have been selected in visual mode
" It yanks the selection into the a register, then uses the open command, pastes its value
" and the does two enters to get rid of the press enter to continue prompt
" This replaces "gx" which doesn't really work
noremap gl "ay: ! open <C-R>a<CR><CR>

" Command to create a file's parent directories if they don't exist
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" Automatically set the text width to 80 for markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Configure netrw to be a nice tree file explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 30                " Make the width of the browser 30, at minimum

" Open new splits to the right/below the current window
set splitright
set splitbelow

set rtp+=/usr/local/opt/fzf " Enable fzf in vim
