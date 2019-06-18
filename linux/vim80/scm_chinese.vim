function scm_chinese#install()
    Plug 'vim-scripts/fcitx.vim'
endfunction

function scm_chinese#config()
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
endfunction
