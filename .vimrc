autocmd! bufwritepost .vimrc source %

set encoding=utf-8
set hlsearch

syntax on
filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

set number

"turn off vi compatibility
set nocompatible

"turn off linebreaker
set nowrap

"autocomplition by ctrl+space
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
	  return "\<Nul>"
  else
	 return "\<c-p>"
  endif
endfunction 
inoremap <Nul> <c-r>=InsertTabWrapper()<cr>

"set complete=""
"set complete+=k

"haskel plugins
au BufEnter *.hs compiler ghc
let g:haddock_browser="chromium-browser"
let g:neocomplcache_enable_at_startup = 1
