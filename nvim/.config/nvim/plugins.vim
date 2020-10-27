call plug#begin()
" Scala lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Theme
Plug 'arcticicestudio/nord-vim'
" File manager
Plug 'justinmk/vim-dirvish'
" Distraction free writing
Plug 'junegunn/goyo.vim'

" Langauge packs
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vista.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'chrisbra/csv.vim'

call plug#end()
