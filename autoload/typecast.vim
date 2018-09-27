"==============================================================
"    file: typecast.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2018-09-26 15:16:21
"==============================================================

let s:last_cast_type = ''

nnoremap <silent> <plug>typecast_repeat .


function! typecast#opfunc(type, ...) abort 
  let cast_type = <SID>input_type()
  call typecast#do(a:type, cast_type, "'[", "']")
  silent! call repeat#set("\<plug>typecast_repeat"."\<cr>")
endfunction 

function! typecast#visual() abort
  let cast_type = <SID>input_type()
  call typecast#do('', cast_type, "'<", "'>")
endfunction


function! typecast#do(type, cast_type, begin_pos_expr, end_pos_expr) abort
  if a:cast_type == ''
    return
  endif
  let s:last_cast_type = a:cast_type

  let begin_pos = getpos(a:begin_pos_expr)
  let end_pos = getpos(a:end_pos_expr)

  let save_selection = &selection

  let save_reg = @@

  call setreg('"', ')', 'v')
  call setpos('.', end_pos)
  normal! ""p

  call setreg('"', s:last_cast_type . '(', 'v')
  call setpos('.', begin_pos)
  normal! ""P

  let @@ = save_reg

  let &selection = save_selection
endfunction


function! s:input_type()
  return input('cast to type: ', s:last_cast_type)
endfunction
