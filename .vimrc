" ================================
" Basic Settings
" ================================
syntax off                    " Disable syntax highlighting
set ic                        " Ignore case in searches
set relativenumber            " Show relative line numbers
set shiftwidth=2              " Use 2 spaces for indentation
set tabstop=2                 " Tabs render as 2 spaces
set smartindent               " Enable smart indentation
set lazyredraw                " Faster UI updates
set autoread                  " Auto reload files when changed externally

" ================================
" File Explorer (netrw)
" ================================
let g:netrw_keepdir = 0       " Prevent netrw from changing CWD (helps with Git)

" ================================
" Ignore Files in Completion/Navigation
" ================================
set wildignore+=*/.*
set wildignore+=*.DS_Store,*~,*.swp,*.swo,*.swn
set wildignore+=*/[Bb]in/*,*/[Oo]bj/*,*/[Dd]ebug*/*,*/[Rr]elease*/*,*/x64/*,*/x86/*,*/[Aa][Rr][Mm]*/,*/bld/*,*/artifacts/*,*/Generated*/*,*/Generated_Code/*,**/GeneratedArtifacts/*
set wildignore+=*.log,*.tmp*,*.user*,*.suo,*.pidb,*.pdb,*.ilk,*.obj,*.iobj,*.meta,*.rsp,*.cachefile,*.VC.db,*.VC.VC.opendb
set wildignore+=*/node_modules/*,**/[Pp]ackages/*,*.nupkg,*.nuget.props,*.nuget.targets

" ================================
" Custom Commands
" ================================
command! Repos Explore $HOME/repos

" Git push shortcut
" Usage: :Push "Commit message"
command! -nargs=+ Push execute 'silent !git add .' 
      \ | execute 'silent !git commit -a -m "' . <q-args> . '"' 
      \ | execute 'silent !git push'

" ================================
" CSS & JS Minification
" ================================
autocmd BufWritePost *.css,*.js call s:minify_css_js()

function! s:minify_css_js() abort
  let l:file = expand('%')
  let l:outfile = expand('%:r')

  if expand('%:e') ==# 'css'
    let l:cmd = 'csso ' . shellescape(l:file)
          \ . ' -o ' . shellescape(l:outfile . '.min.css')
  else
    let l:cmd = 'uglifyjs ' . shellescape(l:file)
          \ . ' -o ' . shellescape(l:outfile . '.min.js') . ' -c -m'
  endif

  let l:out = system(l:cmd)

  if v:shell_error
    echohl ErrorMsg
    echom l:out
    echohl None
  endif
endfunction

" ================================
" HTML Minification & Prettify
" ================================
augroup html_minify
  autocmd!
  autocmd BufWritePre *.html execute
        \ ':%!html-minifier --collapse-whitespace --remove-comments --minify-css true --minify-js true'
augroup END

augroup html_prettify
  autocmd!
  autocmd BufReadPost *.html silent! keepjumps %!prettier --parser html
augroup END
