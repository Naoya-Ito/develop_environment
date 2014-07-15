
syntax on " ハイライト表示
set nocompatible " vi互換にしない
set noinsertmode " デフォルトをインサートモードにしない
set wrap " 行の端まで到達すると折り返す
set backspace=1 " 全てバックスペースで削除可能にする
set noerrorbells " エラー時にベルを鳴らさない
set cmdheight=1 " コマンドラインの高さ
set shortmess=t " 'Press RETURN or enter command to continue' を表示しない
set ignorecase " 検索文字列が小文字のみの場合、大文字･小文字を区別しない
set smartcase " 検索文字列に大文字が含まれていると、大文字･小文字を区別する
set history=100 " 保存するコマンド数
set wildmode=list:longest " コマンドライン補完をシェルと同じに
set magic " 正規表現使用時に magic モードにする
set incsearch " 検索してすぐにその単語の所まで飛ぶ
set hlsearch " 検索ワードをハイライトする
set iminsert=1 " 日本語入力状態でもEscでコマンドモードへ
set number
set listchars=tab:-\ " タブの代替文字
set expandtab "タブ入力がスペースに変換される。
set list " タブを表示
set tabstop=2 " タブ幅
set shiftwidth=2 " インデント幅
set wrapscan " ファイルの最後に来たら最初から検索
set laststatus=2 " 常にステータス行を表示
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%04B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set showmatch " 対応する括弧に一時的に移動
set showcmd " 実行したコマンドを表示
set history=100 " 記憶するコマンド数
map + <C-W><S-+> " + でカレントウィンドウを大きく
set smartindent
"set backup
"set backupdir=$HOME/backup/vim
"set backupskip=/tmp/*,/private/tmp/*

" Delete Key を使えるようにする
set t_kD=^?

" 以降、新しい会社でのおいら
filetype off
call pathogen#runtime_append_all_bundles()
filetype on

" 文法チェック
call pathogen#infect()
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': [] }

" bundleで管理するディレクトリを指定 
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'Shougo/neobundle.vim' " neobundle 自身を管理
NeoBundle 'Shougo/vimproc'  " 別プロセスでテストが実行でき
NeoBundle 'Shougo/vimshell'  " 非同期でシェルを起動する
NeoBundle 'scrooloose/syntastic'  " syntax check
NeoBundle 'tpope/vim-endwise.git' " if...endなど対応するキーワードの自動補完
NeoBundle 'ruby-matchit'  " %を拡張して、def...end等のキーワードを移動出来るようにする。
"NeoBundle 'Shougo/neocomplcache'  " 補完
"NeoBundle 'Shougo/neocomplcache-snippets-complete'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'VimClojure'
filetype plugin indent on     " required!
filetype indent on
syntax on


"autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
