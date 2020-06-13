" -----------------------------------------------------------------------------
" File: gruvpink.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvpink
" Last Modified: 09 Apr 2014
" -----------------------------------------------------------------------------

function! gruvpink#invert_signs_toggle()
  if g:gruvpink_invert_signs == 0
    let g:gruvpink_invert_signs=1
  else
    let g:gruvpink_invert_signs=0
  endif

  colorscheme gruvpink
endfunction

" Search Highlighting {{{

function! gruvpink#hls_show()
  set hlsearch
  call GruvboxHlsShowCursor()
endfunction

function! gruvpink#hls_hide()
  set nohlsearch
  call GruvboxHlsHideCursor()
endfunction

function! gruvpink#hls_toggle()
  if &hlsearch
    call gruvpink#hls_hide()
  else
    call gruvpink#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
