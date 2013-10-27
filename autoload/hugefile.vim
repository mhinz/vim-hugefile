" vim: et sw=2 sts=2

if exists('g:autoloaded_hugefile')
  finish
endif
let g:autoloaded_hugefile = 1

let g:counter = 0

" #toggle {{{1
function! hugefile#toggle()
  if exists('b:hugefile_saved_settings')
    call s:set_options()
  else
    let g:counter += 1
    call s:save_options()
    call s:set_options()
    call s:set_autocmds()
  endif
endfunction
" }}}

" s:save_options {{{1
function! s:save_options()
  let b:hugefile_saved_settings = {
        \ 'eventignore': &eventignore,
        \ 'foldmethod':  &foldmethod,
        \ }
endfunction

" s:restore_options {{{1
function! s:restore_options()
  let &eventignore = b:hugefile_saved_settings.eventignore
  let &foldmethod  = b:hugefile_saved_settings.foldmethod
endfunction

" s:set_options {{{1
function! s:set_options()
  syntax clear
  set eventignore=FileType
  set foldmethod=manual
endfunction
" }}}

" s:set_autocmds {{{1
function! s:set_autocmds()
  autocmd hugefile BufEnter <buffer> call s:set_options()
  autocmd hugefile BufLeave <buffer> call s:restore_options()
endfunction
