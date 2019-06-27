function scm_matlab#install()
    Plug 'yinflying/matlab-screen',{ 'on_ft' : 'matlab'}
    Plug 'yinflying/matlab.vim', {'on_ft' : 'matlab'}
    "Plug 'vim-scripts/TagHighlight', {'on_ft' : 'matlab'}
endfunction

function scm_matlab#config()
    call s:config_matlab_screen()
    "call s:config_TagHighlight()
endfunction

function s:config_matlab_screen()
    let g:matlab_screen_highlight_cell = 1
    let g:matlab_screen_default_mapping = 1
    let g:matlab_screen_terminal_height = 20
endfunction

function s:config_TagHighlight()
    if ! exists('g:TagHighlightSettings')
        let g:TagHighlightSettings = {}
    endif
    let s:TagHighlightDir = $HOME."/.cache/scm_vim/TagHighlight/"
    if !isdirectory(s:TagHighlightDir)
        call mkdir(s:TagHighlightDir,"p")
    endif
    let g:TagHighlightSettings['TagFileDirectory'] = s:TagHighlightDir
    let g:TagHighlightSettings['TypesFileDirectory'] = s:TagHighlightDir
    let g:TagHighlightSettings['PreUpdateHooks'] = 'scm_matlab#rm_TagHighlighDir'
endfunction

function scm_matlab#rm_TagHighlighDir()
    let s:TagHighlightDir = $HOME."/.cache/scm_vim/TagHighlight/"
    if filereadable(s:TagHighlightDir."tags")
        call delete(s:TagHighlightDir."tags")
        call delete(s:TagHighlightDir."*.taghl")
    endif
endfunction
