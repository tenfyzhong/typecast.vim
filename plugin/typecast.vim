"==============================================================
"    file: typecast.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2018-09-26 15:12:09
"==============================================================

if !has('eval')
  echom 'should compile with +eval'
  finish
endif

if exists('g:typecast_version')
  finish
endif

let save_cpo = &cpo
set cpo&vim

let g:typecast_version = '0.1.0'
lockvar g:typecast_version

nnoremap <silent> <Plug>typecast :<c-u>set opfunc=typecast#opfunc<cr>g@
xnoremap <silent> <Plug>typecast :<c-u>call typecast#visual()<cr>

if !hasmapto('<Plug>typecast', 'n')
  nmap <leader>ct <Plug>typecast
endif
if !hasmapto('<Plug>typecast', 'x')
  xmap <leader>ct <Plug>typecast
endif

let &cpo = save_cpo
