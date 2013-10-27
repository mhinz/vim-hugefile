" vim: et sw=2 sts=2

if exists('g:autoloaded_hugefile')
  finish
endif
let g:autoloaded_hugefile = 1

" #toggle {{{1
function! hugefile#toggle()
  if exists('b:hugefile_saved_settings')
    if b:hugefile_enabled
      call s:restore_options()
    else
      call s:set_options()
    endif
  else
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
        \ 'foldmethod':  &l:foldmethod,
        \ 'swapfile':    &l:swapfile,
        \ }
endfunction

" s:restore_options {{{1
function! s:restore_options()
  let &eventignore  = b:hugefile_saved_settings.eventignore
  let &l:foldmethod = b:hugefile_saved_settings.foldmethod
  let &l:swapfile   = b:hugefile_saved_settings.swapfile

  if exists(':DoMatchParen') == 2
    DoMatchParen
  endif

  doautocmd FileType

  let b:hugefile_enabled = 0
endfunction

" s:set_options {{{1
function! s:set_options()
  syntax clear

  set      eventignore=FileType
  setlocal foldmethod=manual
  setlocal noswapfile

  if exists(':NoMatchParen') == 2
    NoMatchParen
  endif

  let b:hugefile_enabled = 1
endfunction
" }}}

" s:set_autocmds {{{1
function! s:set_autocmds()
  autocmd hugefile BufEnter <buffer> call s:set_options()
  autocmd hugefile BufLeave <buffer> call s:restore_options()
endfunction
