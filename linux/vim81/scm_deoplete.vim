function scm_deoplete#install()
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endfunction

function scm_deoplete#config()
    call s:config_ale()
endfunction

function s:config_ale()
    let g:deoplete#enable_at_startup = 1
endfunction
