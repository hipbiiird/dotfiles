"---------------------------------------------------------------------------
" 索検関連:
"

set hlsearch     " 検索文字列をハイライトする
set incsearch    " インクリメンタルサーチを行う
set ignorecase   " 小文字で入力すると大文字と小文字を区別しない
set smartcase    " 大文字が含まれると大文字小文字を区別
set wrapscan     " 循環検索
set gdefault     " 置換で g オプションをデフォルトにする
"esc連打でハイライトをオフ
nnoremap <silent> <ESC><ESC> :noh<CR>

"---------------------------------------------------------------------------
" 集編関連:
"
set smarttab                    " BS でインデント幅を削除
set expandtab                   "TABをスペースに
" set tabstop=2                   "TABの幅
" set softtabstop=0               "連続した空白に対してTABやBSで移動する量(0の場合はtabstopと同じ値)
set shiftwidth=4                "自動インデントの幅
set shiftround                  "インデントを'shiftwidth'の倍数に丸める
set smartindent                 "適切にインデントを調整
set autoindent                  "自動インデントを有効
set iminsert=0                  "入力モードで自動的にIMEがオンになるのを抑制
set formatoptions=q             "自動改行を抑制
set mouse=a                     "ターミナルでマウスを利用する
set scrolloff=8                 "上下8行の余裕を持たせてスクロール

set modeline                    "モードラインを有効化

set backspace=indent,eol,start  " BS でindent,改行,挿入開始前を削除

" "<>" も括弧として扱う
set matchpairs+=<:>

" 折りたたみ関連
set foldenable
" set foldmethod=expr
set foldmethod=marker
" Show folding level.
set foldcolumn=1
set fillchars=vert:\|
set commentstring=%s

if exists('*FoldCCtext')
  " Use FoldCCtext().
  set foldtext=FoldCCtext()
endif

"grepを使う
set grepprg=grep\ -inH

" キーマップのタイムアウトを設定
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=1000

" Set swap directory.
set directory-=.

set noundofile                  "アンドゥーセッションファイルを作らない

set virtualedit=block           "矩形ビジュアルモードをブロック表示に

" ヘルプ関連
set keywordprg=:help
set helplang& helplang=ja
" 日本語のヘルプファイルを開くとループして固まる
if v:version < 703 || (v:version == 7.3 && !has('patch336'))
   set notagbsearch
endif

" Check timestamp more for 'autoread'.
autocmd MyAutoCmd WinEnter * checktime

" Use autofmt.
set formatexpr=autofmt#japanese#formatexpr()

" Default home directory.
let t:cwd = getcwd()

" ファイル保存時に行末のスペースを削除する
" ただしマークダウンファイルを除く
let g:does_remove_trailing_white_space = 1
au MyAutoCmd BufWritePre * call s:removeTrailingWhiteSpace()
func! s:removeTrailingWhiteSpace()
  if &ft != 'markdown' && g:does_remove_trailing_white_space == 1
    :%s/\s\+$//ge
  endif
endf

highlight TrailingSpaces ctermbg=magenta guibg=#FF0000
au BufNewFile,BufRead * call matchadd('TrailingSpaces', ' \{-1,}$')

"---------------------------------------------------------------------------
" 表示関連表:
"

" 不可視文字を表示
set list
if IsWindows()
   set listchars=tab:>-,trail:-,extends:>,precedes:<
else
   set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
endif

set number            "行番号を表示する
set ruler             "座標を表示する
set cpoptions-=m      "移動キーを押しても括弧の強調を有効にする
set showmatch         "閉じ括弧の入力時に対応する括弧を表示する
set matchtime=1       "移動キーを押しても括弧の強調を有効にする
set laststatus=2      "ステータスラインを常に表示する
set cmdheight=2       "コマンドラインを2行に
set showcmd           "入力中のコマンドを表示する
set title             "編集中のファイル名を表示
" Title length.
set titlelen=95
" Disable tabline.
set showtabline=0
set linebreak      "ブラケットや区切り文字で折り返し
"set breakat=\     "折り返し文字の設定 (default " ^I!@*-+;:,./?")
set showbreak=+\   "折り返し行の先頭に表示

set whichwrap+=h,l,<,>,[,],b,s  "行をまたいで移動可能
if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif

set ambiwidth=double  "全角記号対策

" カーソル行の強調
if has("autocmd")
  autocmd WinEnter    * set cursorline
  autocmd BufRead     * set cursorline
  autocmd WinLeave    * set nocursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
endif

" インサートモードでカーソルを棒状に
if has('nvim')
  :let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
if has('mac')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

set visualbell        "ビープ音を抑制
set vb t_vb=          "画面フラッシュも止める


" 補完
" set wildmenu                    " コマンド入力をタブで補完
" set wildchar=<Tab>              " コマンド補完を開始するキー
set nowildmenu
set wildmode=list:longest,full    " 補完動作（リスト表示で最長一致、その後選択）

" set infercase                   " 補完時に大文字小文字を区別しない
set history=1000                  " コマンドの履歴数
set showfulltag                   " タグ補完の時にタグがマッチしたパターンを表示
" Can supplement a tag in A command-line.
set wildoptions=tagfile
" 補完ウィンドウの設定
set completeopt=menuone
if has('patch-7.4.775')
  set completeopt+=noinsert
endif
" Don't complete from other buffer.
set complete=.
" Set popup menu max height.
set pumheight=20

" Report changes.
set report=0

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" ウィンドウを下や右に開く
set splitbelow
set splitright
" Set minimal width for current window.
set winwidth=30
" Set minimal height for current window.
" set winheight=20
set winheight=1
" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

set ttyfast

" When a line is long, do not omit it in @.
set display=lastline
" Display an invisible letter with hex format.
"set display+=uhex

function! WidthPart(str, width) abort
  if a:width <= 0
    return ''
  endif
  let ret = a:str
  let width = strwidth(a:str)
  while width > a:width
    let char = matchstr(ret, '.$')
    let ret = ret[: -1 - len(char)]
    let width -= strwidth(char)
  endwhile

  return ret
endfunction

" For conceal.
set conceallevel=2 concealcursor=niv

if has("patch-7.4.314")
  set shortmess+=c
endif
