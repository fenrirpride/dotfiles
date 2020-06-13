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

"ウィンドウ間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"タブ補完の方式を指定
set wildmode=longest,full
