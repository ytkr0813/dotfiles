syntax on
set number
colorscheme monokai
vnoremap <silent> > >gv
vnoremap <silent> < <gv
set shiftwidth=2
set tabstop=2
set clipboard=unnamed
set cursorline   " カーソル行をハイライト
set cursorcolumn "カーソル列をハイライト
set hlsearch  "検索結果ハイライト
set autoindent  "新しい行のインデントを現在行と同じにする
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

"タブをスペース化
set expandtab
" コマンド表示
set showcmd
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


"NeoBundle
"set nocompatible
"filetype plugin indent off

"if has('vim_starting')
"  set runtimepath+=~/.vim/bundle/neobundle.vim
"  call neobundle#rc(expand('~/.vim/bundle'))
"endif 

"NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neosnippet.vim'

"filetype plugin indent on

" solarized
"NeoBundle 'altercation/vim-colors-solarized'
"mustang
"NeoBundle 'croaker/mustang-vim'
"jellybeans
"NeoBundle 'nanotech/jellybeans.vim'
"molokai
"NeoBundle 'tomasr/molokai'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'ujihisa/unite-colorscheme'
