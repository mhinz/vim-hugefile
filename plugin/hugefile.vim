" vim: et sw=2 sts=2

if exists('g:loaded_hugefile') || &compatible
  finish
endif
let g:loaded_hugefile = 1

"
" The default size is 2 MiB.
"
let s:trigger_size = exists('g:huge_trigger_size') ? (g:huge_size * 1048576) : 2097152

augroup huge
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > s:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   redraw |
        \   call huge#toggle() |
        \ endif
augroup END

command! -bar HugeToggle call huge#toggle()
