syntax on
set cc=80

set autoindent
set tabstop=4

"set listchars=tab:▸\ ,trail:·,space:·
set listchars=tab:→\ ,trail:·,space:·
set list


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
