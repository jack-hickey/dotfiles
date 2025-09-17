let g:netrw_keepdir=0
command! Repos Explore $USERPROFILE\source\repos

autocmd BufWritePost *.css,*.js call system(expand('%:e')=='css'?'csso '.shellescape(expand('%')).' -o '.shellescape(expand('%:r').'.min.css'):'terser '.shellescape(expand('%')).' -o '.shellescape(expand('%:r').'.min.js').' -c -m')

set number
set relativenumber
set shiftwidth=2
set tabstop=2
set smartindent
set ignorecase
set smartcase
