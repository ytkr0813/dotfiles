:syntax on
set number
colorscheme monokai
vnoremap <silent> > >gv
vnoremap <silent> < <gv
set shiftwidth=2
set tabstop=2
set clipboard=unnamed
set cursorline   " カーソル行をハイライト
set cursorcolumn "カーソル列をハイライト
set hlsearch
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor
