" General
let mapleader=','
set number " absoulte line number on cursor
set relativenumber " Show relative line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set autoread

filetype plugin on

" Disable polyglot for markdown
let g:polyglot_disabled = ['markdown']

" Source plugins
source ~/.config/nvim/plugins.vim

" Include coc mappings for lsp
source ~/.config/nvim/coc_mappings.vim


" Set scheme
colorscheme nord

" Airline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#grepper#enabled = 1


" FZF
map <C-f> <Esc><Esc>:GFiles!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
nnoremap <silent> <space><space> :Buffers<CR>

" Buffer hopping
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>


""" Shortcuts for easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Convenient copy paste
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

let g:grepper = {}
" let g:grepper.tools = ['git', 'ag', 'grep', 'rg']
let g:grepper.quickfix = 1
let g:grepper.switch = 0
let g:grepper.jump = 1
let g:grepper.prompt_mapping_side = '<c-l>'
let g:grepper.searchreg = 1

nnoremap <leader>/      :Grepper<cr>

nnoremap g/             :Grepper-side<cr>
nnoremap g*             :Grepper-side -cword -noprompt -tool rg<cr>
xnoremap g/             y:Grepper-side -noprompt -tool rg -query "<c-r>""<cr>
xmap     g*             g/

nnoremap <leader>*      <nop>
nnoremap <leader>**     :Grepper -cword -noprompt -tool rg <cr>
nnoremap <leader>*b     :Grepper -cword -noprompt -tool rg -buffer<cr>
nnoremap <leader>*o     :Grepper -cword -noprompt -tool rg -buffers<cr>
nmap     <leader>*B     <leader>*b
nmap     <leader>*O     <leader>*o

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
xmap <leader>* y:Grepper -noprompt -tool ag -query "<c-r>""<cr>

command! TODO Grepper -noprompt -tool git -query -E '(TODO|FIXME|XXX|\?\?\?)'

" Return list of matches for given pattern in given range.
" This only works for matches within a single line.
" Empty hits are skipped so search for '\d*\ze,' is not stuck in '123,456'.
" If omit match() 'count' argument, pattern '^.' matches every character.
" Using count=1 causes text before the 'start' argument to be considered.
function! GetMatches(pattern, line1, line2)
  let hits = []
  for line in range(a:line1, a:line2)
    let text = getline(line)
    let from = 0
    while 1
      let next = match(text, a:pattern, from, 1)
      if next < 0
        break
      endif
      let from = matchend(text, a:pattern, from, 1)
      if from > next
        call add(hits, strpart(text, next, from - next))
      else
        let char = matchstr(text, '.', next)
        if empty(char)
          break
        endif
        let from = next + strlen(char)
      endif
    endwhile
  endfor
  return hits
endfunction

function! CalculateSbtTestOnlyCommand()
    let l:lines_that_match_package = GetMatches('^package.*', 1, line('$'))
    let l:lines_that_match_class   = GetMatches('^\(class\|object\).*', 1, line('$'))
    if len(l:lines_that_match_package) == 0 || len(l:lines_that_match_class) == 0
        throw "Could not find test class name."
    endif
    let l:package  = substitute(l:lines_that_match_package[0], '^package\s\+\(\w\+\)', '\1', '')
    let l:class    = substitute(l:lines_that_match_class[0], '^\(class\|object\)\s\+\(\w\+\).*', '\2', '')
    let l:itPrefix = match(@%, '.*/it/.*') == -1 ? '' : 'it:'
    return l:itPrefix . "testOnly " . l:package . "." . l:class
endfunction
