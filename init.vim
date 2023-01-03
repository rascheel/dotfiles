"
" .vimrc
"
" NOTE: This only works in Neovim, not Vim.
"

" Table of Contents
" 1  .................... Plugins
" 2  .................... General
" 3  .................... User Interface
" 4  .................... Autocomplete/Snippets/Linting
" 5  .................... Airline
" 6  .................... Skeleton Files
" 7  .................... Key Mappings
" 8  .................... Leader Key
" 9  .................... Code Runner
" 10 .................... FZF
" 11 .................... Functions
" 12 .................... Work-specific overrides

let g:vimrc_type = 'personal' " options are: work / personal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 1. Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

                        " UI/UX For code
"Plug 'airblade/vim-gitgutter'                  
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'yggdroot/indentLine'
                                                " Language specific code
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
"Plug 'illyastarikov/skeleton-files'
"Plug 'justinmk/vim-syntax-extra'
Plug 'kergoth/vim-bitbake'

                        " Write Code
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirVer/ultisnips'
"Plug 'skywind3000/asyncrun.vim'
"Plug 'tommcdo/vim-lion'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-surround'
"Plug 'w0rp/ale'
"Plug 'wellle/targets.vim'

                        " Navigate
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
"Plug 'vim-scripts/taglist.vim'
"Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 2. General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=999                               " Makes the cursor the center of the screen
set clipboard=unnamed                           " Yank to system clipboard by default
set backspace=indent,eol,start                  " Proper backspace

set virtualedit=all                             " freedom of movement

set nowrap                  " Start vim with no wrapping lines that extend past the edge.

" set expandtab                                   " Replace tabs with spaces
set noexpandtab                                 " Insert tabs instead of spaces
set shiftwidth=4                                " set number of spaces to 4
set tabstop=4                                   " 4 spaces per tab

set number numberwidth=2                        " Shows line numbers on the left side
set rnu                     " Start with relative line numbering on
set hlsearch                                    " Highlight searches

if has('win32') || has("win64")                 " For deoplete
    let g:python3_host_prog = 'TODO' " Windows
else
    let g:python3_host_prog = '/usr/bin/python3' " Linux
endif

augroup projects                                " Treat headers as C
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

if exists('+colorcolumn')           "Creates a light red highlight at the 100 char column
    set colorcolumn=100
elseif exists('matchadd')
    au BufWinEnter * let w:m2=matchadd('Errormsg', '\%>100v.\+', -1)
endif

set ignorecase                  " Ignores case in search terms unless upper case is specifically included
set smartcase
set nowrapscan                  " Prevent search from wrapping around the file by default

set foldmethod=syntax                   " This sets folding to automatic based on language syntax.
set foldcolumn=0
let c_no_comment_fold = 1           " Disable folding of c block comments

set shortmess+=A                " Tell VIM to not complain about swap files, idc

"Because I am using automatic folding, upon entering a curly brace in insert
"mode vim unfolds everything below that curly brace. These autocmds fix that
"by switching me to manual folding upon entering insert mode, and then
"returning me to syntax folding when leaving insert mode.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Taglist settings
let tlist_python_settings = 'python;v:variables;c:class;m:member;f:function'
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
let Tlist_Use_Right_Window = 1 "display taglist window on the right
let Tlist_WinWidth = 53

set cpoptions+=$ "Adds a $ symbol when using the 'c' command, to the end of the code that will be changed.

" vim-indent-guides settings
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

" Powerline settings to look good
set laststatus=2
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_section_y = '%{strftime("%c")}'

                                                " Grep defaults
"let grepper = {
"    \ 'grep': {
"    \     'grepprg': 'grep -Rn --color --exclude=\*.{o,exe,out,dll,obj} --exclude-dir=bin $*'
"    \ }
"\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 3. User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                                       " Syntax highlighting
syntax enable
"set spell spelllang=en_us                       " set english as standard language

set t_Co=256                                    " 256 colors for terminal

colorscheme tender

set ffs=unix,dos,mac                            " Use Unix as the standard file type

set wildmenu                                    " Use wild-menu

set noerrorbells                                " no annoying error noises
set novisualbell                                " or error visuals
set t_vb=

" Tells vim to display tab characters as little arrows and trailing spaces as floating dots
set list
set listchars=tab:▷⋅,trail:⋅
"set list                                        " Show spaces, line breaks, the like
"set showbreak=↪\
"set listchars=tab:│·,trail:·,extends:→,extends:⟩,precedes:⟨

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 4. PLUGIN TODO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 5. Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 6. Skeleton Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 7. Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid bad habits
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

" Allows me to switch between relative line numbering and absolute by pushing F2
nnoremap <F2> :set nu!<CR>              
nnoremap <F3> :set rnu!<CR>

"toggle indent guides with F4
nnoremap <F4> :IndentGuidesToggle

"toggle taglist with F5
nnoremap <F5> :TlistToggle

"stop highlighting last search with F6
nnoremap <F6> :nohl

"Open an explorer at the location of the current file I am editing

if has('win32') || has("win64")                 " For deoplete
    nnoremap <F11> :!start explorer /select,%:p
"else
" TODO
    "nnoremap <F11> :!start explorer /select,%:p
endif

"Allow me to use the above F# keys in insert mode
imap <F2> <Esc><F4>
imap <F3> <Esc><F4>
imap <F4> <Esc><F4>
imap <F5> <Esc><F5>
imap <F6> <Esc><F6>
imap <F7> <Esc><F7>
imap <F11> <Esc><F11>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 10. FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be a better ctrl-p
nnoremap <silent> <C-p> :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 11. Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 12. Work-specific overrides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if vimrc_type == 'work'
    source ~/.vimrc.work
endif

