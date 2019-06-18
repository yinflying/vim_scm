function scm_csv#install()
    Plug 'chrisbra/csv.vim'
endfunction

function scm_csv#config()
    call s:config_csv()
endfunction

function s:config_csv()
    autocmd FileType csv setlocal cc=0
endfunction
