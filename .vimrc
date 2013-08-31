
if has("win32") || has("win64")
    set directory=$TMP
else
    set directory=/tmp
end

"Current prefered color scheme, need to try more out.
colorscheme desert

"Automatically handles C indentation
set cindent

"Sets tab size to 4 spaces and replaces all entered tabs with spaces
set tabstop=4
set shiftwidth=4
set expandtab

"Adds a $ symbol when using the 'c' command, to the end of the code that will 
"be changed. Really nice
set cpoptions+=$

"Allows the cursor to go anywhere in the window, not a fan of this
"set virtualedit=all 

"Allows auto complete in the command line
set wildmenu

"highlights background in a subtle red text for any text that goes past the 80
"column. Also not working.
"highlight Overlength ctermbg=red ctermfg=white guibg=#592929
"match Overlength /\%81v.\+/

"Creates a light red highlight at the 80 char column
if exists('+colorcolumn')
    set colorcolumn=80
elseif exists('matchadd')
    au BufWinEnter * let w:m2=matchadd('Errormsg', '\%>80v.\+', -1)
endif

"shows line numbers on the left side
set number numberwidth=2

"ignores case in search terms unless upper case is specifically included
set ignorecase
set smartcase

"disables the arrow keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"enables the visual bell which shuts off the beeping
set visualbell

"removes menus from gvim
set go-=m
set go-=r
set go-=L
set go-=T

"Start vim with no wrapping lines that extend past the edge.
set nowrap

"This sets folding to automatic based on language syntax.
set foldmethod=syntax 
set foldcolumn=1
"Disable folding of c block comments
let c_no_comment_fold = 1


"Allows me to switch between relative line numbering and absolute by pushing F2
nnoremap <F2> :set nu!<CR>
nnoremap <F3> :set rnu!<CR>

"Because I am using automatic folding, upon entering a curly brace in insert
"mode vim unfolds everything below that curly brace. These autocmds fix that
"by switching me to manual folding upon entering insert mode, and then
"returning me to syntax folding when leaving insert mode.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
