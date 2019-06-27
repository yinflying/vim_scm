function scm_config_simple#install()
    "Do nothing but should be remained
endfunction

function scm_config_simple#config()
    set nocp
    set hls
    set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
    set autoindent smartindent cindent
    set smartcase
    set number
    set cc=80
    set cursorline
    set hidden
    syntax on
    set backspace=indent,eol,start
    set nowrap
    filetype plugin indent on
    call s:central_tmpfile($HOME."/.cache/scm_vim/")
    call s:config_map()
    call s:auto_close_quickfix()
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

"Quick fix autoclose
function s:auto_close_quickfix()
    " Choose a item, and close the quickfix window
    autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
    " When hidden, it will be deleted(defalut: hidden)
    autocmd FileType qf setlocal bufhidden=delete
endfunction

function s:config_map()
    " Map for System clipboard
    vnoremap <leader>y "+y
    nnoremap <leader>p "+p

    " Map for vim session
    nnoremap <leader>S :mksession!<CR>
    " Solve vim-which-key do not work when open vim session file
    set sessionoptions=blank,buffers,tabpages,resize,winsize,unix,slash
    " :Q save current session and exit
    command -nargs=0 Q :mksession! | qa
endfunction
