function scm_core#install()
    Plug 'liuchengxu/vim-which-key'
endfunction

function scm_core#config()
    call s:config_vim_which_key()
endfunction

function scm_core#preconfig_simple()
    set nocp
    set hls
    set tabstop=4 shiftwidth=4 softtabstop=1 expandtab smarttab
    set number
    set cc=80
    set cursorline
    syntax on
    set backspace=indent,eol,start
    set linebreak
    filetype plugin indent on
    "Auto close quickfix when only left
    aug QFClose
        au!
        au WinEnter * if winnr('$') == 1 &&
                    \getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
    aug END
endfunction

function s:config_vim_which_key()
    set timeoutlen=500
    let g:which_leader = {}
    call which_key#register(g:mapleader, "g:which_leader")
    exec 'nnoremap <silent> <leader> :<c-u>WhichKey '."'". g:mapleader."'".'<CR>'
    exec 'vnoremap <silent> <leader> :<c-u>WhichKeyVisual '."'".g:mapleader."'".'<CR>'

    let g:which_leader.y = 'Copy to clipboard'
    vnoremap <leader>y "+y
    let g:which_leader.p = 'Paste from clipboard'
    nnoremap <leader>p "+p

    "call s:config_vim_which_key_ctrl_w()
endfunction

function s:config_vim_which_key_ctrl_w()
    let g:which_ctrl_w = {}
    call which_key#register('<C-W>',"g:which_ctrl_w")
    nnoremap <C-W> :WhichKey '<lt>C-W>'<CR>
    nnoremap <C-W>w     <C-W>w
    nnoremap <C-W><C-W> <C-W>w
    nnoremap <C-W>l     <C-W>l
    nnoremap <C-W><C-L> <C-W>l
    let g:which_ctrl_w.w = ['<C-W>w', 'other-window']
    let g:which_ctrl_w.l = ['<C-W>l', 'left-window']
endfunction
