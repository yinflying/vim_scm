function scm_cpp_ycm#install()
    Plug 'Valloric/YouCompleteMe',{ 'do': './install.py --clang-completer' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'Shougo/echodoc.vim'
    Plug 'rdnetto/YCM-Generator'
    Plug 'jeaye/color_coded'
    Plug 'vim-scripts/a.vim'
    Plug 'gauteh/vim-cppman'
    Plug 'vhdirk/vim-cmake'
    Plug 'Chiel92/vim-autoformat'
endfunction

function scm_cpp_ycm#config()
    call s:config_youcompleteme()
    call s:config_ultisnips()
    call s:config_echodoc_vim()
    call s:config_vim_cppman()
    call s:config_vim_cmake()
    call s:config_vim_autoformat()
endfunction

function s:config_youcompleteme()
    let g:ycm_semantic_triggers =  {
          \ 'c': ['re!\w\w'],
          \ 'cs,lua,javascript': ['re!\w\w'],
          \ }
    set completeopt=menu,menuone
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_complete_in_comments = 1
    let g:ycm_min_num_of_chars_for_completion=2
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_global_ycm_extra_conf=
    \'~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

    let g:which_leader.g = { 'name': '+Ycm' }
    nnoremap <leader>gC :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gF :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    let g:ycm_key_detailed_diagnostics = '<leader>gD'
endfunction

function s:config_ultisnips()
    " Make ultisnips work with ycm without shortcut comflict
    function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                call UltiSnips#JumpForwards()
                if g:ulti_jump_forwards_res == 0
                    return "\<TAB>"
                endif
            endif
        endif
        return ""
    endfunction
    function! g:UltiSnips_Reverse()
        call UltiSnips#JumpBackwards()
        if g:ulti_jump_backwards_res == 0
            return "\<C-P>"
        endif
        return ""
    endfunction
    if !exists("g:UltiSnipsJumpForwardTrigger")
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
    endif
    if !exists("g:UltiSnipsJumpBackwardTrigger")
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    endif

    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger .
                \ " <C-R>=g:UltiSnips_Complete()<cr>"
    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger .
                \ " <C-R>=g:UltiSnips_Reverse()<cr>"
endfunction

function s:config_echodoc_vim()
    let g:echodoc#enable_at_startup=1
    set noshowmode
    set cmdheight=1
endfunction

function s:config_vim_cppman()
    "Solve auto-pairs&ycm bug: should NOT contain '[',']' as keyword
    au FileType c,cpp setl iskeyword=@,48-57,_,192-255,:
endfunction

function s:config_vim_cmake()
    let g:which_leader.M = { 'name': '+CMake/make',
                \ 'c' : 'Run cmake ../ under cloest build dir',
                \ 'm' : 'Run make',
                \ 'r' : 'Clean all under build dir',
                \ 'f' : 'Find Buid Dir' }
    nnoremap <leader>Mc :CMake<CR>
    nnoremap <leader>Mm :make<CR>
    nnoremap <leader>Mr :CMakeClean<CR>
    nnoremap <leader>Mf :CMakeFindBuildDir<CR>
    let g:cmake_ycm_symlinks = 1
endfunction

function s:config_vim_autoformat()
    let g:which_leader.F =  'Auto Format'
    noremap <leader>F :Autoformat<CR>
endfunction
