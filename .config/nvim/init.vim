" settings for dein.vim
if &compatible
  set nocompatible
endif

"dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif



" cursol setting
set ruler


" syntax setting
syntax enable







"シンタックスハイライト有効化
syntax on

"ファイルエンコーディング
"内部の文字コード
set encoding=utf-8
"書き込み時の文字コード
set fileencoding=utf-8
"読み込み時の文字コード
set fileencodings=utf-8,cp932


"行番号を表示する
set number
"カーソル業に下線表示
set cursorline
"空白文字を可視化する
set list
set listchars=tab:>-,trail:*

"開業時に自動インデント
set autoindent
set smartindent
"タブを何文字の空白文字に変換するか
set tabstop=4
"自動インデント時に追加される空白文字の数
set shiftwidth=4
"タブ入力時に空白文字に変換
set expandtab

"ヤンクした文字列はクリップボードにコピー
set clipboard=unnamed
"マウスクリックでカーソル移動
set mouse=a

"改行コードの指定
set fileformats=unix,dos,mac
"全角文字への対応
set ambiwidth=double
"ビープ音の代わりに画面を点滅させる
set visualbell

"ファイル操作関連
"スワップファイルを作成しない
set noswapfile
"編集中のファイルが別のプロセスで変更された場合に自動読み込みを実施
set autoread


"キー移動
nnoremap j gj
nnoremap k gk

"検索関係
"検索文字をハイライトする
set hls
"大文字小文字を無視する
set ignorecase
"大文字が含まれている場合にはignorecase無効
set smartcase
"検索単語の最後まで行ったら再度最初から検索をかける
set wrapscan
"ESCキーを2度押すとハイライトオフ
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"インクリメンタルサーチ
set incsearch
"置換時インクリメンタル実行
set inccommand=split

"ウィンドウ間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"タブ補完の方式を指定
set wildmode=longest,full
