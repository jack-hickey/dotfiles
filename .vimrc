" ------------------------------
" Basic settings
" ------------------------------
syntax off                    " Turn off syntax highlighting

set ic                        " Ignore case in searches
set relativenumber            " Show relative line numbers
set shiftwidth=2              " Number of spaces for indentation
set tabstop=2                 " Number of spaces for a tab
set smartindent               " Enable smart indentation
set lazyredraw                " Faster UI updates
set autoread                  " Auto reload files
let g:netrw_keepdir = 0       " Source control is infuriating without this

" Open repositories folder
command! Repos Explore $HOME/repos

" Push to git
command! -nargs=+ Push execute 'silent !git add .' | execute 'silent !git commit -a -m "' . <q-args> . '"' | execute 'silent !git push'

" ------------------------------
" CSS & JS minification on save
" ------------------------------
autocmd BufWritePost *.css,*.js call s:minify_css_js()

function! s:minify_css_js() abort
  let l:file = expand('%')
  let l:outfile = expand('%:r')
  if expand('%:e') ==# 'css'
    let l:cmd = 'csso ' . shellescape(l:file) . ' -o ' . shellescape(l:outfile . '.min.css')
  else
    let l:cmd = 'uglifyjs ' . shellescape(l:file) . ' -o ' . shellescape(l:outfile . '.min.js') . ' -c -m'
  endif
  let l:out = system(l:cmd)
  if v:shell_error
    echohl ErrorMsg
    echom l:out
    echohl None
  endif
endfunction

" ------------------------------
" HTML minification before saving
" ------------------------------
augroup html_minify
  autocmd!
  autocmd BufWritePre *.html execute ':%!html-minifier --collapse-whitespace --remove-comments --minify-css true --minify-js true'
augroup END

" ------------------------------
" HTML prettify after reading
" ------------------------------
augroup html_prettify
  autocmd!
  autocmd BufReadPost *.html silent! keepjumps %!prettier --parser html
augroup END
