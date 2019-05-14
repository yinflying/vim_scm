function scm_git#install()
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'
endfunction

function scm_git#config()
    call s:config_vim_fugitive()
    call s:config_nerdtree_git_plugin()
endfunction

function s:config_vim_fugitive()
endfunction

function s:config_nerdtree_git_plugin()
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "±",
        \ "Staged"    : "Ŝ",
        \ "Untracked" : "Ū",
        \ "Renamed"   : "Ř",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "×",
        \ "Dirty"     : "Ð",
        \ "Clean"     : "Ĉ",
        \ 'Ignored'   : 'Ī',
        \ "Unknown"   : "?"
        \ }
endfunction
