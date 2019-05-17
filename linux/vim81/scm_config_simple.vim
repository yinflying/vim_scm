function scm_config_simple#install()
    "Do nothing but should be remained
endfunction

function scm_config_simple#config()
    set nocp
    set hls
    set tabstop=4 shiftwidth=4 softtabstop=1 expandtab smarttab
    set autoindent smartindent cindent
    set smartcase
    set number
    set cc=80
    set cursorline
    syntax on
    set backspace=indent,eol,start
    set nowrap
    filetype plugin indent on
    call s:central_tmpfile($HOME."/.cache/scm_vim/")
    call s:config_map()
    call s:config_session()
endfunction

function s:central_tmpfile(tmpdir)
    set undofile
    exec "set undodir=".a:tmpdir."/undodir//"
    if !isdirectory(a:tmpdir."/undodir")
        call mkdir(a:tmpdir."/undodir","p")
    endif
    set backup
    exec "set backupdir=".a:tmpdir."/backupdir//"
    if !isdirectory(a:tmpdir."/backupdir")
        call mkdir(a:tmpdir."/backupdir","p")
    endif
    set swapfile
    exec "set dir=".a:tmpdir."/swapdir//"
    if !isdirectory(a:tmpdir."/swapdir")
        call mkdir(a:tmpdir."/swapdir","p")
    endif
endfunction

function s:config_map()
    vnoremap <leader>y "+y
    nnoremap <leader>p "+p
endfunction

function s:config_session()
    nnoremap <leader>S :mksession!<CR>
    "Sesson only save buffers,current direcotry,folds,windows size,terminal
    set sessionoptions=buffers,curdir,folds,tabpages,winsize,terminal
endfunction
