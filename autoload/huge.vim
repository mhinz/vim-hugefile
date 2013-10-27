" vim: et sw=2 sts=2

if exists('g:autoloaded_huge')
  finish
endif
let g:autoloaded_huge = 1

" #toggle {{{1
function! huge#toggle()
  if exists('b:huge_saved_settings')
    call s:options_restore()
  else
    call s:options_save()
    call s:options_set()
  endif
endfunction

" s:options_save {{{1
function! s:options_save()
  let b:huge_saved_settings = {
        \ 'eventignore': &eventignore,
        \ 'foldmethod':  &foldmethod,
        \ }
endfunction

" s:options_restore {{{1
function! s:options_restore()
  let &eventignore = b:huge_saved_settings.eventignore
  let &foldmethod  = b:huge_saved_settings.foldmethod

  unlet b:huge_saved_settings
endfunction

" s:options_set {{{1
function! s:options_set()
  syntax off
  set eventignore=all
  set foldmethod=manual
endfunction

