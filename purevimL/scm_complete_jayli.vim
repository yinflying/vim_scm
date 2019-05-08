function scm_complete_jayli#install()
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'
    Plug 'jayli/vim-easycomplete'
    Plug 'jayli/vim-dictionary'
endfunction

function scm_complete_jayli#config()
    call s:config_vim_easycomplete()
endfunction

function s:config_vim_easycomplete()
    let g:pmenu_scheme = 'dark'
    imap <Tab>   <Plug>EasyCompTabTrigger
    imap <S-Tab> <Plug>EasyCompShiftTabTrigger
endfunction
