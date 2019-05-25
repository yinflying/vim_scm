function scm_cpp#install()
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh'
        \ }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endfunction

function scm_cpp#config()
    call s:config_vim_cpp_enhanced_highlight()
    call s:config_languageclient_neovim()
    call s:config_deoplete_nvim()
endfunction

function s:config_vim_cpp_enhanced_highlight()
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_experimental_template_highlight = 1
    let g:cpp_concepts_highlight = 1
endfunction

function s:config_languageclient_neovim()
    let l:cpp_command = {
                \ 'cpp': ['ccls', '--init={"clang": {"extraArgs": ["-std=c++17"]}}'],
                \ 'c': ['ccls'] 
                \}
    if exists('g:LanguageClient_serverCommands')
        let g:LanguageClient_serverCommands = extend(g:LanguageClient_serverCommands, l:cpp_command)
    else
        let g:LanguageClient_serverCommands = l:cpp_command
    endif

    let g:LanguageClient_loadSettings = 1 " absolute conf path
    let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')

    " formatting
    fu! C_init()
        set formatexpr=LanguageClient#textDocument_rangeFormatting()
    endf
    au FileType c,cpp :call C_init()

    nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
    nnoremap <silent> <leader>f :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <silent> <leader>x :call LanguageClient#textDocument_references()<CR>
    nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> <leader>s :call LanguageClient#textDocument_documentSymbol()<CR>
endfunction

function s:config_deoplete_nvim()
    let g:deoplete#enable_at_startup = 1
endfunction
