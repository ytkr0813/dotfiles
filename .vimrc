" 挙動を vi 互換ではなく、Vim のデフォルト設定に
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype plugin indent off

"""""""""""""""""""""""""""
" プラグイン 
"""""""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif 

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
" colorscheme
NeoBundle 'tomasr/molokai'
" ファイルのツリー表示
NeoBundle 'scrooloose/nerdtree'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" vimからgit操作
NeoBundle 'tpope/vim-fugitive'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" まとめてコメントin, out
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

call neobundle#end()

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

""""""""""""""""""""""""""""""
" 各種オプション
""""""""""""""""""""""""""""""
set encoding=utf8
set t_Co=256
syntax on
set number
set clipboard=unnamed
set completeopt=menuone
colorscheme monokai
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" vimが挿入するインデントの幅
set shiftwidth=2
" タブ文字の表示幅
set tabstop=2
" スワップファイルは使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" カーソル行をハイライト
set cursorline
" カーソル列をハイライト
set cursorcolumn
" 検索結果ハイライト
set hlsearch
" 新しい行のインデントを現在行と同じにする
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
 "補完機能
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor
" タブをスペース化
set expandtab
" コマンド表示
set showcmd
" タブ、空白、改行の可視化 キモいので一旦置いておく
" set list
" set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" 全角スペースをハイライト表示
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
