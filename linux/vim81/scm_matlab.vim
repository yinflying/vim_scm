function scm_matlab#install()
    Plug 'yinflying/matlab-screen',{ 'on_ft' : 'matlab'}
endfunction

function scm_matlab#config()
    call s:config_matlab_screen()
endfunction

function s:config_matlab_screen()
    let g:matlab_screen_highlight_cell = 1
endfunction
