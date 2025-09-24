syntax off

let g:netrw_keepdir=0
command! Repos Explore $USERPROFILE\source\repos

autocmd BufWritePost *.css,*.js let cmd=expand('%:e')=='css'?'csso '.shellescape(expand('%')).' -o '.shellescape(expand('%:r').'.min.css'):'terser '.shellescape(expand('%')).' -o '.shellescape(expand('%:r').'.min.js').' -c -m' | let out=system(cmd) | if v:shell_error | echohl ErrorMsg | echom out | echohl None | endif

set ic
set relativenumber
set shiftwidth=2
set tabstop=2
set smartindent
