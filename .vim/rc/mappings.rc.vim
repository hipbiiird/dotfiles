"---------------------------------------------------------------------------
" Key-mappings:
"
"
"
" Visualモード
" <TAB>: indent.
xnoremap <TAB>  >
" <S-TAB>: unindent.
xnoremap <S-TAB>  <

" インデント
nnoremap > >>
nnoremap < <<
" xnoremap > >gv
" xnoremap < <gv


" insertモード
" insertモードから抜ける
inoremap っｊ <ESC>
inoremap っj <ESC>
inoremap jj           <ESC>
cnoremap <expr> j
      \ getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'

inoremap j<Space>     j

"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

"行頭/行末移動
noremap gh  ^
noremap gl  $
" inoremap <Leader>h <HOME>
" inoremap <Leader>l <END>
"tabの入力
inoremap <C-t> <C-v><TAB>
" undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>
" ESCで確実にIMEを無効化
inoremap <ESC> <ESC>:set iminsert=0<CR>

" 括弧を自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" 日時の自動入力
" inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
" inoremap <expr> ,dd strftime('%Y/%m/%d')
" inoremap <expr> ,dt strftime('%H:%M:%S')

" <Space>pと<Space>yでシステムのクリップボードにコピー＆ペーストする
nmap <Leader>y "+y
vmap <Leader>y "+y
nmap <Leader>p "+p
vmap <Leader>p "+p

"ノーマルモード
"ノーマルモード中にEnterで改行
noremap <CR> i<CR><Esc>

" 削除でレジスタに格納しない(ビジュアルモードでは格納する)
nnoremap x "_x
nnoremap X "_X

" 大文字小文字を切り替え
nnoremap gu g~iw`]

" ZZ を無効化
nnoremap ZZ  <Nop>

" 折りたたみ関連
" If press h on head, fold close.
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" l で折りたたみを開く
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press h on head, range fold close.
"xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" l で折りたたみを開く
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" インクリメントを使いやすく
nmap <C-a> <SID>(increment)
nmap <C-x> <SID>(decrement)
nnoremap <silent> <SID>(increment)    :AddNumbers 1<CR>
nnoremap <silent> <SID>(decrement)   :AddNumbers -1<CR>
command! -range -nargs=1 AddNumbers
\ call vimrc#add_numbers((<line2>-<line1>+1) * eval(<args>))

