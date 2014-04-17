" バックスペースキーで削除できるものを指定
" indent	: 行頭の空白
" eol		: 改行
" start		: 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
" 改行コードの自動認識
set fileformats=unix,dos,mac
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
"set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
"set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
"set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"大文字小文字を無視
set ignorecase
"タブ文字、行末など不可視文字を表示する
"set list
"set listchars=tab:→\ ,trail:_,precedes:&#171;,extends:&#187;
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
" ルーラーを表示
set ruler
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=1
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
"highlight Comment ctermfg=DarkCyan
highlight Comment ctermfg=DarkBlue
" コマンドライン補完を拡張モードにする
set wildmenu
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインを常に表示する
set laststatus=2
highlight StatusLine ctermfg=gray ctermbg=darkblue

" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8

" オートコマンド
if has("autocmd")
	" ファイルタイプ別インデント、プラグインを有効にする
	filetype plugin indent on
	" カーソル位置を記憶する
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
		\ endif
endif

" その他
" 起動時のメッセージを表示しない
set shortmess+=I

" 補完形式
set wildmenu wildmode=list:full


" Syntaxes
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx if &ft == '' | setfiletype nginx | endif





" NeoBundle設定
" 
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" NeoBundle modules
NeoBundle 'Shougo/vimproc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp':'vim/'}
NeoBundle 'rails.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
"NeoBundle 'itchyny/lightline.vim',{ 'gui': 1 }
filetype plugin indent on
filetype indent on

