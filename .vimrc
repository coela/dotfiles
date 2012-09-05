syntax on
au BufReadPost,BufNewFile *.t :setl filetype=perl
set cindent
set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2

set enc=utf-8
set fenc=utf-8
set laststatus=2
set wildmenu
set number
set hlsearch
set ignorecase
map ,ptv :'<,'>! perltidy

let g:neocomplcache_enable_at_startup = 1
hi Pmenu ctermbg=black ctermfg=gray
hi PmenuSel ctermbg=darkcyan ctermfg=black
hi PmenuSbar ctermbg=darkred
hi PmenuThumb cterm=reverse ctermfg=gray
hi LineNr ctermfg=darkgreen ctermbg=gray

