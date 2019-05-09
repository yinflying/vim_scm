function scm_cpp_ycm#install()
    Plug 'Valloric/YouCompleteMe',{ 'do': './install.py --clang-completer' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'Shougo/echodoc.vim'
    Plug 'rdnetto/YCM-Generator'
    Plug 'jeaye/color_coded'
    "Plug 'bbchung/clighter8'
endfunction

function scm_cpp_ycm#config()
    call s:config_youcompleteme()
    call s:config_ultisnips()
    call s:config_echodoc_vim()
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
    set noshowmode
    set cmdheight=1
    let g:echodoc#enable_at_startup=1
endfunction
