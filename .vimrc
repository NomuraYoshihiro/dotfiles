syntax on
colorscheme monokai
inoremap <C-j> <esc>
nnoremap 9 $
set t_Co=256

" ファイル名を常に表示
set laststatus=2
set ruler
" 挿入モードでTABキーを押した際、対応する数のスペースを入力
set expandtab
set tabstop=2
set shiftwidth=2
" OSのクリップボードを使う
set clipboard+=unnamed
" エンコード, ファイルエンコード
set encoding=utf-8
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" ビープ音を消す
set belloff=all
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 補完の際の大文字小文字の区別しない
set infercase
" 行末1文字までカーソルを移動できるようにする
set virtualedit=onemore
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set hlsearch
" マウスモード有効
set mouse=a
" コマンドを画面最下部に表示する
set showcmd
" ◆や○文字が崩れる問題を解決"
set ambiwidth=double

"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" jbuilder syntax highlight
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" Ctrl+nでNERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" dein
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')

 call dein#add('tpope/vim-endwise') " defやifの後にendを入れてくれる
 call dein#add('Townk/vim-autoclose') " 括弧を閉じる
 call dein#add('vim-ruby/vim-ruby')
 call dein#add('mxw/vim-jsx')
 call dein#add('leafgarland/typescript-vim')
 call dein#add('pangloss/vim-javascript')
 call dein#add('rking/ag.vim') " vim内で:Agで検索できる
 call dein#add('scrooloose/nerdtree')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
