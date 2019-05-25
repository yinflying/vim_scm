function scm_rust#install()
    Plug 'rust-lang/rust.vim'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh'
        \ }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endfunction

function scm_rust#config()
    call s:config_rust_vim()
    call s:config_languageclient_neovim()
    call s:config_deoplete_nvim()
endfunction

function s:config_rust_vim()
endfunction

function s:config_languageclient_neovim()
    let l:rust_command = {'rust': ['rls'] }
    if exists('g:LanguageClient_serverCommands')
        let g:LanguageClient_serverCommands = extend(g:LanguageClient_serverCommands, l:rust_command)
    else
        let g:LanguageClient_serverCommands = l:rust_command
    endif

    let g:LanguageClient_loadSettings = 1 " absolute conf path
    let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')

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
