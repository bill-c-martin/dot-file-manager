" turn off annoying beeping
set visualbell

" highlight search term hits
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" Show matching brackets when text indicator is over them
set showmatch 

" Tabs create 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" Enable syntax highlighting (Arch)
filetype plugin on
syntax on

" Add github-flavored markdown syntax highlighting
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
