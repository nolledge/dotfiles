" vi:syntax=vim

source ~/.vim/statuslinerc
source ~/.vim/vundlerc

""" Editing
let mapleader=","
set background=dark
colorscheme ron
" highlight LineNr ctermfg=blue
syntax enable " enable syntax highlighting
set encoding=utf-8 " set default encoding
set expandtab " use spaces instead of tabs
set nocompatible " make sure we aren't in vi mode
set noerrorbells " turn off audio bell
set novisualbell " turn off visual bell
set nowrap " disable soft word wrap
set number " show line numbers
set shiftwidth=4 " 1 tab = 4 spaces
set smarttab " be smart when using tabs
set t_Co=16 " only use 16 colors
set t_vb=
set tabstop=4 " 1 tab = 4 spaces
set tm=500

""" Set powerline font
set guifont=Cousine\ for\ Powerline
""" Searching
set ignorecase " ignore case when searching
set incsearch " incremental search

""" History
" use an undo file to persist across reopening
set undofile
" set a directory to store the undo history
set undodir=/home/christof/.vimundo/
" remember 999 previous commands
set history=999
set wildignore+=*/target/*

set tags=tags;/

"" Plugin Shortcuts
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
map <C-p>     :CtrlP<CR>
nnoremap <F5> :GundoToggle<CR>
vmap <Enter>  <Plug>(EasyAlign)
nmap ga       <Plug>(EasyAlign)

""" Shortcuts for easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Rainbow Parantheses always on
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""" Scala Format
map <Leader>r  :%!java -jar /home/christof/bin/cli-assembly-0.2.0-SNAPSHOT.jar -f -q +compactControlReadability +alignParameters +alignSingleLineCaseStatements +doubleIndentClassDeclaration +preserveDanglingCloseParenthesis +rewriteArrowSymbols +preserveSpaceBeforeArguments --stdin --stdout <CR> 
"" Tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
    \ }
""" Airline
let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts = 1
""" Custom Commands
command W w !sudo tee % > /dev/null
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
