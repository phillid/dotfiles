syntax on
set cc=80,120
set number

set foldmethod=syntax
autocmd BufEnter * silent! %foldopen!

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2

" Force remap C+Left and C+Right for moving on words in insert mode
map <ESC>[1;5C <C-Right>
map <ESC>[1;5D <C-Left>
map! <ESC>[1;5C <C-Right>
map! <ESC>[1;5D <C-Left>

set listchars=tab:─\ ,trail:·,space:·,nbsp:␣,extends:⯈,precedes:⯇
set showbreak=\\ 
set list


highlight ExtraWhitespace ctermbg=red guibg=red
highlight SpecialKey ctermfg=23
highlight NonText ctermfg=23
highlight Folded ctermbg=0
highlight ColorColumn ctermbg=234
match ExtraWhitespace /\s\+$/

inoremap <CR> <CR>x<BS>
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap o ox<BS>
nnoremap O Ox<BS>
set pastetoggle=<F2>

function! ToggleHlsearch()
    if &hlsearch
        nohlsearch
        set nohlsearch
    else
        set hlsearch
    endif
endfunction

" highlighted search colours
hi Search ctermbg=DarkYellow ctermfg=Black
nnoremap <C-_> :call ToggleHlsearch()<cr>

hi Todo ctermbg=DarkGreen ctermfg=Black


"set expandtab
autocmd BufRead,BufNewFile *.cli setfiletype xml
autocmd BufRead,BufNewFile *.bnf setfiletype bnf
"autocmd FileType c setlocal expandtab
autocmd FileType make set noexpandtab
"autocmd FileType cpp setlocal expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType bitbake setlocal expandtab
autocmd FileType python setlocal expandtab
autocmd FileType haskell setlocal expandtab
autocmd FileType lhaskell setlocal expandtab
autocmd FileType perl setlocal noexpandtab

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts = 1

" vim-powerline symbols
"let g:airline_left_sep          = '⮀'
"let g:airline_left_alt_sep      = '⮁'
"let g:airline_right_sep         = '⮂'
"let g:airline_right_alt_sep     = '⮃'
"let g:airline_branch_prefix     = '⭠'
"let g:airline_readonly_symbol   = '⭤'
"let g:airline_linecolumn_prefix = '⭡'

" makes airline work before split
set laststatus=2

" Nicer colours for solarised vimdiff
highlight DiffAdd    cterm=bold ctermfg=233  ctermbg=101 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=175  ctermbg=175 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=234  ctermbg=101 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=none ctermfg=242  ctermbg=0   gui=none guifg=bg guibg=Red

let g:previousmode = 'i'
function PushModeSwitchNormal() abort
	let g:previousmode = mode()
	" important: l so that we don't walk backward every time clutch is pushed
	return "\<C-\>\<C-n>l"
endfunction

function PopMode() abort
	return g:previousmode
endfunction

inoremap <expr> <F11> PushModeSwitchNormal()
vnoremap <expr> <F11> PushModeSwitchNormal()
xnoremap <expr> <F11> PushModeSwitchNormal()
snoremap <expr> <F11> PushModeSwitchNormal()
onoremap <expr> <F11> PushModeSwitchNormal()
inoremap <F12> <Nop>
vnoremap <F12> <Nop>
xnoremap <F12> <Nop>
snoremap <F12> <Nop>
onoremap <F12> <Nop>
nnoremap <expr> <F12> PopMode()
