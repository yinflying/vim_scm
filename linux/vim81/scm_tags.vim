function scm_tags#install()
    Plug 'majutsushi/tagbar', { 'on' : ['TagbarToggle'] }
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'
endfunction

function scm_tags#config()
    call s:config_tagbar()
    call s:config_vim_gutentags()
    call s:config_gutentags_plus()
endfunction

function s:config_tagbar()
    let g:which_leader.t = 'TagBar'
    nnoremap <leader>t :TagbarToggle<CR>

    let g:tagbar_left=0
    let g:tagbar_width=30
    let g:tagbar_autoclose=1
    let g:tagbar_autofocus=1
    let g:tagbar_compact=1
endfunction

function s:config_vim_gutentags()
    let g:gutentags_modules = ['ctags', 'gtags_cscope']
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg','.project']
    let g:gutentags_ctags_tagfile = '.tags'
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    let g:gutentags_auto_add_gtags_cscope = 0
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif
endfunction

function s:config_gutentags_plus()
    let g:gutentags_plus_switch = 1
    let g:gutentags_plus_nomap = 1
    noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
    noremap <silent> <leader>gG :GscopeFind g <C-R><C-W><cr>
    noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
    noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
    noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
    noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
    noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
    let g:which_leader.g = { 'name': '+GtagsFind',
                \ 's' : 'Find this symbol',
                \ 'G' : 'Find this definition',
                \ 'd' : 'Find funs called by this fun',
                \ 'c' : 'Find funs calling this fun',
                \ 't' : 'Find this text string',
                \ 'f' : 'Find this file',
                \ 'e' : 'Find this egrep pattern',
                \ 'i' : 'Find files #include this files',
                \ 'a' : 'Find places where assigned a value'
                \}
endfunction
