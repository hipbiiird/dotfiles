"---------------------------------------------------------------------------
" For neovim:
"

tnoremap   <ESC>      <C-\><C-n>
tnoremap   jj         <C-\><C-n>
tnoremap   j<Space>   j
tnoremap <expr> ;  vimrc#sticky_func()

nnoremap <Leader>t    :<C-u>terminal<CR>
nnoremap !            :<C-u>terminal<Space>

" Set terminal colors
let s:num = 0
for s:color in [
      \ '#6c6c6c', '#ff6666', '#66ff66', '#ffd30a',
      \ '#1e95fd', '#ff13ff', '#1bc8c8', '#c0c0c0',
      \ '#383838', '#ff4444', '#44ff44', '#ffb30a',
      \ '#6699ff', '#f820ff', '#4ae2e2', '#ffffff',
      \ ]
  let g:terminal_color_{s:num} = s:color
  let s:num += 1
endfor

" Use cursor shape feature
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

if exists('&inccommand')
  set inccommand=nosplit
endif

if has('vim_starting')
  syntax off
endif

" Share the histories
autocmd MyAutoCmd CursorHold * if exists(':rshada') | rshada | wshada | endif

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let g:python_host_prog='/Users/EM/.anyenv/envs/pyenv/versions/2.7.11/bin/python2.7'
    let g:python3_host_prog = '/Users/EM/.anyenv/envs/pyenv/versions/3.5.1/bin/python3.5'
