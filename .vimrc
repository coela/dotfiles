syntax on
au BufReadPost,BufNewFile *.t :setl filetype=perl
set cindent
set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
call pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
"  " required! 
"   "NeoBundle 'Shougo/neobundle.vim'
"    " recommended to install

NeoBundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Shougo/neocomplcache'

" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'JavaScript-syntax'
NeoBundle 'ctrlp.vim'
" non github repos
NeoBundle 'git://git.wincent.com/command-t.git'
" ...
filetype plugin indent on     " required!

 "
 " " Brief help
 "  " :NeoBundleList          - list configured bundles
 "   " :NeoBundleInstall(!)    - install(update) bundles
 "    " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused
 "    bundles
 "     "
augroup greopen
	autocmd!
	autocmd QuickfixCmdPost vimgrep cw
augroup end

au QuickfixCmdPost make,grep,greoadd,vimgrep copen

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

